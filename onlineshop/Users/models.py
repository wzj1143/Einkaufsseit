from django.db import models
# Create your models here.

class User(models.Model):

    username = models.CharField(max_length=32, unique=True)
    password = models.CharField(max_length=255)
    adress = models.CharField(max_length=200)
    Email = models.CharField(max_length=200)

