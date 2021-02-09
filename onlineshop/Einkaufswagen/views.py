import time
from decimal import Decimal

from django.http import HttpResponse
from django.shortcuts import render, redirect

from .forms import Bestellung_abgeben_form

# Create your views here.
from Einkaufswagen.models import BestellungInfo, BestellungDetails
from . import models as models1
from Users import models as models2
from Waren.models import WarenInfo


# In den Warenkorb legen
def index(request):
	return render(request, 'index.html')
def Wagen_legen(request):
    """ in Warenkorb und cookie legen, in cookie ist: Waren_id:menge"""
    # Wenn nicht angemelden, muss zuerst anmelden
    if 'user_name' in request.session:
        username = request.session['user_name']
        user = models2.User.objects.get(username=username)
    else:
        return render(request, 'User_anmelden.html')
    if user is None:
        return render(request, 'User_anmelden.html')
    # Holen die gelieferte Ware id
    ware_id = request.GET.get("id", " ")
    if ware_id:  # wenn ware existiert
        url_von_vorher_Waren_seite = request.META["HTTP_REFERER"]
        # Holen response
        response = redirect(url_von_vorher_Waren_seite)
        # Holen die vorherigen Menge der Ware im Warenkorb
        ware_menge = request.COOKIES.get(ware_id)
        # wenn schon im Warenkorb, menge+1
        if ware_menge:
            ware_menge = int(ware_menge) + 1
        # sonst setze die Menge als 1
        else:
            ware_menge = 1
        # Speichern Ware id in cookie
        response.set_cookie(ware_id, ware_menge)
    return response


# Einkaufswagen Seite zeigen
def Wagen_Seite(request):
    # Waren liste in Einkaufswagen
    waren_in_Einkaufswagen_list = []

    # Waren Menge in Einkaufswagen
    waren_gesamt_Menge_in_Einkaufswagen = 0

    # Gesamt Preis in Einkaufswagen
    waren_gesamt_Preis_in_Einkaufswagen = 0

    ware_gesamt_preis_dic={}
    total_kost=0

    # Holen Daten aud cookie waren_id:waren_menge
    all_waren = request.COOKIES.items()
    for waren_id, waren_menge in all_waren:
        # waren_id muss digit sein,
        # wenn jetzt diese waren_menge nicht ein Teil von Waren,pruefen naechste waren_id
        if not waren_id.isdigit():
            continue
        # Holen die Waren in den aktuell durchlaufenen Cookies
        get_waren = WarenInfo.objects.get(id=waren_id)
        get_waren.waren_menge = int(waren_menge)  # menge jeder Ware
        # Gesamt Preis dieser Ware
        ware_gesamt_preis = get_waren.waren_menge * get_waren.Ware_Preis
        ware_gesamt_preis = float(ware_gesamt_preis*1000)/1000
        ware_gesamt_preis_dic[get_waren.Ware_Name]=ware_gesamt_preis
        # Waren in waren_in_Einkaufswagen_list ablegen
        waren_in_Einkaufswagen_list.append(get_waren)
        # rechnen gezamt Waren Menge in Einkaufswagen
        waren_gesamt_Menge_in_Einkaufswagen += int(waren_menge)
        # Gesamt Preis in Einkaufswagen
        waren_gesamt_Preis_in_Einkaufswagen += ware_gesamt_preis
        waren_gesamt_Preis_in_Einkaufswagen=float(waren_gesamt_Preis_in_Einkaufswagen*1000)/1000
         #gesamt kosten mit lieferungskosten
        total_kost = waren_gesamt_Preis_in_Einkaufswagen+3.99



    return render(request, "Wagen_Seite.html", {'waren_in_Einkaufswagen_list': waren_in_Einkaufswagen_list,
                                                'waren_gesamt_Menge_in_Einkaufswagen': waren_gesamt_Menge_in_Einkaufswagen,
                                                'waren_gesamt_Preis_in_Einkaufswagen': waren_gesamt_Preis_in_Einkaufswagen,
                                                'ware_gesamt_preis_dic':ware_gesamt_preis_dic,
                                                'total_kost':total_kost,
                                                })


# delete Waren von Einkaufswagen
def Waren_delete(request):
    # get ware id, die zu entfernt wird
    ware_id = request.GET.get('id', '')
    if ware_id:
        url_von_vorher_Einkaufswagen_seite = request.META['HTTP_REFERER']
        response = redirect(url_von_vorher_Einkaufswagen_seite)
        # wenn diese Ware in cookies
        ware_menge = request.COOKIES.get(ware_id, '')
        if ware_menge:
            response.delete_cookie(ware_id)

    return response


# Bestellung abgeben Seite(Empfaenger Information ist leer)
def Bestellung_abgeben_Seite(request):
    # Waren liste in Einkaufswagen
    waren_in_Einkaufswagen_list = []

    # Waren Menge in Einkaufswagen
    waren_gesamt_Menge_in_Einkaufswagen = 0

    # Gesamt Preis in Einkaufswagen
    waren_gesamt_Preis_in_Einkaufswagen = 0

    # total Preis mit lieferungspreis
    total_price=0

    ware_gesamt_preis_dic = {}

    # Holen Daten aud cookie waren_id:waren_menge
    all_waren = request.COOKIES.items()
    for waren_id, waren_menge in all_waren:
        # waren_id muss digit sein,
        # wenn jetzt diese waren_menge nicht ein Teil von Waren,pruefen naechste waren_id
        if not waren_id.isdigit():
            continue
        # Holen die Waren in den aktuell durchlaufenen Cookies
        get_waren = WarenInfo.objects.get(id=waren_id)
        get_waren.waren_menge = int(waren_menge)  # menge jeder Ware
        # Gesamt Preis dieser Ware
        ware_gesamt_preis = float(Decimal(str(int(waren_menge))) * Decimal(str(get_waren.Ware_Preis)))
        ware_gesamt_preis_dic[get_waren.Ware_Name] = ware_gesamt_preis
        # Waren in waren_in_Einkaufswagen_list ablegen
        waren_in_Einkaufswagen_list.append(get_waren)
        # rechnen gezamt Waren Menge in Einkaufswagen
        waren_gesamt_Menge_in_Einkaufswagen += int(waren_menge)
        # Gesamt Preis in Einkaufswagen
        waren_gesamt_Preis_in_Einkaufswagen += ware_gesamt_preis
    total_price=float(Decimal(str((waren_gesamt_Preis_in_Einkaufswagen)))+Decimal(str(3.99)))

    return render(request, 'Bestellung_abgeben_Seite.html', {'waren_in_Einkaufswagen_list': waren_in_Einkaufswagen_list,
                                                             'waren_gesamt_Menge_in_Einkaufswagen': waren_gesamt_Menge_in_Einkaufswagen,
                                                             'waren_gesamt_Preis_in_Einkaufswagen': waren_gesamt_Preis_in_Einkaufswagen,
                                                             'ware_gesamt_preis_dic': ware_gesamt_preis_dic,
                                                             'total_price': total_price})


# Bestellung hat schon abgegeben(Empfaenger Information speichern)
def Bestellung_abegeben_fertig(request):
    if request.method == "POST":
        information_form = Bestellung_abgeben_form(request.POST)
        message = "unvollstaendige Information"
        if information_form.is_valid():
            Adresse = information_form.cleaned_data['Adresse']
            Empfaenger = information_form.cleaned_data['Empfaenger']
            Telefonnummer = information_form.cleaned_data['Telefonnummer']
            Anmerkung = information_form.cleaned_data['Anmerkung']
            if not (Adresse and Empfaenger and Telefonnummer and Anmerkung):
                response = HttpResponse('Unvollstaendige Information')
                return response


            username = request.session['user_name']
            user = models2.User.objects.get(username=username)

            new_Bestellung = models1.BestellungInfo.objects.create()
            new_Bestellung.Bestellung_Add = Adresse
            new_Bestellung.Bestellung_Empf = Empfaenger
            new_Bestellung.Bestellung_Tel = Telefonnummer
            new_Bestellung.Bestellung_Anmerkung = Anmerkung
            new_Bestellung.Bestellung_Nummer = str(time.time() * 1000) + str(time.perf_counter() * 100000)
            new_Bestellung.Bestellung_User = user
            new_Bestellung.save()





    # jump nach Bestellung_erfolgreich Seite
    response = redirect('/Bestellung_erfolgreich/?id=%s' % new_Bestellung.Bestellung_Nummer)

    # Holen Daten aud cookie waren_id:waren_menge
    all_waren = request.COOKIES.items()
    for waren_id, waren_menge in all_waren:
        # waren_id muss digit sein,
        # wenn jetzt diese waren_menge nicht ein Teil von Waren,pruefen naechste waren_id
        if not waren_id.isdigit():
            continue
        # Holen waren Objekte
        waren_in_korb = WarenInfo.objects.get(id=waren_id)
        # erzeugen BestellungDetails Instanz
        Bestellung_details = BestellungDetails()
        # addieren Waren Objekte in BestellungDetails
        #Bestellung_details.Ware_Kate_id = waren_in_korb.Ware_Kategorien_id
        Bestellung_details.Ware_Kate_id = waren_in_korb.id
        #print(Bestellung_details.Ware_Kate_id)
        # Menge der Waren
        Bestellung_details.Ware_Meng = waren_menge
        # gehort Bestellung
        Bestellung_details.Ware_Bestellung = new_Bestellung
        # Waren in Datanbank speichern
        Bestellung_details.save()
        # delete Daten von Einkaufswagen(in cookie)
        response.delete_cookie(waren_id)
    return response


# Bestellung erfolgreich zeigen
def Bestellung_erfolgreich(request):
    # holen gegebene Bestellungs id
    Bestellung_num = request.GET.get('id')
    # holen Bestellung Instanz
    Bestellung_info = BestellungInfo.objects.get(Bestellung_Nummer=Bestellung_num)
    Bestellung_waren_list = BestellungDetails.objects.filter(Ware_Bestellung=Bestellung_info)
    for i in Bestellung_waren_list:
        print(i.Ware_Kate.Ware_Name)
    gesamt_preis_Wagen = 0
    gesamt_num_Wagen = 0
    ware_gesamt_preis_dic = {}
    for ware in Bestellung_waren_list:
        waren_gesamt_preis = ware.Ware_Kate.Ware_Preis * ware.Ware_Meng
        gesamt_preis_Wagen += waren_gesamt_preis
        gesamt_preis_Wagen = float(gesamt_preis_Wagen*100)/100
        gesamt_num_Wagen += ware.Ware_Meng
        ware_gesamt_preis_dic[ware.Ware_Kate.Ware_Name] = waren_gesamt_preis
    total_price = float(Decimal(str(gesamt_preis_Wagen)) + Decimal(str(3.99)))

    return render(request, "Bestellung_erfolgreich.html", {"Bestellung_info": Bestellung_info,
                                                           'Bestellung_waren_list': Bestellung_waren_list,
                                                           'gesamt_preis_Wagen': gesamt_preis_Wagen,
                                                           'ware_gesamt_preis_dic': ware_gesamt_preis_dic,
                                                           'total_price': total_price,
                                                           'gesamt_num_Wagen': gesamt_num_Wagen})
