@echo off
:: Attempt graceful termination of WaveLink and any child processes
taskkill /T /IM WaveLink.exe

:: Wait up to 5 seconds for the app to shut down gracefully (user can't interrupt)
timeout /t 5 /nobreak > nul

:: Check if WaveLink is still running
tasklist | findstr /I WaveLink.exe > nul

:: If still running, forcefully terminate it
if %errorlevel%==0 (
    echo WaveLink still running — forcing shutdown...
    taskkill /T /F /IM WaveLink.exe
    timeout /t 5 /nobreak > nul
)

:: Launch WaveLink
start "" "C:\Program Files\Elgato\WaveLink\WaveLink.exe"