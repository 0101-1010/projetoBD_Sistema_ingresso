from django.db import models


# Create your models here.

class Organizadora(models.Model):
    cnpj = models.IntegerField(primary_key= True)
    nome_real = models.CharField(max_length=45)
    nome_fantasia = models.CharField(max_length=45)

#class Telefone(models.Model):
    #organizadora_cnpj = models.IntegerField(Organizadora.cnpj)
    #telefone = models.CharField(max_length=45)