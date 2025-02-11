#!/bin/bash
#Script: Ping.sh
#Autor: Carlos Margullón Sánchez
#Fecha: 11-02-2025

clear

if [ $# -ne 1 ]; then

	echo "ERROR: Debes introducir un unico parametro (IP)."

fi

ttl=$(ping $1 -c 1 | cut -d " " -f 13 | cut -d "=" -f 2)

if [ $ttl -eq 128 ];then

	echo "TTL=$ttl: Windows"

fi

if [ $ttl -eq 64 ];then

	echo "TTL=$ttl: Linux"

fi

if [ $ttl -eq 255 ];then

	echo "TTL=$ttl: SunsOS"

fi
