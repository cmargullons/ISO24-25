#!/bin/bash
#Script: addEmpleado.sh
#Autor: Carlos Margullón Sánchez
#Fecha: 11-02-2025

clear

if [ $# -lt 2 ];then

	echo "ERROR: Debes introducir mas de 2 parametros. (Nombre se usuario y grupos)."
	exit

fi

if [ $UID -ne 0 ]; then

	echo "ERROR: Acceso denegado, debes ser root."
	exit

fi

if grep "^$1:" /etc/passwd > /dev/null; then

	echo "Usuario existente."

else

	echo "El usuario no existe, creando usuario..."
	useradd $1

fi

usuario=$1

shift

while [ $# -gt 0 ]; do

	if grep "^$1:" /etc/group > /dev/null;then

		echo "El grupo $1 existe."

		busqueda=$(grep "^$1:" /etc/group | grep "^$usuario")

		if $busqueda > /dev/null;then

			echo "Hola"

		else

			echo "Adios"

		fi

	else

		echo "El grupo $1 no existe, creando grupo..."
		groupadd $1

	fi

	shift

done
