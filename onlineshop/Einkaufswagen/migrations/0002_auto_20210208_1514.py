# Generated by Django 3.1.3 on 2021-02-08 14:14

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Users', '0001_initial'),
        ('Einkaufswagen', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='bestellunginfo',
            name='Bestellung_User',
            field=models.ForeignKey(default=None, on_delete=django.db.models.deletion.CASCADE, to='Users.user'),
        ),
    ]
