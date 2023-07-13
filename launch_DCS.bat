@echo off

rem Run the PowerShell script before launching the app
powershell.exe -ExecutionPolicy Bypass -File "D:\Documents\Dev\HOTAS_Enable_Disable.ps1" enable

rem Launch the application
start "" "C:\Program Files\Eagle Dynamics\DCS World OpenBeta\bin-mt\DCS.exe"

rem Wait for the application to close
:wait
tasklist | find "DCS.exe" >nul
if %errorlevel% equ 0 (
    timeout /t 1 /nobreak >nul
    goto wait
)

rem Run the PowerShell script after the application closes
powershell.exe -ExecutionPolicy Bypass -File "D:\Documents\Dev\HOTAS_Enable_Disable.ps1" disable
