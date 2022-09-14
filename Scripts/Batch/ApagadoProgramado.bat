@echo off
cls
chcp 65001 >null
echo Seleccione una de estas opciones:  
echo 1.Apagado por horas
echo 2.Apagado por minutos
echo 3.Salir
choice /c:123
IF ERRORLEVEL 3 GOTO Salir
IF ERRORLEVEL 2 GOTO min	
IF ERRORLEVEL 1 GOTO hor

:min
cls
set /p Minuto= "Dime los minutos hasta el apagado: "
set Segundos= 60
set /a Resultado= %Minuto%*%Segundos%
shutdown /t %Resultado% /s
cls
echo El equipo se apagara dentro de %Minuto% minutos
echo Puse cualquier tecla para cancelarlo
pause >> ficherotemp.txt
shutdown /a
del ficherotemp.txt
goto Salir

:hor
cls
set /p Hora= "Dime las horas hasta el apagado: "
set Segundos= 3600
set /a Resultado= %Hora%*%Segundos%
shutdown /t %Resultado% /s
cls
echo El equipo se apagara dentro de %Hora% horas
echo Puse cualquier tecla para cancelarlo
pause >> ficherotemp.txt
shutdown /a
del ficherotemp.txt
goto Salir


:Salir
