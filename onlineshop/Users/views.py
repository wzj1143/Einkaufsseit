from django.http import  HttpResponseRedirect
from django.shortcuts import render, redirect


from Einkaufswagen.models import BestellungInfo, BestellungDetails
from Waren.models import WarenInfo
from . import models
from .models import User
from .forms import UserForm,RegisterForm


# Create your views here.
def User_Register(request):

    # zeigen Waren in Einkaufswagen(benutzen cookie: waren_id,waren_menge)
    waren_gesamt_Menge_in_Einkaufswagen = 0
    all_waren = request.COOKIES.items()
    for waren_id, waren_menge in all_waren:
        # waren_id muss digit sein,
        # wenn jetzt diese waren_menge nicht ein Teil von Waren,pruefen naechste waren_id
        if not waren_id.isdigit():
            continue
        # Holen die Waren in den aktuell durchlaufenen Cookie
        get_waren = WarenInfo.objects.get(id=waren_id)
        get_waren.waren_menge = waren_menge  # menge jeder Ware
        # rechnen gezamt Waren Menge in Einkaufswagen
        waren_gesamt_Menge_in_Einkaufswagen += int(waren_menge)
    if request.method == "POST":
        register_form = RegisterForm(request.POST)
        message = "unvollstaendige Information！"
        if register_form.is_valid():
            username = register_form.cleaned_data['username']
            password = register_form.cleaned_data['password']
            Email = register_form.cleaned_data['Email']
            adress = register_form.cleaned_data['adress']
            same_name_user = models.User.objects.filter(username=username)
            if same_name_user:
                message = 'Username hat schon existiert'
                return render(request, 'User_Register.html', locals())
            same_email_user = models.User.objects.filter(Email=Email)
            if same_email_user:
                message = 'Email Address hat schon existiert'
                return render(request, 'User_Register.html', locals())



            new_user = models.User.objects.create()
            new_user.username = username
            new_user.password = password
            new_user.Email = Email
            new_user.adress = adress
            new_user.save()
            return render(request, 'User_anmelden.html', locals())
    register_form = RegisterForm()
    return render(request, 'User_Register.html', locals())


def User_anmelden(request):
    login_form = UserForm()
    # zeigen Waren in Einkaufswagen(benutzen cookie: waren_id,waren_menge)
    waren_gesamt_Menge_in_Einkaufswagen = 0
    all_waren = request.COOKIES.items()
    for waren_id, waren_menge in all_waren:
        # waren_id muss digit sein,
        # wenn jetzt diese waren_menge nicht ein Teil von Waren,pruefen naechste waren_id
        if not waren_id.isdigit():
            continue
        # Holen die Waren in den aktuell durchlaufenen Cookie
        get_waren = WarenInfo.objects.get(id=waren_id)
        get_waren.waren_menge = waren_menge  # menge jeder Ware
        # rechnen gezamt Waren Menge in Einkaufswagen
        waren_gesamt_Menge_in_Einkaufswagen += int(waren_menge)

    if request.session.get('is_login',None):
        return redirect('/index')
    if request.method == "POST":
        login_form = UserForm(request.POST)
        if login_form.is_valid():
            username = login_form.cleaned_data['username']
            password = login_form.cleaned_data['password']
            try:
                user = models.User.objects.get(username=username)
                if user.password == password:
                    request.session['is_login'] = True
                    request.session['user_name'] = user.username
                    return redirect('/index/')
                else:
                    message = "wrong password!！"
            except:
                message = "no username!"
        return render(request, 'User_anmelden.html', locals())



    return render(request, 'User_anmelden.html', locals())


def User_abmelden(request):
    if not request.session.get('is_login', None):
        return redirect("/index/")
    response = HttpResponseRedirect('/index')
    all_waren = request.COOKIES.items()
    for waren_id, waren_menge in all_waren:
        # waren_id muss digit sein,
        # wenn jetzt diese waren_menge nicht ein Teil von Waren,pruefen naechste waren_id
        if not waren_id.isdigit():
            continue
        # delete Daten von Einkaufswagen(in cookie)
        response.delete_cookie(waren_id)
    response.delete_cookie('username')
    request.session.flush()
    return response

def user_Bestellungen(request):
    # zeigen Waren in Einkaufswagen(benutzen cookie: waren_id,waren_menge)
    waren_gesamt_Menge_in_Einkaufswagen = 0
    all_waren = request.COOKIES.items()
    for waren_id, waren_menge in all_waren:
        # waren_id muss digit sein,
        # wenn jetzt diese waren_menge nicht ein Teil von Waren,pruefen naechste waren_id
        if not waren_id.isdigit():
            continue
        # Holen die Waren in den aktuell durchlaufenen Cookie
        get_waren = WarenInfo.objects.get(id=waren_id)
        get_waren.waren_menge = waren_menge  # menge jeder Ware
        # rechnen gezamt Waren Menge in Einkaufswagen
        waren_gesamt_Menge_in_Einkaufswagen += int(waren_menge)

    ware_in_jede_Bestellung=[]
    ware_in_Bestellung_dic={}
    bestellung_obj_list=[]

    user_name = request.session['user_name']
    users_list = User.objects.all()
    for u in users_list:
        if user_name==u.username:
            user_id=u.id

    bestellung_list = BestellungInfo.objects.all()

    for b in bestellung_list:
        if user_id == b.Bestellung_User_id:
            bestellung_obj_list.append(b)

    for b in bestellung_obj_list:
        bestellung_detail_list = BestellungDetails.objects.all()
        for d in bestellung_detail_list:
            if b.id == d.Ware_Bestellung.id:
                ware_in_jede_Bestellung.append(d)
        ware_in_Bestellung_dic[b.Bestellung_Nummer]=ware_in_jede_Bestellung
        ware_in_jede_Bestellung=[]




    return render(request, 'user_Bestellungen.html', {"bestellung_obj_list":bestellung_obj_list,
                                                      "ware_in_Bestellung_dic":ware_in_Bestellung_dic,
                                                      "ware_in_jede_Bestellung":ware_in_jede_Bestellung,
                  'waren_gesamt_Menge_in_Einkaufswagen':waren_gesamt_Menge_in_Einkaufswagen,}
                  )
