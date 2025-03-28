# File: infoUsers.py 
# Autor: Carlos Margullón Sánchez
# Fecha: 25-03-2025

import os
import cpuinfo

if os.getuid() == 0:
    print("Menu de opciones")
    print("")
    print("1 - Muestra información del SSOO e información de la CPU.")
    print("2 - Pedir un usuario. Si existe, se muestra información sobre él, si no, se crea.")
    print("3 -  Pedir al usuario un directorio. Comprobar si existe y si es un directorio, en caso contrario, lo crea.")
    print("4 - Salir")
    print("")
    while True:
        op = int(input("Selecciona la opción: "))
        print("")
        match op:
            case 1:
                print(os.uname().sysname)
                print(cpuinfo.get_cpu_info()["brand_raw"])
                print("")
            case 2:
                name = input("Dime un nombre de usuario: ")
                print("")
                fich = open("/etc/passwd", "r")
                encontrado = 0
                for a in fich:
                    if a.split(":")[0] == name:
                        encontrado = 1
                        final = a
                if encontrado == 1:
                    print(final)
                else:
                    print("Usiario no econtrado, creando usuario...")
                    print("")
                    os.system("sudo useradd " + name)
            case 3:
                dir = input("Dime un directorio: ")
                print("")
                if os.path.exists(dir):
                    if os.path.isdir(dir):
                        print(dir + " es un directorio.")
                        print("")
                else:
                    print(dir + " no existe, creando directorio...")
                    print("")
                    os.mkdir(dir)
            case 4:
                print("Saliendo...")
                break
            case _:
                print("Número incorrecto (1-4)")
                print("")
else:
    print("ERROR: Debes ser root para continuar.")
