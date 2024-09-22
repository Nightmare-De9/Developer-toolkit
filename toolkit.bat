@echo off
title Developer Toolkit - Batch Multitool

:menu
cls
echo.
echo ██████╗ ███████╗██╗   ██╗███████╗██╗      ██████╗ ██████╗ ███████╗██████╗     ████████╗ ██████╗  ██████╗ ██╗     ██╗  ██╗██╗████████╗
echo ██╔══██╗██╔════╝██║   ██║██╔════╝██║     ██╔═══██╗██╔══██╗██╔════╝██╔══██╗    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     ██║ ██╔╝██║╚══██╔══╝
echo ██║  ██║█████╗  ██║   ██║█████╗  ██║     ██║   ██║██████╔╝█████╗  ██████╔╝       ██║   ██║   ██║██║   ██║██║     █████╔╝ ██║   ██║   
echo ██║  ██║██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║     ██║   ██║██╔═══╝ ██╔══╝  ██╔══██╗       ██║   ██║   ██║██║   ██║██║     ██╔═██╗ ██║   ██║   
echo █████╔╝███████╗ ╚████╔╝ ███████╗███████╗╚██████╔╝██║     ███████╗██║  ██║       ██║   ╚██████╔╝╚██████╔╝███████╗██║  ██╗██║   ██║   
echo ╚═════╝ ╚══════╝  ╚═══╝  ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝   ╚═╝   
echo.
echo ============================
echo  Developer Toolkit
echo ============================
echo 1. View System Info
echo 2. Create New Project Folder
echo 3. Navigate to Project Folder
echo 4. Git Status
echo 5. Git Pull
echo 6. Clear Temp and Cache Files
echo 7. Check Network Connectivity (Ping Google)
echo 8. Python Virtual Environment Setup
echo 9. Compile C/C++ Code (GCC)
echo 10. Exit
echo ============================
set /p choice="Choose an option (1-10): "

if "%choice%"=="1" goto systeminfo
if "%choice%"=="2" goto newproject
if "%choice%"=="3" goto navproject
if "%choice%"=="4" goto gitstatus
if "%choice%"=="5" goto gitpull
if "%choice%"=="6" goto cleartemp
if "%choice%"=="7" goto checknetwork
if "%choice%"=="8" goto pyvenv
if "%choice%"=="9" goto compilecode
if "%choice%"=="10" exit
goto menu

:systeminfo
cls
echo --- SYSTEM INFORMATION ---
systeminfo | more
pause
goto menu

:newproject
cls
set /p pname="Enter Project Name: "
mkdir %pname%
echo Project '%pname%' created.
pause
goto menu

:navproject
cls
set /p path="Enter project folder path: "
cd /d %path%
if "%errorlevel%"=="0" (
    echo Successfully navigated to %path%
) else (
    echo Invalid path!
)
pause
goto menu

:gitstatus
cls
echo --- GIT STATUS ---
git status
pause
goto menu

:gitpull
cls
echo --- GIT PULL ---
git pull
pause
goto menu

:cleartemp
cls
echo Clearing temporary and cache files...
del /q/f/s %TEMP%\*
echo Temp files deleted.
pause
goto menu

:checknetwork
cls
echo Checking network connectivity...
ping google.com
pause
goto menu

:pyvenv
cls
set /p venvname="Enter Virtual Environment Name: "
python -m venv %venvname%
echo Virtual environment '%venvname%' created.
pause
goto menu

:compilecode
cls
set /p file="Enter C/C++ file to compile (with extension): "
gcc %file% -o %file%.exe
if "%errorlevel%"=="0" (
    echo Compilation successful. Output: %file%.exe
) else (
    echo Compilation failed!
)
pause
goto menu
