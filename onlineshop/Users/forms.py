from django import forms


class UserForm(forms.Form):
    username = forms.CharField(label="username", max_length=128)
    password = forms.CharField(label="password", max_length=256, widget=forms.PasswordInput)

class RegisterForm(forms.Form):
    username = forms.CharField(label="username", max_length=128, widget=forms.TextInput(attrs={'class': 'form-control'}))
    password = forms.CharField(label="password", max_length=256, widget=forms.PasswordInput(attrs={'class': 'form-control'}))
    Email = forms.EmailField(label="Email", widget=forms.EmailInput(attrs={'class': 'form-control'}))
    adress = forms.CharField(label="adress",max_length=256,widget=forms.TextInput(attrs={'class': 'form-control'}))
