@echo off
chcp 65001 >nul
title RuoYi-Vue Start All Services

echo.
echo ========================================
echo     RuoYi-Vue Start All Services
echo ========================================
echo.

set PROJECT_DIR=%~dp0..
set JAR_PATH=%PROJECT_DIR%\ruoyi-admin\target\ruoyi-admin.jar
set FRONTEND_DIR=%PROJECT_DIR%\ruoyi-ui

echo [1/5] Checking environment...

if defined JAVA_HOME (
    set "JAVA_CMD=%JAVA_HOME%\bin\java.exe"
    if exist "%JAVA_CMD%" (
        echo [INFO] Using JAVA_HOME: %JAVA_HOME%
        goto :java_check_version
    )
)

where java >nul 2>&1
if %errorlevel% equ 0 (
    set "JAVA_CMD=java"
    goto :java_check_version
)

echo [ERROR] Java not found, please install JDK 17 first
echo [HINT] Make sure JAVA_HOME is set or Java is in PATH
pause
exit /b 1

:java_check_version
"%JAVA_CMD%" -version 2>&1 | findstr /i "version" | findstr /i "17 18 19 20 21 22 23 24 25" >nul
if %errorlevel% neq 0 (
    echo [ERROR] Java version must be 17 or higher
    echo [INFO] Current Java version:
    "%JAVA_CMD%" -version 2>&1 | findstr /i "version"
    pause
    exit /b 1
)

echo [INFO] Java version check passed

:java_found

if not exist "%JAR_PATH%" (
    echo [ERROR] Backend JAR not found: %JAR_PATH%
    echo [HINT] Please run: mvn clean package -DskipTests
    pause
    exit /b 1
)

echo [2/5] Checking Redis service...
redis-cli ping >nul 2>&1
if %errorlevel% equ 0 (
    echo [INFO] Redis service is already running
) else (
    where redis-server >nul 2>&1
    if %errorlevel% equ 0 (
        echo [INFO] Starting Redis service...
        start "Redis Server" redis-server
        ping -n 4 127.0.0.1 >nul
    ) else (
        echo [WARNING] Redis not found in PATH, please start Redis manually
        echo [HINT] If Redis is installed, add it to PATH or start it manually
    )
)

echo [3/5] Starting backend service...
start "RuoYi-Backend" cmd /k ""%JAVA_CMD%" -Xms256m -Xmx1024m -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m -jar "%JAR_PATH%""
echo [INFO] Backend starting, please wait about 30 seconds...
echo [INFO] Check the backend window for any errors...
ping -n 6 127.0.0.1 >nul

echo [4/5] Starting frontend service...
cd /d "%FRONTEND_DIR%"
if exist "node_modules" (
    start "RuoYi-Frontend" cmd /k "npm run dev"
    echo [INFO] Frontend starting...
) else (
    echo [INFO] node_modules not found, running npm install...
    start "RuoYi-Frontend" cmd /k "npm install && npm run dev"
    echo [INFO] Installing dependencies and starting frontend...
)

echo [5/5] Done!

echo.
echo ========================================
echo     All services started!
echo ========================================
echo.
echo Backend:  http://localhost:8080
echo Frontend: http://localhost:80
echo Account:  admin / admin123
echo.
echo [HINT] Please wait for backend to start before accessing frontend
echo [HINT] Make sure MySQL and Redis are running
echo [HINT] If backend failed, check the backend window for error messages
echo.

pause
