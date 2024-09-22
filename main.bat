@echo off
title Developer Toolkit - Batch Multitool
color 0A  :: This sets the text to green (0A)

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
echo 10. Install Git
echo 11. Install Python
echo 12. Check Software Dependencies (git, python, gcc)
echo 13. Create HTML/CSS/JS Project Template
echo 14. View Disk Space Usage
echo 15. Exit
echo ============================
set /p choice="Choose an option (1-15): "

if "%choice%"=="1" goto systeminfo
if "%choice%"=="2" goto newproject
if "%choice%"=="3" goto navproject
if "%choice%"=="4" goto gitstatus
if "%choice%"=="5" goto gitpull
if "%choice%"=="6" goto cleartemp
if "%choice%"=="7" goto checknetwork
if "%choice%"=="8" goto pyvenv
if "%choice%"=="9" goto compilecode
if "%choice%"=="10" goto installgit
if "%choice%"=="11" goto installpython
if "%choice%"=="12" goto checkdependencies
if "%choice%"=="13" goto createhtml
if "%choice%"=="14" goto diskusage
if "%choice%"=="15" exit
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

:installgit
cls
echo --- INSTALLING GIT ---
echo Downloading Git for Windows...
start https://git-scm.com/download/win
echo Follow the instructions on the website to complete installation.
pause
goto menu

:installpython
cls
echo --- INSTALLING PYTHON ---
echo Downloading Python...
start https://www.python.org/downloads/
echo Follow the instructions on the website to complete installation.
pause
goto menu

:checkdependencies
cls
echo --- CHECKING DEPENDENCIES ---
echo Checking Git...
git --version >nul 2>&1
if %errorlevel%==0 (
    echo Git is installed.
) else (
    echo Git is NOT installed. Run option 10 to install Git.
)

echo Checking Python...
python --version >nul 2>&1
if %errorlevel%==0 (
    echo Python is installed.
) else (
    echo Python is NOT installed. Run option 11 to install Python.
)

echo Checking GCC...
gcc --version >nul 2>&1
if %errorlevel%==0 (
    echo GCC is installed.
) else (
    echo GCC is NOT installed. Install MinGW from: https://sourceforge.net/projects/mingw/
)
pause
goto menu

:createhtml
cls
echo Creating HTML/CSS/JS project template...
set /p pname="Enter project name: "
mkdir %pname%
cd %pname%
echo "<!DOCTYPE html>" > index.html
echo "<html>" >> index.html
echo "<head>" >> index.html
echo "    <title>%pname%</title>" >> index.html
echo "    <link rel='stylesheet' type='text/css' href='style.css'>" >> index.html
echo "</head>" >> index.html
echo "<body>" >> index.html
echo "    <h1>Welcome to %pname%!</h1>" >> index.html
echo "    <script src='app.js'></script>" >> index.html
echo "</body>" >> index.html
echo "</html>" >> index.html
echo "body { font-family: Arial, sans-serif; }" > style.css
echo "console.log('Welcome to %pname%!');" > app.js
echo Project template created for '%pname%'!
pause
goto menu

:diskusage
cls
echo --- DISK SPACE USAGE ---
echo Listing available drives and space...
wmic logicaldisk get size,freespace,caption
pause
goto menu
