from django.forms import ModelForm
from app.models import Organizadora, Telefone

# Create the form class.
class OrganizadoraEvento(ModelForm):
     class Meta:
         model = Organizadora
         fields = ['cnpj','nome_real', 'nome_fantasia']

