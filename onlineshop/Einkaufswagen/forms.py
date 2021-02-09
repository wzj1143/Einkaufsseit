from django import forms

class Bestellung_abgeben_form(forms.Form):
    Adresse = forms.CharField(label="Adresse",max_length=256,widget=forms.TextInput(attrs={'class': 'form-control'}))
    Empfaenger = forms.CharField(label="Empfaenger",max_length=256,widget=forms.TextInput(attrs={'class': 'form-control'}))
    Telefonnummer = forms.CharField(label="Telefonnummer",max_length=256,widget=forms.TextInput(attrs={'class': 'form-control'}))
    Anmerkung = forms.CharField(label="Anmerkung",max_length=1024,widget=forms.TextInput(attrs={'class': 'form-control'}))
