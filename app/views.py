from django.shortcuts import render, redirect
from app.forms import OrganizadoraEvento, Telefone_organizadora
from app.models import Organizadora, Telefone

# Create your views here.
def home(request):
    data = {}
    search = request.GET.get('search')
    if search:
        data['db'] = Organizadora.objects.filter(cnpj__icontains=search)
    else:
        data['db'] = Organizadora.objects.all()
    return render(request, 'index.html', data)

def form(request):
    data = {}
    data['form'] = OrganizadoraEvento()
    data['telefone'] = Telefone_organizadora()
    return render(request, 'form.html', data)

def create(request):
    form = OrganizadoraEvento(request.POST or None)
    telefone = Telefone_organizadora(request.POST or None)
    if form.is_valid():
        form.save()
        telefone.save()
        return redirect('home')
    
def view(request, pk):
    data = {}
    data['db'] = Organizadora.objects.get(pk=pk)
    data['tel'] = Telefone.objects.get(pk=pk)
    return render(request, "view.html", data)

def edit(request, pk):
    data = {}
    data['db'] = Organizadora.objects.get(pk=pk)
    data['form'] = OrganizadoraEvento(instance=data['db'])
    data['tel'] = Telefone.objects.get(pk=pk)
    data['telefone'] = Telefone_organizadora(instance=data['tel'])
    return render(request, 'form.html', data)

def update(request, pk):
    data = {}
    data['db'] = Organizadora.objects.get(pk=pk)
    form = OrganizadoraEvento(request.POST or None, instance=data['db'])
    data['tel'] = Telefone.objects.get(pk=pk)
    telefone = Telefone_organizadora(request.POST or None, instance=data['tel'])
    if form.is_valid():
        form.save()
        telefone.save()
    return redirect('home')

def delete(request, pk):
    db = Organizadora.objects.get(pk=pk)
    db.delete()
    return redirect('home')