@echo off
setlocal

set "src=D:\wileylabs-main"
set "dst_base=B:\wileylabs"

if not exist "%src%" (
    echo Source not found: %src%
    pause
    exit /b 1
)

if not exist "%dst_base%" mkdir "%dst_base%"

for /f %%a in ('powershell -NoProfile -Command "Get-Date -Format yyyyMMdd_HHmmss"') do set TS=%%a
set "dst=%dst_base%\%TS%"

robocopy "%src%" "%dst%" /E

if %ERRORLEVEL% GEQ 8 (
    echo Copy failed. ErrorLevel %ERRORLEVEL%
    pause
    exit /b %ERRORLEVEL%
)

echo Copied to: %dst%
start "" "%dst%"
endlocal
