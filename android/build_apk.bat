@echo off
setlocal enabledelayedexpansion

echo =================================================================
echo        PDS Management System - Native Android APK Compiler
echo =================================================================
echo.

set PROJECT_DIR=%~dp0
cd /d "%PROJECT_DIR%"

if exist "C:\Users\User\.gemini\antigravity\scratch\tools" (
    echo [v] Portable OpenJDK & Build Tools Detected.
)

echo Starting APK build process...
powershell -NoProfile -ExecutionPolicy Bypass -File "C:\Users\User\.gemini\antigravity\scratch\compile_apk.ps1"

echo.
if exist "%PROJECT_DIR%output_apk\PDS_Management.apk" (
    echo =================================================================
    echo [SUCCESS] APK Successfully Generated at:
    echo %PROJECT_DIR%output_apk\PDS_Management.apk
    echo =================================================================
) else (
    echo [!] Build script finished. Check output_apk folder.
)

pause
