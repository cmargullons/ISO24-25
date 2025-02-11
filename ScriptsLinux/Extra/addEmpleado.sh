#!/bin/bash
#Script: addEmpleado.sh
#Autor: Carlos Margullón Sánchez
#Fecha: 11-02-2025

clear

if [ $# -lt 2 ]; then

	echo "ERROR: Debes introducir mas de 2 parametros. (Nombre se usuario y grupos)."
	exit

fi

if [ $UID -ne 0 ]; then

	echo "ERROR: Acceso denegado, debes ser root."
	exit

fi

echo "<----------------------->"
echo

if grep "^$1:" /etc/passwd > /dev/null; then

	echo "El usuario $1 existe."

else

	echo "El usuario $1 no existe, creando usuario..."
	useradd $1

fi

echo
echo "<----------------------->"


usuario=$1

shift

while [ $# -gt 0 ]; do

	if grep "^$1:" /etc/group > /dev/null; then

		echo
		echo "El grupo $1 existe."
		
		echo

		if id -nG $usuario | grep "$1" > /dev/null; then

			echo "El usuario $usuario ya forma parte del grupo $1."

		else

			echo "El usuario $usuario no forma parte del grupo $1, asignando usuario al grupo..."
			usermod -aG $1 $usuario

		fi

		echo

	else

		echo
		echo "El grupo $1 no existe, creando grupo..."
		groupadd $1

		echo

		echo "Asignando grupo al usuario $usuario..."
		usermod -aG $1 $usuario
		echo

	fi

	shift

	echo "<----------------------->"

done
