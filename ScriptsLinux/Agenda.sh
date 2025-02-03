#!/bin/bash
#Script: Agenda.sh
#Autor: Carlos Margullón Sánchez
#Fecha: 03-02-2025

while true; do

	clear

	echo "Opciones disponibles: "
	echo
	echo "a) - Añadir una entrada."
	echo
	echo "b) - Buscar por DNI."
	echo
	echo "c) - Ver la agenda completa."
	echo
	echo "d) - Eliminar todas las entradas de la agenda."
	echo
	echo "e) - Salir."
	echo

	read -p "Introduce una letra: " letter
	echo
	echo
	echo

	case $letter in

		a)

			read -p "Introduzca un DNI: " dni
			echo

			if grep "^$dni:" Agenda.txt > /dev/null; then

				echo
				echo
				echo "El DNI $dni ya existe."

			else

				read -p "Introduzca el nombre: " name
				echo
				read -p "Introduzca el apellido: " sname
				echo
				read -p "Introduce la localidad: " ubi
				echo
				echo
				echo
				echo "Añadiendo entrada..."

				echo $dni:$name:$sname:$ubi >> Agenda.txt

			fi

		;;

		b)

			read -p "Introduzca un  DNI: " dni
			echo
			echo
			echo

			if grep "^$dni:" Agenda.txt > /dev/null; then

				name=$(grep "^$dni:" Agenda.txt | cut -d ":" -f 2)
				sname=$(grep "^$dni:" Agenda.txt | cut -d ":" -f 3)
				ubi=$(grep "^$dni:" Agenda.txt | cut -d ":" -f 4)

				echo "La persona con DNI $dni es: $name $sname, y vive en $ubi."

			else

				echo "ERROR: No se han encontrado resultados."

			fi
		;;

		c)

			if [ -s Agenda.txt ]; then

				echo "Mostrando lista de contactos..."
				echo

				cat Agenda.txt

			else

				echo "Agenda vacia."

			fi

		;;

		d)

			echo "Borrando lista de contactos..."

			> Agenda.txt

		;;

		e)

			echo "Saliendo..."
			exit

		;;

		*)
			echo "La opcion seleccionada no existe."
		;;

	esac

	echo
	echo
	echo
	echo "Presione enter para continuar..."
	read

done
