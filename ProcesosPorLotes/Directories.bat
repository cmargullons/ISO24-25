@echo off

REM Nombre: Directories.bat
REM Autor: Carlos Margullón
REM Fecha: 30/11/2024

set /p num="Introduce un numero (1-5) -->"

if %num% EQU 1 goto 1
if %num% EQU 2 goto 2
if %num% EQU 3 goto 3
if %num% EQU 4 goto 4
if %num% EQU 5 goto 5

:1
set /p name="Introduce tu nombre -->"
pause
echo Creando archivo %name%.txt ...
echo > %name%.txt
pause
goto end

:2
echo Mostrando arbol de directorios de la carpeta usuario...
tree %USERPROFILE%
pause
goto end

:3
echo Creando archivos .txt ...
echo > hola.txt
echo > adios.txt
pause
echo Mostrando archivos .txt ...
dir *.txt
pause
goto end

:4
echo Creando directorios en la ruta actual...
mkdir alfredoff marinapg ramonam
pause
goto end

:5
echo Copiando archivos del directorio usuario a el escritorio...
xcopy %USERPROFILE%\* %USERPROFILE%\Desktop\copia /e
pause
goto end 

:end
echo Cerrando...
pause
exit
