@echo off

REM Nombre: createFiles.bat
REM Autor: Carlos Margullón
REM Fecha: 30/11/2024

echo Si desea crear un archivo.txt pulse 1
echo Si desea crear un archivo.bat pulse 2


set /p num=

if %num% EQU 1 goto hi
if %num% EQU 2 goto bye

:hi
echo > .txt
pause
goto end

:bye
echo > .bat
pause
goto end

:end
echo Cerrando...
pause
exit
