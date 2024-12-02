@echo off

REM Nombre: checkFiles.bat
REM Autor: Carlos Margullón
REM Fecha: 30/11/2024

:inicio

set /p name="Introduce el nombre del archivo -->"

if exist %name% (
	echo El archivo %name% ya existe. 
	goto inicio
) else (
	echo Creando archivo %name% ...
	echo > %name%
)

pause

echo Cerrando...

pause 
exit
