@echo off
setlocal
echo =================================================================
echo        PDS Management System - Offline Local Test Server
echo =================================================================
echo.
echo Starting local offline web server on http://localhost:8080 ...
echo You can test all 4 screens, GPS capture, offline IndexedDB storage!
echo.
echo Press Ctrl+C in this window to stop the server when done.
echo.

set WWW_DIR=%~dp0app\src\main\assets\www

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$port = 8080; " ^
  "$path = '%WWW_DIR%'.Replace('\', '/'); " ^
  "Write-Host \"[Server Started] Serving $path at http://localhost:$port/\"; " ^
  "Start-Process \"http://localhost:$port/index.html\"; " ^
  "$listener = New-Object System.Net.HttpListener; " ^
  "$listener.Prefixes.Add(\"http://localhost:$port/\"); " ^
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
