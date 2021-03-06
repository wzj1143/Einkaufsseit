"""onlineshop URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.views.static import serve
from django.contrib import admin
from django.urls import path, re_path
from django.conf import settings
from django.conf.urls.static import static
from Einkaufswagen import views

from Einkaufswagen.views import Wagen_legen, Wagen_Seite, Waren_delete, Bestellung_abgeben_Seite, \
    Bestellung_abegeben_fertig, Bestellung_erfolgreich
from Users.views import User_Register, User_abmelden, User_anmelden, user_Bestellungen
from Waren.views import index, Waren_Seite, Waren_katg, angemeldete_homepage

urlpatterns = [
    path('', views.index),
    path('admin/', admin.site.urls),
    # Homepage, nicht anmelden
    re_path(r'^index/$', index),
    # Waren_Seite
    re_path(r'^Waren_Seite/$', Waren_Seite),
    # In den Warenkorb legen
    re_path(r'^Wagen_legen/$', Wagen_legen),
    # Waren_katg Seite
    re_path(r'^Waren_katg/$', Waren_katg),
    # Einkaufswagen Seite
    re_path(r'^Wagen_Seite/$', Wagen_Seite),
    # delete ware von Einkaufswagen
    re_path(r'^Waren_delete/$', Waren_delete),
    # Bestellung abgeben Seite(Empfaenger Information ist leer)
    re_path(r'^Bestellung_abgeben_Seite/$', Bestellung_abgeben_Seite),
    # Bestellung hat schon abgegeben(Empfaenger Information speichern)
    re_path(r'^Bestellung_abegeben_fertig/$', Bestellung_abegeben_fertig),
    # Bestellung erfolgreich zeigen
    re_path(r'^Bestellung_erfolgreich/$', Bestellung_erfolgreich),
    # User registerieren
    re_path(r'^User_Register/$', User_Register),
    # User anmelden
    re_path(r'^User_anmelden/$', User_anmelden),
    # User abmelden
    re_path(r'^User_abmelden/$', User_abmelden),
    # User Bestellungen
    re_path(r'^user_Bestellungen/$', user_Bestellungen),
    re_path(r'^static/(?P<path>.*)$', serve, {'document_root': settings.STATIC_ROOT}, name='static'),
]
