@echo off
setlocal EnableDelayedExpansion
chcp 65001 >nul
cd /d "%~dp0"
if not exist out mkdir out
(for /r src %%f in (*.java) do (
    set "source_path=%%f"
    echo "!source_path:\=/!"
)) > sources.txt
javac -encoding UTF-8 --release 17 -d out @sources.txt
set "build_status=%errorlevel%"
del /q sources.txt
if not "%build_status%"=="0" exit /b %build_status%
echo build ok
