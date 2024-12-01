@echo off

REM Nombre: mkprofiles.bat
REM Autor: Carlos Margullón
REM Fecha: 30/11/2024

mkdir %USERPROFILE%\asir\docs
mkdir %USERPROFILE%\asir\pract
mkdir %USERPROFILE%\asir\exam

mkdir %USERPROFILE%\dam\docs
mkdir %USERPROFILE%\dam\pract
mkdir %USERPROFILE%\dam\exam

mkdir %USERPROFILE%\smr\docs
mkdir %USERPROFILE%\smr\pract
mkdir %USERPROFILE%\smr\exam

mkdir %USERPROFILE%\daw\docs
mkdir %USERPROFILE%\daw\pract
mkdir %USERPROFILE%\daw\exam

mkdir %USERPROFILE%\ceti\docs
mkdir %USERPROFILE%\ceti\pract
mkdir %USERPROFILE%\ceti\exam

pause

echo Todos los directorios se han creado correctamente.
