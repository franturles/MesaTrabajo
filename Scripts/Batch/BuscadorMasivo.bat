@echo off
set cont=0
set /p Ruta= "Dime la ruta en la que quieres que busquemos: "
set /p Fichero="Dime la ruta del fichero de busqueda: "
for /f %%i in (%Fichero%) do (
dir %Ruta%\*%%i*.* /s >> Registro.txt
set /a cont+=1
)
echo Total: %cont%
rem dir X:\ETIQUETAS%x*.* /s
rem echo %contador%
pause