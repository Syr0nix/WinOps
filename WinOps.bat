@echo off
color 0A
title WinOps

REM Check for admin privileges
net session >nul 2>&1
if %errorlevel% == 0 (
    echo Success: Administrative permissions confirmed.
) else (
    echo Failure: Current permissions inadequate. Program must be run as administrator.
    pause >nul
    exit /b
)
:menu
mode con: cols=135 lines=40

cls

echo ##::::'##:::'###:::'########:'########::'########:'##:::'##:::'######:'##:::'##'########:::'#####::'##::: ##'####'##::::'##:
echo ###::'###::'## ##:::##.... ##:##.....::::##.... ##. ##:'##:::'##... ##. ##:'##::##.... ##:'##.. ##::###:: ##. ##:. ##::'##::
echo ####'####:'##:. ##::##:::: ##:##:::::::::##:::: ##:. ####:::::##:::..::. ####:::##:::: ##'##:::: ##:####: ##: ##::. ##'##:::
echo ## ### ##'##:::. ##:##:::: ##:######:::::########:::. ##:::::. ######:::. ##::::########::##:::: ##:## ## ##: ##:::. ###::::
echo ##. #: ##:#########:##:::: ##:##...::::::##.... ##::: ##::::::..... ##::: ##::::##.. ##:::##:::: ##:##. ####: ##::: ## ##:::
echo ##:.:: ##:##.... ##:##:::: ##:##:::::::::##:::: ##::: ##:::::'##::: ##::: ##::::##::. ##:. ##:: ##::##:. ###: ##:: ##:. ##::
echo ##:::: ##:##:::: ##:########::########:::########:::: ##:::::. ######:::: ##::::##:::. ##:. #####:::##::. ##'####:##:::. ##:
echo ..:::::..:..:::::..:........::........:::........:::::..:::::::......:::::..::::..:::::..:::.....:::..::::..:....:..:::::..:: 
timeout /t 3 >nul
echo Press CTRL + SCROLL TO MAKE TEXT BIGGER!!!
timeout /t 3 >nul
echo This script was made by https://github.com/Syr0nix
timeout /t 3 >nul
echo This script needs to be run as an administrator. It will attempt to fix common Windows issues and optimize performance.
timeout /t 3 >nul
echo Please select the Menu to run:
timeout /t 3 >nul

:initial_menu
cls
echo ====================================================
echo   Welcome to Windows Fix/keys and Boosters Script
echo ====================================================
echo.
echo Please choose an option:
echo [1] Winfix
echo [2] Windows Key Management
echo [E] Exit Script
echo.
set /p init_choice="Choice: "

if "%init_choice%"=="1" goto Winfix_menu
if "%init_choice%"=="2" goto windows_key_menu
if "%init_choice%"=="E" goto exit
goto initial_menu

:Winfix_menu
echo [1] Run CHKDSK and optimize drives
echo [2] Clean Temp folders
echo [3] Windows component cleanup
echo [4] Windows image integrity check 
echo [5] System file check (SFC)
echo [6] Network settings optimization
echo [7] Set Power Plan to High Performance
echo [8] Clear Event Logs
echo [9] Adjust for best performance
echo [10] Clear ARP Cache
echo [11] Release and renew IP address, flush DNS cache
echo [12] Upgrade all packages
echo [13] Clean Prefetch files
echo [14] Disable Unnecessary Startup Programs
echo [15] Disable Windows Visual Effects for Performance
echo [16] Enable Windows Visual Effects (Default)
echo [17] Disable Xbox Game Bar
echo [18] Enable Xbox Game Bar
echo [19] Clear ram cache
echo [20] Winsock Reset
echo [21] Disable tcp global autotuning
echo [22] Restart to BIOS!
echo [23] Remove Windows Spyware
echo [24] install 7zip.exe
echo [25] install winrar.exe
echo [A] Run all procedures (with disabling options for optimal performance)
echo [E] Exit script
set /p userinp=Choice: 

REM Direct string comparisons for each option
if /I "%userinp%" EQU "E" exit /b
if /I "%userinp%" EQU "A" goto :procA
if "%userinp%"=="1" goto :proc1
if "%userinp%"=="2" goto :proc2
if "%userinp%"=="3" goto :proc3
if "%userinp%"=="4" goto :proc4
if "%userinp%"=="5" goto :proc5
if "%userinp%"=="6" goto :proc6
if "%userinp%"=="7" goto :proc7
if "%userinp%"=="8" goto :proc8
if "%userinp%"=="9" goto :proc9
if "%userinp%"=="10" goto :proc10
if "%userinp%"=="11" goto :proc11
if "%userinp%"=="12" goto :proc12
if "%userinp%"=="13" goto :proc13
if "%userinp%"=="14" goto :proc14
if "%userinp%"=="15" goto :proc15
if "%userinp%"=="16" goto :proc16
if "%userinp%"=="17" goto :proc17
if "%userinp%"=="18" goto :proc18
if "%userinp%"=="19" goto :proc19
if "%userinp%"=="20" goto :proc20
if "%userinp%"=="21" goto :proc21
if "%userinp%"=="22" goto :proc22
if "%userinp%"=="23" goto :proc23
if "%userinp%"=="24" goto :proc24
if "%userinp%"=="25" goto :proc25
echo Invalid choice. Returning to menu.
pause
goto Winfix_menu

:procA
echo Running all procedures for optimal performance...

REM Procedure 1: Run CHKDSK and optimize drives
setlocal enabledelayedexpansion
for %%i in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    echo Checking drive %%i:
    if exist %%i:\ (
        echo Drive %%i: is available, running CHKDSK...
        chkdsk %%i: /scan
        echo If it finds any problems, you may need to run: chkdsk %%i: /f after this.
        
        echo Cleaning Temp files on drive %%i:...
        del /F /S /Q %%i:\*Temp\* >nul 2>&1
        echo Temp files cleaned on drive %%i:.

        echo Optimizing drive %%i:...
        defrag %%i: /U /V
        echo Drive %%i: optimization complete.
    ) else (
        echo Drive %%i: is not available or offline, skipping to the next drive.
    )
)
endlocal

REM Procedure 2: Clean Temp folders
echo Cleaning Temp folders...
del /q /f /s %TEMP%\*

REM Procedure 3: Windows component cleanup
echo Performing Windows component cleanup...
dism /online /cleanup-image /startcomponentcleanup

REM Procedure 4: Windows image integrity check
echo Checking Windows image integrity...
dism /online /cleanup-image /restorehealth

REM Procedure 5: System file check (SFC)
echo Running System File Check (SFC)...
sfc /scannow

REM Procedure 6: Network settings optimization
echo Modifying network settings...
netsh interface tcp set global autotuning=high
netsh int ipv4 set subinterface "Ethernet" mtu=1500 store=persistent
netsh int ipv6 set subinterface "Ethernet" mtu=1500 store=persistent
netsh int ipv4 set subinterface "Wi-Fi" mtu=1500 store=persistent
netsh int ipv6 set subinterface "Wi-Fi" mtu=1500 store=persistent
netsh int ipv4 set subinterface "Bluetooth" mtu=1500 store=persistent
netsh int ipv6 set subinterface "Bluetooth" mtu=1500 store=persistent
netsh interface ip set dns "Local Area Connection" static 1.1.1.1
netsh interface ip add dns "Local Area Connection" 8.8.8.8 index=2
netsh interface 6to4 set state disabled
netsh int isatap set state disable
netsh int tcp set global timestamps=disabled
netsh int tcp set heuristics disabled
netsh int tcp set global ecncapability=disabled
netsh int tcp set global rsc=disabled
netsh int tcp set global nonsackrttresiliency=disabled
netsh int tcp set security mpp=disabled
netsh int tcp set security profiles=disabled
netsh int ip set global icmpredirects=disabled
netsh int tcp set security mpp=disabled profiles=disabled
netsh int ip set global multicastforwarding=disabled
netsh int tcp set supplemental internet congestionprovider=ctcp
netsh interface teredo set state disabled
netsh winsock reset
netsh int isatap set state disable
netsh int ip set global taskoffload=disabled
netsh int ip set global neighborcachelimit=4096
netsh int tcp set global dca=enabled
netsh int tcp set global netdma=enabled
PowerShell Disable-NetAdapterLso -Name "*"
powershell "ForEach($adapter In Get-NetAdapter){Disable-NetAdapterPowerManagement -Name $adapter.Name -ErrorAction SilentlyContinue}"
powershell "ForEach($adapter In Get-NetAdapter){Disable-NetAdapterLso -Name $adapter.Name -ErrorAction SilentlyContinue}"

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableICMPRedirect" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d "8760" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpWindowSize" /t REG_DWORD /d "8760" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxConnectionsPerServer" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_SZ /d "ffffffff" /f

REM Procedure 7: Set Power Plan to High Performance
echo Setting Power Plan to High Performance...
powercfg -setactive SCHEME_MIN

REM Procedure 8: Clear Event Logs
echo Clearing Event Logs - procedure 9
for /F "tokens=*" %%G in ('wevtutil.exe el') DO wevtutil.exe cl "%%G" 2>nul
echo Event logs cleared (where possible).

REM Procedure 9: Adjust for best performance
echo Adjusting for best performance...
systempropertiesperformance
timeout /t 10 >nul

REM Procedure 10: Clear ARP Cache
echo Clearing ARP Cache...
arp -d

REM Procedure 11: Release and renew IP address, flush DNS cache
echo Releasing IP, renewing, and flushing DNS...
ipconfig /release
ipconfig /renew
ipconfig /flushdns

REM Procedure 12: Upgrade all packages
echo Upgrading all packages...
winget upgrade --all 
color 0A

REM Procedure 13: Clean Prefetch files
echo Cleaning Prefetch files...
del /q /f /s C:\Windows\Prefetch\*

REM Procedure 15: Disable Windows Visual Effects for Performance
echo Disabling Windows Visual Effects for Performance...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
echo Windows visual effects set to best performance.

REM Procedure 17: Disable Xbox Game Bar
echo Disabling Xbox Game Bar...
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
taskkill /f /im GameBar.exe >nul 2>&1
taskkill /f /im GameBarFTServer.exe >nul 2>&1
taskkill /f /im GameBarPresenceWriter.exe >nul 2>&1
schtasks /change /tn "\Microsoft\XblGameSave\XblGameSaveTask" /disable >nul 2>&1
schtasks /change /tn "\Microsoft\XblGameSave\XblGameSaveTaskLogon" /disable >nul 2>&1
powershell -command "Get-AppxPackage *XboxGamingOverlay* | Remove-AppxPackage" >nul 2>&1
echo Xbox Game Bar, related services, and scheduled tasks disabled.

REM Procedure 19 Clearing RAM cache
echo Clearing RAM cache - procedure 19

echo Attempting to run ProcessIdleTasks to encourage garbage collection...
start "" /b %windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks

REM Wait briefly to let ProcessIdleTasks start, then return to the menu
timeout /t 10 >nul

echo RAM clear command executed successfully! 
echo All procedures completed.
pause
goto Winfix_menu

:proc1
setlocal enabledelayedexpansion
echo Checking all available drives for optimization - procedure 1
for %%i in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    echo Checking drive %%i:
    if exist %%i:\ (
        echo Drive %%i: is available, running CHKDSK...
        chkdsk %%i: /scan
        echo If it finds any problems, you may need to run: chkdsk %%i: /f after this.
        
        echo Cleaning Temp files on drive %%i:...
        del /F /S /Q %%i:\*Temp\* >nul 2>&1
        echo Temp files cleaned on drive %%i:.

        echo Optimizing drive %%i:...
        defrag %%i: /U /V
        echo Drive %%i: optimization complete.
    ) else (
        echo Drive %%i: is not available or offline, skipping to the next drive.
    )
)
endlocal
pause
goto Winfix_menu

:proc2
echo Cleaning Temp folders - procedure 2
del /q /f /s %TEMP%\*
pause
goto Winfix_menu

:proc3
echo Windows component cleanup - procedure 3
dism /online /cleanup-image /startcomponentcleanup
pause
goto Winfix_menu

:proc4
echo Checking Windows image integrity - procedure 4
dism /online /cleanup-image /restorehealth
pause
goto Winfix_menu

:proc5
echo Running System File Check (SFC) - procedure 5
sfc /scannow
pause
goto Winfix_menu

:proc6
echo Modifying network settings - procedure 6
netsh int tcp set global rss=enabled
netsh interface tcp set global autotuning=high
netsh int ipv4 set subinterface "Ethernet" mtu=1500 store=persistent
netsh int ipv6 set subinterface "Ethernet" mtu=1500 store=persistent
netsh int ipv4 set subinterface "Wi-Fi" mtu=1500 store=persistent
netsh int ipv6 set subinterface "Wi-Fi" mtu=1500 store=persistent
netsh int ipv4 set subinterface "Bluetooth" mtu=1500 store=persistent
netsh int ipv6 set subinterface "Bluetooth" mtu=1500 store=persistent
netsh interface ip set dns "Ethernet" static 1.1.1.1
netsh interface ip add dns "Ethernet" 8.8.8.8 index=2
netsh interface ip set dns "Wi-Fi" static 1.1.1.1
netsh interface ip add dns "Wi-Fi" 8.8.8.8 index=2
netsh interface ip set dns "Bluetooth" static 1.1.1.1
netsh interface ip add dns "Bluetooth" 8.8.8.8 index=2
netsh interface 6to4 set state disabled
netsh int isatap set state disable
netsh int tcp set global timestamps=disabled
netsh int tcp set heuristics disabled
netsh int tcp set global ecncapability=disabled
netsh int tcp set global rsc=disabled
netsh int tcp set global nonsackrttresiliency=disabled
netsh int tcp set security mpp=disabled
netsh int tcp set security profiles=disabled
netsh int ip set global icmpredirects=disabled
netsh int tcp set security mpp=disabled profiles=disabled
netsh int ip set global multicastforwarding=disabled
netsh int tcp set supplemental internet congestionprovider=ctcp
netsh interface teredo set state disabled
netsh winsock reset
netsh int isatap set state disable
netsh int ip set global taskoffload=disabled
netsh int ip set global neighborcachelimit=4096
netsh int tcp set global dca=enabled
netsh int tcp set global netdma=enabled
PowerShell Disable-NetAdapterLso -Name "*"
powershell "ForEach($adapter In Get-NetAdapter){Disable-NetAdapterPowerManagement -Name $adapter.Name -ErrorAction SilentlyContinue}"
powershell "ForEach($adapter In Get-NetAdapter){Disable-NetAdapterLso -Name $adapter.Name -ErrorAction SilentlyContinue}"

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableICMPRedirect" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d "8760" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpWindowSize" /t REG_DWORD /d "8760" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxConnectionsPerServer" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_SZ /d "ffffffff" /f
pause
goto Winfix_menu

:proc7
echo Setting Power Plan to High Performance - procedure 7
powercfg -setactive SCHEME_MIN
pause
goto Winfix_menu

:proc8
echo Clearing Event Logs - procedure 8
for /F "tokens=*" %%G in ('wevtutil.exe el') DO wevtutil.exe cl "%%G" 2>nul
echo Event logs cleared (where possible).
pause
goto Winfix_menu

:proc9
echo Adjusting for best performance - procedure 9
systempropertiesperformance
pause
goto Winfix_menu

:proc10
echo Clearing ARP Cache - procedure 10
arp -d
pause
goto Winfix_menu

:proc11
echo Releasing IP, renewing, and flushing DNS - procedure 11
ipconfig /release
ipconfig /renew
ipconfig /flushdns
pause
goto Winfix_menu

:proc12
echo Upgrading all packages - procedure 12
winget upgrade --all
color 0A
pause
goto Winfix_menu

:proc13
echo Cleaning Prefetch files - procedure 13
del /q /f /s C:\Windows\Prefetch\*
pause
goto Winfix_menu

:proc14
echo Disabling Unnecessary Startup Programs - procedure 14
start ms-settings:startupapps
echo Adjust your startup programs to disable unnecessary ones.
pause
goto Winfix_menu

:proc15
echo Disabling Windows Visual Effects for Performance - procedure 15
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
echo Windows visual effects set to best performance.
pause
goto Winfix_menu

:proc16
echo Enabling Windows Visual Effects (Default) - procedure 16
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 0 /f
echo Windows visual effects set to default.
pause
goto Winfix_menu

:proc17
echo Disabling Xbox Game Bar - procedure 17
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
taskkill /f /im GameBar.exe >nul 2>&1
taskkill /f /im GameBarFTServer.exe >nul 2>&1
taskkill /f /im GameBarPresenceWriter.exe >nul 2>&1
schtasks /change /tn "\Microsoft\XblGameSave\XblGameSaveTask" /disable >nul 2>&1
schtasks /change /tn "\Microsoft\XblGameSave\XblGameSaveTaskLogon" /disable >nul 2>&1
powershell -command "Get-AppxPackage *XboxGamingOverlay* | Remove-AppxPackage" >nul 2>&1
echo Xbox Game Bar, related services, and scheduled tasks disabled.
pause
goto Winfix_menu

:proc18
echo Enabling Xbox Game Bar - procedure 18
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v GameDVR_Enabled /t REG_DWORD /d 1 /f
schtasks /change /tn "\Microsoft\XblGameSave\XblGameSaveTask" /enable >nul 2>&1
schtasks /change /tn "\Microsoft\XblGameSave\XblGameSaveTaskLogon" /enable >nul 2>&1

REM Reinstall Xbox Game Bar using Microsoft Store
echo Reinstalling Xbox Game Bar via Microsoft Store...
powershell -command "Start-Process ms-windows-store://pdp/?productid=9NZKPSTSNW4P" >nul 2>&1
echo "Please manually install the Xbox Game Bar from the Microsoft Store window that opened."

pause
goto Winfix_menu

:proc19
echo Clearing RAM cache - procedure 19

echo Attempting to run ProcessIdleTasks to encourage garbage collection...
start "" /b %windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks

REM Wait briefly to let ProcessIdleTasks start, then return to the menu
REM Awk Tuah
timeout /t 10 >nul

echo RAM clear command executed successfully! 
echo Press any key to continue...
pause >nul
goto Winfix_menu

:proc20
echo Reseting Winsock
netsh winsock reset
echo Winsock reset executed successfully!
echo Press any key to continue...
pause >nul
goto Winfix_menu

:proc21
echo disabling tcp global autotuning
netsh interface tcp set global autotuning=disabled
echo tcp global autotuning is disabled successfully!
echo Press any key to continue...
pause >nul
goto Winfix_menu

:proc22
cls
echo Restarting to BIOS!
timeout /t 10 >nul
shutdown /r /fw /f /t 0
pause >nul

:proc24
echo installing 7zip.exe
Winget install 7zip.7zip
timeout /t 2 >nul
color 0A
echo 7zip installed!
echo Press any key to continue...
pause >nul
goto Winfix_menu

:proc25
echo installing winrar.exe
winget install winrar
timeout /t 2 >nul
color 0A
echo winrar installed!
echo Press any key to continue...
pause >nul
goto Winfix_menu

:proc23
cls
echo Checking for McAfee Antivirus...

:: Check if McAfee Agent exists
if exist "C:\Program Files\McAfee\Agent\x86\FrmInst.exe" (
    echo McAfee Agent found. Attempting to uninstall...

    :: Force uninstall McAfee Agent
    "C:\Program Files\McAfee\Agent\x86\FrmInst.exe" /FORCEUNINSTALL
    if %errorlevel%==0 (
        echo McAfee Agent uninstallation completed successfully.
    ) else (
        echo Failed to uninstall McAfee Agent. Please ensure you have Administrator privileges.
    )
) else (
    echo McAfee Agent not found. Skipping uninstallation process.
)

echo.
:: Let the user choose an antivirus to install or skip
echo Please select which antivirus to install:
echo [1] Norton Antivirus
echo [2] Malwarebytes
echo [3] Skip antivirus installation (This will make it Use Default Windows Antivirus)
set /p choice=Enter your choice (1, 2, or 3): 

if "%choice%"=="1" (
    echo Installing Norton Antivirus...
    start https://norton.com/setup
    echo Norton installation process initiated. Follow the instructions in your browser.
) else if "%choice%"=="2" (
    echo Installing Malwarebytes...
    start https://malwarebytes.com/mwb-download
    echo Malwarebytes installation process initiated. Follow the instructions in your browser.
) else if "%choice%"=="3" (
    echo Skipping antivirus installation...
) else (
    echo Invalid choice. Skipping antivirus installation.
)

echo.

echo Disabling Windows Tracking and Advertising features...
timeout /t 10 >nul

:: Disable Activity History
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "LetAppsAccessActivity" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "PublishUserActivities" /t REG_DWORD /d 0 /f

:: Disable Advertising ID
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f

:: Disable Feedback Frequency
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f

:: Disable Microsoft Compatibility Telemetry Service
sc stop DiagTrack
sc config DiagTrack start= disabled

:: Disable dmwappushsvc (Device Management Wireless Application Protocol)
sc stop dmwappushsvc
sc config dmwappushsvc start= disabled

:: Disable Windows Tips and Feedback requests
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-353694Enabled" /t REG_DWORD /d 0 /f

:: Disable Cortana suggestions in Start Menu
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d 0 /f

:: Disable Suggested Apps in Start Menu
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-310093Enabled" /t REG_DWORD /d 0 /f

:: Disable Background Apps
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d 1 /f

:: Disable Tailored Experiences
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d 0 /f

:: Disable Windows Location Services
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f

:: Disable Windows Search Indexing
sc stop WSearch
sc config WSearch start= disabled

:: Block telemetry hosts in the HOSTS file (requires elevated permissions)
echo 0.0.0.0 vortex.data.microsoft.com >> %windir%\System32\drivers\etc\hosts
echo 0.0.0.0 settings-win.data.microsoft.com >> %windir%\System32\drivers\etc\hosts
echo 0.0.0.0 watson.telemetry.microsoft.com >> %windir%\System32\drivers\etc\hosts

echo Windows Tracking and Advertising features have been disabled.
echo Windows Spyware Removed!
echo Process complete. Press any key to return to the menu...
pause >nul
goto Winfix_menu

:windows_key_menu
cls
echo ====================================================
echo   Windows Key Management Menu
echo ====================================================
echo.
@echo off
color 0A

REM Check for admin privileges
net session >nul 2>&1
if %errorlevel% == 0 (
    echo Success: Administrative permissions confirmed.
) else (
    echo Failure: Current permissions inadequate. Program must be run as administrator.
    pause >nul
    exit /b
)

echo This script requires administrative privileges to execute. It will initiate the activation process for Windows.
echo Are you sure you want to proceed? (Y/N)
set /p userinp=Choice: 
set userinp=%userinp:~0,1%
if /I "%userinp%" NEQ "Y" (
    echo Exiting script...
    exit /b
)

:start
setlocal

REM Display menu for Windows product key selection
echo Select a Windows product key to use:
echo 1. Home
echo 2. Home N
echo 3. Home Single Language
echo 4. Home Country Specific
echo 5. Pro
echo 6. Pro N
echo 7. Education
echo 8. Education N
echo 9. Enterprise
echo 10. Enterprise N
echo 11. Windows Server 2025 Standard
echo 12. Windows Server 2025 Datacenter
echo 13. Windows Server 2025 Datacenter: Azure Edition
echo 14. Windows Server 2022 Standard
echo 15. Windows Server 2022 Datacenter
echo 16. Windows Server 2022 Datacenter: Azure Edition
echo 17. Windows Server 2019 Standard
echo 18. Windows Server 2019 Datacenter
echo 19. Windows Server 2019 Essentials
echo 20. Windows Server 2016 Standard
echo 21. Windows Server 2016 Datacenter
echo 22. Windows Server 2016 Essentials
echo E. Exit Program
set /p keyChoice="Enter the number of your choice: "

REM Validate key choice
if %keyChoice% GEQ 1 if %keyChoice% LEQ 22 goto :setkey
echo Invalid choice. Exiting...
goto end

:setkey
REM Define Windows Product Keys
set "Home=TX9XD-98N7V-6WMQ6-BX7FG-H8Q99"
set "HomeN=3KHY7-WNT83-DGQKR-F7HPR-844BM"
set "HomeSingleLanguage=7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH"
set "HomeCountrySpecific=PVMJN-6DFY6-9CCP6-7BKTT-D3WVR"
set "Pro=W269N-WFGWX-YVC9B-4J6C9-T83GX"
set "ProN=MH37W-N47XK-V7XM9-C7227-GCQG9"
set "Education=NW6C2-QMPVW-D7KKK-3GKT6-VCFB2"
set "EducationN=2WH4N-8QGBV-H22JP-CT43Q-MDWWJ"
set "Enterprise=NPPR9-FWDCX-D2C8J-H872K-2YT43"
set "EnterpriseN=DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4"
set "Server2025Standard=TVRH6-WHNXV-R9WG3-9XRFY-MY832"
set "Server2025Datacenter=D764K-2NDRG-47T6Q-P8T8W-YP6DF"
set "Server2025Azure=XGN3F-F394H-FD2MY-PP6FD-8MCRC"
set "Server2022Standard=VDYBN-27WPP-V4HQT-9VMD4-VMK7H"
set "Server2022Datacenter=WX4NM-KYWYW-QJJR4-XV3QB-6VM33"
set "Server2022Azure=NTBV8-9K7Q8-V27C6-M2BTV-KHMXV"
set "Server2019Standard=N69G4-B89J2-4G8F4-WWYCC-J464C"
set "Server2019Datacenter=WMDGN-G9PQG-XVVXX-R3X43-63DFG"
set "Server2019Essentials=WVDHN-86M7X-466P6-VHXV7-YY726"
set "Server2016Standard=WC2BQ-8NRM3-FDDYY-2BFGV-KHKQY"
set "Server2016Datacenter=CB7KF-BWN84-R7R2Y-793K2-8XDDG"
set "Server2016Essentials=JCKRF-N37P4-C2D82-9YXRT-4M63B"

REM Set the selected key based on user input
set "SELECTED_KEY="
if "%keyChoice%"=="1" set SELECTED_KEY=%Home%
if "%keyChoice%"=="2" set SELECTED_KEY=%HomeN%
if "%keyChoice%"=="3" set SELECTED_KEY=%HomeSingleLanguage%
if "%keyChoice%"=="4" set SELECTED_KEY=%HomeCountrySpecific%
if "%keyChoice%"=="5" set SELECTED_KEY=%Pro%
if "%keyChoice%"=="6" set SELECTED_KEY=%ProN%
if "%keyChoice%"=="7" set SELECTED_KEY=%Education%
if "%keyChoice%"=="8" set SELECTED_KEY=%EducationN%
if "%keyChoice%"=="9" set SELECTED_KEY=%Enterprise%
if "%keyChoice%"=="10" set SELECTED_KEY=%EnterpriseN%
if "%keyChoice%"=="11" set SELECTED_KEY=%Server2025Standard%
if "%keyChoice%"=="12" set SELECTED_KEY=%Server2025Datacenter%
if "%keyChoice%"=="13" set SELECTED_KEY=%Server2025Azure%
if "%keyChoice%"=="14" set SELECTED_KEY=%Server2022Standard%
if "%keyChoice%"=="15" set SELECTED_KEY=%Server2022Datacenter%
if "%keyChoice%"=="16" set SELECTED_KEY=%Server2022Azure%
if "%keyChoice%"=="17" set SELECTED_KEY=%Server2019Standard%
if "%keyChoice%"=="18" set SELECTED_KEY=%Server2019Datacenter%
if "%keyChoice%"=="19" set SELECTED_KEY=%Server2019Essentials%
if "%keyChoice%"=="20" set SELECTED_KEY=%Server2016Standard%
if "%keyChoice%"=="21" set SELECTED_KEY=%Server2016Datacenter%
if "%keyChoice%"=="22" set SELECTED_KEY=%Server2016Essentials%
if "%keyChoice%"=="b" set goto initial_menu
if "%keyChoice%"=="e" set exit /b

REM Check if a valid key was selected
if not defined SELECTED_KEY (
    echo Invalid choice. Exiting...
    goto end
)

REM Display menu for KMS server selection
echo Select a KMS server:
echo 1. kms9.msguides.com (Main)
echo 2. kms8.msguides.com (Secondary)
echo 3. kms7.msguides.com (Tertiary)
set /p serverChoice="Enter the number of your choice: "

REM Set KMS server based on user selection
if "%serverChoice%"=="1" set KMS=kms9.msguides.com
if "%serverChoice%"=="2" set KMS=kms8.msguides.com
if "%serverChoice%"=="3" set KMS=kms7.msguides.com

REM Install the selected product key
slmgr /ipk %SELECTED_KEY%
if errorlevel 1 (
    echo Failed to install the selected key. Please check your installation or key.
    goto endDelay
)

REM Attempt to activate Windows
slmgr /skms %KMS%
echo KMS Server set to: %KMS%
slmgr /ato
if errorlevel 0 (
    echo Activation successful!
    goto endDelay
) else (
    echo Activation failed with primary server. Trying fallback servers...
)

REM Fallback mechanism for KMS servers
setlocal
set "FALLBACK_SERVERS=kms8.msguides.com kms7.msguides.com"

for %%S in (%FALLBACK_SERVERS%) do (
    echo Trying fallback server: %%S
    slmgr /skms %%S
    slmgr /ato
    if %errorlevel% == 0 (
        echo Activation successful with fallback server: %%S
        goto endDelay
    )
)

echo All activation attempts failed.

:endDelay
echo Closing script in 10 seconds...
timeout /t 10 /nobreak >nul
goto initial_menu

