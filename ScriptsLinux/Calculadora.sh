#!/bin/bash
#Script: Calculadora.sh
#Autor: Carlos Margullón Sánchez
#Fecha: 04-02-2025

clear

if [ $# != 2 ]; then

	echo "ERROR: Debes introducir 2 parametros."
	exit

fi

if [ -f $1 ]; then

	echo "El fichero $1 ya existe."
	exit

else

	echo > $1

fi

num=1

while [ $num -le $2 ]; do

	read -p "Especifique el tipo de operacion, y los dos valores a operar: " op op1 op2
	echo

	case $op in

		S)

			res=$((op1+op2))
			echo "$op $op1 $op2 = $res"
			echo $op $op1 $op2 >> $1

		;;

		R)

			res=$((op1-op2))
			echo "$op $op1 $op2 = $res"
			echo $op $op1 $op2 >> $1

		;;

		M)

			res=$((op1*op2))
			echo "$op $op1 $op2 = $res"
			echo $op $op1 $op2 >> $1

		;;

		D)

			res=$((op1/op2))
			echo "$op $op1 $op2 = $res"
			echo $op $op1 $op2 >> $1

		;;

		X)

			echo "Cerrando..."
			exit

		;;

	esac

	echo
	num=$(($num + 1))

done

echo

pwd $1

cat $1
