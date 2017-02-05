::GENERADOR DE HOTSPOT PARA WINDOWS

@echo off
@echo.
echo           ---------------------------
@echo.
echo              GENERADOR DE HOTSPOT
@echo.
echo           ---------------------------

::MENU PRINCIPAL

:inicio

echo 1) CONFIGURAR HOTSPOT
@echo.
echo 2) ACTIVAR HOTSPOT
@echo.
echo 3) DESACTIVAR HOTSPOT
@echo.
echo 4) SALIR
@echo.
set /p var="Selecciona la opción deseada [1-4] "

::DIRECCIONAMIENTO DEL MENU

if "%var%"=="1" goto :op1
if "%var%"=="2" goto :op2
if "%var%"=="3" goto :op3
if "%var%"=="4" goto :op4

::Mensaje de error, validación cuando se selecciona una opción fuera de rango
echo.
echo El numero "%var%" no es una opcion valida, por favor intente de nuevo.
pause >nul
@echo.
goto :inicio


::CONFIGURA EL HOTSPOT
:op1
cls
@echo.
echo Has seleccionado la opción de configuración del HOTSPOT
@echo.
SET /P Hotspot="Introduce el nombre del HOTSPOT: "
@echo.
::Guardamos el nombre del SSID en un documento txt
@echo %Hotspot% > hotspot.txt 
@echo.
SET /p Pwd="Introduce el Password del nuevo HOTSPOT: "
@echo.
::Guardamos el password en un documento txt
@echo %Pwd% > pwd.txt
@echo.
echo HOTSPOT configurado correctamente!
@echo.

:activate 
set /p activate="Quiere activar el HOTSPOT (y/n)? "
if "%activate%"=="y" goto :op2
if "%activate%"=="n" goto :op4

::Mensaje de error, validación cuando se selecciona una opción fuera de rango
echo.
echo La opción "%activate%" no es una opcion valida, por favor intente de nuevo.
pause >nul
@echo.
goto :activate



:: ACTIVA EL HOTSPOT
:op2
cls
@echo.
::recuperamos el valor del nombre del SSID del archivo txt
set /p Hotspot=<hotspot.txt
::recuperamos el valor del password del archivo txt
set /p Pwd=<pwd.txt


netsh wlan set hostednetwork mode=allow ssid=%Hotspot% key=%Pwd%
netsh wlan start hostednetwork
@echo.
echo HOTSPOT activado!
@echo.
echo Las credenciales son las siguientes:
@echo.
echo SSID -- %Hotspot%
@echo.
echo PWD -- %Pwd%
@echo.
echo Pulsa cualquier tecla para salir
pause>nul
exit


::DESACTIVA EL HOTSPOT
:op3
cls
@echo.
netsh wlan stop hostednetwork
@echo.
echo HOTSPOT desactivado!
@echo.
echo Pulsa cualquier tecla para salir 
pause>nul
exit

::SALE DEL PROGRAMA 
:op4
cls
exit

