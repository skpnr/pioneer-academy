@echo off
setlocal enabledelayedexpansion

echo =================================================================
echo   e-PDS Management - Instant Phone Web-App / PWA Launcher
echo =================================================================
echo.
echo No Android Studio or heavy tools needed!
echo This will allow you to run and install the app directly on your Android phone.
echo.

:: Get Local IP Address
for /f "tokens=4" %%a in ('route print ^| findstr 0.0.0.0 ^| findstr /v "0.0.0.0.*0.0.0.0"') do (
    set LOCAL_IP=%%a
    goto ip_found
)
:ip_found

if "%LOCAL_IP%"=="" (
    set LOCAL_IP=127.0.0.1
)

set PORT=8080
set WWW_DIR=%~dp0app\src\main\assets\www

echo -----------------------------------------------------------------
echo [STEP 1] Ensure your Android phone is connected to the same Wi-Fi.
echo [STEP 2] Open Chrome / Edge on your Android phone and visit:
echo.
echo          http://%LOCAL_IP%:%PORT%/index.html
echo.
echo [STEP 3] Tap the 3 dots in Chrome and select:
echo          "Add to Home Screen" or "Install App"
echo -----------------------------------------------------------------
echo.
echo Starting local offline server now... (Press Ctrl+C to stop)
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$port = %PORT%; " ^
  "$path = '%WWW_DIR%'.Replace('\', '/'); " ^
  "Write-Host \"[Server Running] http://%LOCAL_IP%:$port/\"; " ^
  "$listener = New-Object System.Net.HttpListener; " ^
  "$listener.Prefixes.Add(\"http://*:$port/\"); " ^
  "$listener.Start(); " ^
  "try { " ^
  "    while ($listener.IsListening) { " ^
  "        $context = $listener.GetContext(); " ^
  "        $reqPath = $context.Request.Url.LocalPath.TrimStart('/'); " ^
  "        if ([string]::IsNullOrEmpty($reqPath)) { $reqPath = 'index.html'; } " ^
  "        $filePath = Join-Path $path $reqPath; " ^
  "        if (Test-Path $filePath -PathType Leaf) { " ^
  "            $bytes = [System.IO.File]::ReadAllBytes($filePath); " ^
  "            $ext = [System.IO.Path]::GetExtension($filePath).ToLower(); " ^
  "            $contentType = switch ($ext) { " ^
  "                '.html' { 'text/html; charset=utf-8' } " ^
  "                '.css'  { 'text/css; charset=utf-8' } " ^
  "                '.js'   { 'application/javascript; charset=utf-8' } " ^
  "                '.json' { 'application/json' } " ^
  "                '.png'  { 'image/png' } " ^
  "                default { 'application/octet-stream' } " ^
  "            }; " ^
  "            $context.Response.ContentType = $contentType; " ^
  "            $context.Response.ContentLength64 = $bytes.Length; " ^
  "            $context.Response.OutputStream.Write($bytes, 0, $bytes.Length); " ^
  "        } else { " ^
  "            $context.Response.StatusCode = 404; " ^
  "        } " ^
  "        $context.Response.Close(); " ^
  "    } " ^
  "} finally { " ^
  "    $listener.Stop(); " ^
  "}"
