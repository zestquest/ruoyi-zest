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

where java >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Java not found, please install JDK 17 first
    pause
    exit /b 1
)

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
        timeout /t 3 >nul
    ) else (
        echo [WARNING] Redis not found in PATH, please start Redis manually
        echo [HINT] If Redis is installed, add it to PATH or start it manually
    )
)

echo [3/5] Starting backend service...
start "RuoYi-Backend" cmd /k "java -Xms256m -Xmx1024m -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=512m -jar "%JAR_PATH%""
echo [INFO] Backend starting, please wait about 30 seconds...
echo [INFO] Check the backend window for any errors...
timeout /t 5 >nul

echo [4/5] Starting frontend service...
cd /d "%FRONTEND_DIR%"
if exist "node_modules" (
    start "RuoYi-Frontend" cmd /k "npm run dev"
    echo [INFO] Frontend starting...
) else (
    echo [WARNING] node_modules not found, please run: npm install
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
