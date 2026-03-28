@echo off
chcp 65001 >nul
title RuoYi-Vue Stop All Services

echo.
echo ========================================
echo     RuoYi-Vue Stop All Services
echo ========================================
echo.

echo [1/3] Stopping backend service (Java)...
tasklist /fi "imagename eq java.exe" 2>nul | find /i "java.exe" >nul
if %errorlevel% equ 0 (
    taskkill /f /im java.exe >nul 2>&1
    echo [INFO] Backend service stopped
) else (
    echo [INFO] Backend service not running
)

echo [2/3] Stopping frontend service (Node)...
tasklist /fi "imagename eq node.exe" 2>nul | find /i "node.exe" >nul
if %errorlevel% equ 0 (
    taskkill /f /im node.exe >nul 2>&1
    echo [INFO] Frontend service stopped
) else (
    echo [INFO] Frontend service not running
)

echo [3/3] Stopping Redis service...
tasklist /fi "imagename eq redis-server.exe" 2>nul | find /i "redis-server.exe" >nul
if %errorlevel% equ 0 (
    taskkill /f /im redis-server.exe >nul 2>&1
    echo [INFO] Redis service stopped
) else (
    echo [INFO] Redis service not running
)

echo.
echo ========================================
echo     All services stopped
echo ========================================
echo.

pause
