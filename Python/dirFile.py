# File: dirFile.py
# Autor: Carlos Margullón Sánchez
# Fecha: 28-03-2025

import os
import shutil

listaFicheros = []
listaDirectorios = []

fich = open("rutas.txt", "r")
for a in fich.readlines():
    r = a.strip()
    if os.path.isdir(r):
        listaDirectorios.append(r)
    elif os.path.isfile(r):
        listaFicheros.append(r)

print("Menu de opciones")
print("")
print("A - Pedir nombre de fichero y eliminarlo.")
print("B - Pedir nombre de directorio y mostrar su información.")
print("C -  Pedir nombre de fichero, nombre de destino y copiarlo en dicho destino.")
print("D - Mostrar lista elegida por el usuario")
print("E - Salir")

while True:
    print("")
    op = input("Selecciona la opción que desees: ")
    print("")
    match op:
        case "A":
            namefich = input("Dime el nombre del fichero: ")
            print("")
            if namefich in listaFicheros:
                os.remove(os.path.abspath(namefich))
                print("Borrando...")
            else:
                print("El fichero no pertenece a la lista.")
        case "B":
            namedir = input("Dime el nombre de un directorio: ")
            if namedir in listaDirectorios:
                for a in os.listdir(namedir):
                    print(a)
            else:
                print("El directorio no pertenece a la lista.")
        case "C":
            namefich=input("Dime el nombre del fichero:  ")
            destino=input("Dime donde quieres copiar el fichero: ")
            print("")
            if namefich in listaFicheros:
                shutil.copy(namefich, destino)
                print("Copiando...")
            else:
                print("El fichero no pertenece a la lista...")
        case "D":
            print("1 - Lista de directorios")
            print("2 - Lista de ficheros")
            print("")
            namelist=int(input("¿Que lista desea mostrar? " ))
            match namelist:
                case 1:
                    print(listaDirectorios)
                case 2:
                    print(listaFicheros)
                case _:
                    print("Introduzca 1-2...")
        case "E":
            print("Saliendo...")
            break
