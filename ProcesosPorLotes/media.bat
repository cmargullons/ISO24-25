@echo off

REM Nombre: media.bat
REM Autor: Carlos Margullón
REM Fecha: 30/11/2024

set num1=5
set num2=3
set num3=4

set /a num4=%num1% + %num2% + %num3%

set /a num5=%num4%/3

echo La media de %num1%, %num2% y %num3% es %num5%
