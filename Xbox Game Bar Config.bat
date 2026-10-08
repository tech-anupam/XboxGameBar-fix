@echo off
setlocal EnableExtensions EnableDelayedExpansion
title @tech-anupam - Xbox Game Bar Config
color 0A

:: Xbox Game Bar Config
:: Author: @tech-anupam
:: GitHub: https://github.com/tech-anupam

:: Require Administrator
net session >nul 2>&1
if not "%errorlevel%"=="0" (
    echo.
    echo [!] Administrator permission is required.
    echo [!] Right-click this .bat file and choose "Run as administrator".
    echo.
    pause
    exit /b 1
)

set "GDVR=HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR"
set "GCS=HKCU\System\GameConfigStore"
set "POLICY=HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR"

:menu
cls
echo ============================================================
echo             @tech-anupam - XBOX GAME BAR CONFIG
echo ============================================================
echo.
echo  [1] Enable Game Bar + Game DVR
echo  [2] Force software encoding
echo  [3] Set 60 FPS
echo  [4] Set recording resolution
echo  [5] Apply recommended 1080p 60 FPS profile
echo  [6] Apply maximum 1440p 60 FPS profile
echo  [7] Apply maximum 4K 60 FPS profile
echo  [8] Repair / re-register Xbox Game Bar
echo  [9] Restart Game Bar capture service
echo [10] Reset custom capture settings
echo [11] Backup Game Bar registry settings
echo [12] Diagnostics
echo  [0] Exit
echo.
set /p "choice=Select an option: "

if "%choice%"=="1" goto enable
if "%choice%"=="2" goto software
if "%choice%"=="3" goto fps60
if "%choice%"=="4" goto resolution
if "%choice%"=="5" goto profile1080
if "%choice%"=="6" goto profile1440
if "%choice%"=="7" goto profile4k
if "%choice%"=="8" goto repair
if "%choice%"=="9" goto service
if "%choice%"=="10" goto resetcapture
if "%choice%"=="11" goto backup
if "%choice%"=="12" goto diagnostics
if "%choice%"=="0" exit /b 0
goto menu

:enable
cls
echo Enabling Xbox Game Bar / Game DVR...
reg add "%GDVR%" /v AppCaptureEnabled /t REG_DWORD /d 1 /f >nul
reg add "%GCS%" /v GameDVR_Enabled /t REG_DWORD /d 1 /f >nul
reg add "%POLICY%" /v AllowGameDVR /t REG_DWORD /d 1 /f >nul
echo.
echo [OK] Game Bar and Game DVR enabled.
echo.
pause
goto menu

:software
cls
echo Enabling software encoding...
reg add "%GDVR%" /v ForceSoftwareMFT /t REG_DWORD /d 1 /f >nul
reg add "%GDVR%" /v AllowSoftwareEncode /t REG_DWORD /d 1 /f >nul
echo.
echo [OK] Software encoding enabled.
echo [i] This can increase CPU usage.
echo.
pause
goto menu

:fps60
cls
echo Setting Game DVR to 60 FPS...
reg add "%GDVR%" /v VideoEncodingFrameRateMode /t REG_DWORD /d 1 /f >nul
echo.
echo [OK] 60 FPS mode requested.
echo [i] Actual FPS depends on Windows, Game Bar and system performance.
echo.
pause
goto menu

:resolution
cls
echo Select recording resolution:
echo.
echo [1] 1280x720  HD
echo [2] 1920x1080 Full HD
echo [3] 2560x1440  QHD
echo [4] 3840x2160  4K UHD
echo [0] Back
echo.
set /p "res=Select: "

if "%res%"=="1" (
    call :setres 1280 720
    goto menu
)
if "%res%"=="2" (
    call :setres 1920 1080
    goto menu
)
if "%res%"=="3" (
    call :setres 2560 1440
    goto menu
)
if "%res%"=="4" (
    call :setres 3840 2160
    goto menu
)
if "%res%"=="0" goto menu
goto resolution

:setres
reg add "%GDVR%" /v CustomVideoEncodingWidth /t REG_DWORD /d %1 /f >nul
reg add "%GDVR%" /v CustomVideoEncodingHeight /t REG_DWORD /d %2 /f >nul
echo.
echo [OK] Custom capture size set to %1x%2.
echo [i] Game Bar may limit unsupported resolutions.
echo.
pause
exit /b

:profile1080
cls
echo Applying 1080p 60 FPS profile...
reg add "%GDVR%" /v ForceSoftwareMFT /t REG_DWORD /d 1 /f >nul
reg add "%GDVR%" /v AllowSoftwareEncode /t REG_DWORD /d 1 /f >nul
reg add "%GDVR%" /v VideoEncodingFrameRateMode /t REG_DWORD /d 1 /f >nul
reg add "%GDVR%" /v CustomVideoEncodingWidth /t REG_DWORD /d 1920 /f >nul
reg add "%GDVR%" /v CustomVideoEncodingHeight /t REG_DWORD /d 1080 /f >nul
reg add "%GDVR%" /v AppCaptureEnabled /t REG_DWORD /d 1 /f >nul
reg add "%GCS%" /v GameDVR_Enabled /t REG_DWORD /d 1 /f >nul
reg add "%POLICY%" /v AllowGameDVR /t REG_DWORD /d 1 /f >nul
echo.
echo [OK] 1080p 60 FPS profile applied.
echo.
pause
goto menu

:profile1440
cls
echo Applying 1440p 60 FPS profile...
reg add "%GDVR%" /v ForceSoftwareMFT /t REG_DWORD /d 1 /f >nul
reg add "%GDVR%" /v AllowSoftwareEncode /t REG_DWORD /d 1 /f >nul
reg add "%GDVR%" /v VideoEncodingFrameRateMode /t REG_DWORD /d 1 /f >nul
reg add "%GDVR%" /v CustomVideoEncodingWidth /t REG_DWORD /d 2560 /f >nul
reg add "%GDVR%" /v CustomVideoEncodingHeight /t REG_DWORD /d 1440 /f >nul
echo.
echo [OK] 1440p 60 FPS profile requested.
echo [i] Unsupported resolutions can be ignored by Game Bar.
echo.
pause
goto menu

:profile4k
cls
echo Applying 4K 60 FPS profile...
reg add "%GDVR%" /v ForceSoftwareMFT /t REG_DWORD /d 1 /f >nul
reg add "%GDVR%" /v AllowSoftwareEncode /t REG_DWORD /d 1 /f >nul
reg add "%GDVR%" /v VideoEncodingFrameRateMode /t REG_DWORD /d 1 /f >nul
reg add "%GDVR%" /v CustomVideoEncodingWidth /t REG_DWORD /d 3840 /f >nul
reg add "%GDVR%" /v CustomVideoEncodingHeight /t REG_DWORD /d 2160 /f >nul
echo.
echo [OK] 4K 60 FPS profile requested.
echo [!] This does not create extra detail from a lower-resolution source.
echo [!] Software encoding at 4K can be very CPU intensive.
echo.
pause
goto menu

:repair
cls
echo Repairing Xbox Game Bar registration...
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage Microsoft.XboxGamingOverlay | ForEach-Object {Add-AppxPackage -DisableDevelopmentMode -Register ($_.InstallLocation + '\AppXManifest.xml')}"
echo.
echo Resetting Microsoft Store cache...
start /wait "" wsreset.exe
echo.
echo [OK] Repair commands completed.
echo [i] Restart Windows before testing again.
echo.
pause
goto menu

:service
cls
echo Restarting Game DVR capture service...
for /f "tokens=1" %%S in ('sc query ^| findstr /R /C:"BcastDVRUserService_"') do (
    sc stop %%S >nul 2>&1
    sc start %%S >nul 2>&1
)
echo.
echo [OK] Capture service restart attempted.
echo.
pause
goto menu

:resetcapture
cls
echo Restoring conservative capture settings...
reg add "%GDVR%" /v VideoEncodingFrameRateMode /t REG_DWORD /d 0 /f >nul
reg add "%GDVR%" /v CustomVideoEncodingWidth /t REG_DWORD /d 1280 /f >nul
reg add "%GDVR%" /v CustomVideoEncodingHeight /t REG_DWORD /d 720 /f >nul
reg add "%GDVR%" /v ForceSoftwareMFT /t REG_DWORD /d 0 /f >nul
reg add "%GDVR%" /v AllowSoftwareEncode /t REG_DWORD /d 0 /f >nul
echo.
echo [OK] Conservative 720p / 30 FPS settings restored.
echo.
pause
goto menu

:backup
cls
set "BACKUP=%USERPROFILE%\Desktop\XboxGameBar-Registry-Backup"
if not exist "%BACKUP%" mkdir "%BACKUP%"
reg export "%GDVR%" "%BACKUP%\GameDVR.reg" /y >nul
reg export "%GCS%" "%BACKUP%\GameConfigStore.reg" /y >nul
reg export "%POLICY%" "%BACKUP%\GameDVR-Policy.reg" /y >nul
echo.
echo [OK] Registry backup created:
echo %BACKUP%
echo.
pause
goto menu

:diagnostics
cls
echo ============================================================
echo                       DIAGNOSTICS
echo ============================================================
echo.
echo [GPU]
powershell -NoProfile -Command "Get-CimInstance Win32_VideoController | Select-Object Name,DriverVersion,DriverDate,VideoProcessor,AdapterRAM,Status | Format-List"
echo.
echo [DirectX]
where dxdiag >nul 2>&1 && echo dxdiag: available
echo.
echo [Game Bar package]
powershell -NoProfile -Command "Get-AppxPackage Microsoft.XboxGamingOverlay | Select-Object Name,Version,Status | Format-List"
echo.
echo [Capture service]
powershell -NoProfile -Command "Get-Service BcastDVRUserService* | Select-Object Name,Status,StartType | Format-Table -AutoSize"
echo.
echo [Game DVR registry]
reg query "%GDVR%" /v AppCaptureEnabled
reg query "%GDVR%" /v AllowSoftwareEncode
reg query "%GDVR%" /v ForceSoftwareMFT
reg query "%GDVR%" /v VideoEncodingFrameRateMode
reg query "%GDVR%" /v CustomVideoEncodingWidth
reg query "%GDVR%" /v CustomVideoEncodingHeight
echo.
echo [GameConfigStore]
reg query "%GCS%" /v GameDVR_Enabled
echo.
pause
goto menu
