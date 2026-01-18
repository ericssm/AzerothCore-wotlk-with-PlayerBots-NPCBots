@echo off
chcp 65001 >nul
title Deploy SQL Updates to Server
color 0B

echo.
echo ==========================================
echo   Deploy SQL Updates to Server
echo ==========================================
echo.
echo 此工具将：
echo  1. 备份服务器当前的 update 目录
echo  2. 部署新的 SQL 更新文件到服务器
echo.

set /p CONFIRM="确认执行部署吗？ (Y/N): "
if /i not "%CONFIRM%"=="Y" (
    echo.
    echo 已取消操作
    pause
    exit /b 0
)

echo.
echo ==========================================
echo 开始部署...
echo ==========================================
echo.

:: 运行 PowerShell 脚本
powershell.exe -ExecutionPolicy Bypass -File "%~dp0Deploy-SqlUpdates.ps1"

echo.
pause
