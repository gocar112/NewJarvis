@echo off
setlocal
cd /d "%~dp0"
set "PYTHONUTF8=1"
set "PLAYWRIGHT_BROWSERS_PATH=%~dp0.playwright"
if not exist ".venv\Scripts\python.exe" (
    echo Jarvis's Python environment is missing. See LOCAL-SETUP.md.
    pause
    exit /b 1
)
".venv\Scripts\python.exe" main.py
if errorlevel 1 pause
