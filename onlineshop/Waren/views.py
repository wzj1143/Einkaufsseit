from django.shortcuts import render
from Waren.models import WarenKategorien, WarenInfo


# Create your views here.

# Homepage
def index(request):
    # nehmen neue Produke, die lezte 2 Produke aus jeder Katogorien
    # nehmen alle Produkte, die erste 2 Produkte aus jeder Kategorien
    waren_katg = WarenKategorien.objects.all()
    all_neu_list=[]
    all_all_list=[]
    for k in waren_katg:
        k.neu_list = WarenInfo.objects.filter(Ware_Kategorien = k).order_by("-id")[:2]
        all_neu_list.append(k.neu_list)
        k.all_list = WarenInfo.objects.filter(Ware_Kategorien = k).order_by("id")[:2]
        all_all_list.append(k.all_list)

    # zeigen Waren in Einkaufswagen(benutzen cookie: waren_id,waren_menge)
    waren_gesamt_Menge_in_Einkaufswagen = 0
    all_waren = request.COOKIES.items()
    for waren_id,waren_menge in all_waren:
        # waren_id muss digit sein,
        # wenn jetzt diese waren_menge nicht ein Teil von Waren,pruefen naechste waren_id
        if not waren_id.isdigit():
            continue
        # Holen die Waren in den aktuell durchlaufenen Cookie
        get_waren = WarenInfo.objects.get(id=waren_id)
        get_waren.waren_menge=waren_menge   # menge jeder Ware
        # rechnen gezamt Waren Menge in Einkaufswagen
        waren_gesamt_Menge_in_Einkaufswagen += int(waren_menge)

    #para3: daten muss in template gegeben werden
    # include:Warenkategorie,Waren in Einkaufswagen, gesamt Menge in Einkaufswagen
    return render(request, 'index.html',{
                                        'all_neu_list':all_neu_list,
                                        'all_all_list':all_all_list,
                                         'waren_gesamt_Menge_in_Einkaufswagen':waren_gesamt_Menge_in_Einkaufswagen,
                                        'neu_list':k.neu_list,
                                        'all_list':k.all_list,
                                         })
# Homepage
def angemeldete_homepage(request):
    # nehmen neue Produke, die lezte 2 Produke aus jeder Katogorien
    # nehmen alle Produkte, die erste 2 Produkte aus jeder Kategorien
    waren_katg = WarenKategorien.objects.all()
    all_neu_list=[]
    all_all_list=[]
    for k in waren_katg:
        k.neu_list = WarenInfo.objects.filter(Ware_Kategorien = k).order_by("-id")[:2]
        all_neu_list.append(k.neu_list)
        k.all_list = WarenInfo.objects.filter(Ware_Kategorien = k).order_by("id")[:2]
        all_all_list.append(k.all_list)

    # zeigen Waren in Einkaufswagen(benutzen cookie: waren_id,waren_menge)
    waren_gesamt_Menge_in_Einkaufswagen = 0
    all_waren = request.COOKIES.items()
    for waren_id,waren_menge in all_waren:
        # waren_id muss digit sein,
        # wenn jetzt diese waren_menge nicht ein Teil von Waren,pruefen naechste waren_id
        if not waren_id.isdigit():
            continue
        # Holen die Waren in den aktuell durchlaufenen Cookie
        get_waren = WarenInfo.objects.get(id=waren_id)
        get_waren.waren_menge=waren_menge   # menge jeder Ware
        # rechnen gezamt Waren Menge in Einkaufswagen
        waren_gesamt_Menge_in_Einkaufswagen += int(waren_menge)

    #para3: daten muss in template gegeben werden
    # include:Warenkategorie,Waren in Einkaufswagen, gesamt Menge in Einkaufswagen
    return render(request, 'angemeldete_homepage.html',{
                                        'all_neu_list':all_neu_list,
                                        'all_all_list':all_all_list,
                                         'waren_gesamt_Menge_in_Einkaufswagen':waren_gesamt_Menge_in_Einkaufswagen,
                                        'neu_list':k.neu_list,
                                        'all_list':k.all_list,
                                         })


# Waren Information werden auf einer separaten Seite angezeigt
def Waren_Seite(request):
    # Warenkategorie abfragen
    Kategorien_Waren = WarenKategorien.objects.all()

    waren_gesamt_Menge_in_Einkaufswagen = 0
    all_waren = request.COOKIES.items()
    for waren_id, waren_menge in all_waren:
        # waren_id muss digit sein,
        # wenn jetzt diese waren_menge nicht ein Teil von Waren,pruefen naechste waren_id
        if not waren_id.isdigit():
            continue
        # Holen die Waren in den aktuell durchlaufenen Cookie
        get_waren = WarenInfo.objects.get(id=waren_id)
        get_waren.Ware_Meng = waren_menge  # menge jeder Ware
        # rechnen gezamt Waren Menge in Einkaufswagen
        waren_gesamt_Menge_in_Einkaufswagen += int(waren_menge)

    # Holen die id des übergebenen Ware
    akt_ware_id = request.GET.get("id", 1)
    # aktuelle Information des Ware
    akt_ware_info = WarenInfo.objects.get(id=akt_ware_id)


    return render(request, 'Waren_Seite.html', {"waren_gesamt_Menge_in_Einkaufswagen":waren_gesamt_Menge_in_Einkaufswagen,
                                                 "akt_ware_info":akt_ware_info})

# zeigen alle Waren von jede Kategorien
def Waren_katg(request):
    # Holen die gegebene Kategorien id
    katg_id = request.GET.get('katg', 1)
    katg_geg = WarenKategorien.objects.get(id = katg_id)
    # Holen alle Waren in diese Kategorie
    alle_waren_katg = WarenInfo.objects.filter(Ware_Kategorien = katg_geg)


    # Einkaufswagen
    waren_gesamt_Menge_in_Einkaufswagen = 0
    all_waren = request.COOKIES.items()
    for waren_id, waren_menge in all_waren:
        # waren_id muss digit sein,
        # wenn jetzt diese waren_menge nicht ein Teil von Waren,pruefen naechste waren_id
        if not waren_id.isdigit():
            continue
        # Holen die Waren in den aktuell durchlaufenen Cookies
        get_waren = WarenInfo.objects.get(id=waren_id)
        get_waren.Ware_Meng = waren_menge  # menge jeder Ware
        # rechnen gezamt Waren Menge in Einkaufswagen
        waren_gesamt_Menge_in_Einkaufswagen += int(waren_menge)
    return render(request, "Waren_katg.html", {'alle_waren_katg':alle_waren_katg,
                                               'katg_geg' : katg_geg,
                                               'waren_gesamt_Menge_in_Einkaufswagen': waren_gesamt_Menge_in_Einkaufswagen})