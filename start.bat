@echo off
cd /d "%~dp0"
title MERN Task 1 - Server

echo ===================================================
echo           MERN Task 1 - Inventory Manager
echo ===================================================
echo.

where node >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Node.js is not installed yet.
    echo [*] Opening the downloaded Node.js installer for you...
    if exist "%USERPROFILE%\Downloads\node-v20-setup.msi" (
        start "" "%USERPROFILE%\Downloads\node-v20-setup.msi"
    ) else (
        start https://nodejs.org/dist/v20.18.0/node-v20.18.0-x64.msi
    )
    echo.
    echo Please complete the setup wizard window that opened,
    echo then double-click this start.bat file again!
    echo ===================================================
    pause
    exit /b
)

echo [✓] Node.js detected!
echo [*] Installing dependencies (Express)...
call npm install

echo.
echo [*] Launching application in your browser...
start http://localhost:3000

echo [*] Starting server on http://localhost:3000...
echo (Press Ctrl + C to stop the server)
echo ===================================================
node server.js
pause

