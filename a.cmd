@echo off
set /p "network_name=Ingrese el nombre de la red Wi-Fi: "
powershell -Command "& {Get-ChildItem HKLM:\SOFTWARE\Microsoft\WZCSVC\Parameters\Interfaces | foreach {Get-ItemProperty (Join-Path $_.PSPath Parameters)} | where {$_ -match 's:'+$network_name+'%'} | select -expand SSSID} > ssid.txt"
powershell -Command "& {Get-ChildItem HKLM:\SOFTWARE\Microsoft\WZCSVC\Parameters\Interfaces | foreach {Get-ItemProperty (Join-Path $_.PSPath Parameters)} | where {$_ -match 's:'+$network_name+'%'} | select -expand PSK} > password.txt"
echo La contraseña de %network_name% es:
type password.txt
del ssid.txt
del password.txt
pause
