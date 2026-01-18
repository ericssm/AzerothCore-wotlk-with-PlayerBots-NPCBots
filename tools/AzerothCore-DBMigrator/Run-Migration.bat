@echo off
chcp 65001 >nul
title AzerothCore Database Migrator
color 0A

echo.
echo ======================================
echo   AzerothCore Database Migrator
echo ======================================
echo.
echo 此工具将归档旧的数据库更新文件
echo.

:: 获取用户输入
set /p BASELINE_DATE="请输入上次更新的日期 (格式: YYYYMMDD, 例如: 20260118): "

:: 验证输入
if "%BASELINE_DATE%"=="" (
    echo.
    echo [错误] 日期不能为空！
    pause
    exit /b 1
)

echo.
echo ======================================
echo 开始归档...
echo 基准日期: %BASELINE_DATE%
echo ======================================
echo.

:: 运行 PowerShell 脚本
powershell.exe -ExecutionPolicy Bypass -File "%~dp0Migrate-DatabaseUpdates.ps1" -BaselineDate "%BASELINE_DATE%"

echo.
echo ======================================
echo 操作完成！
echo ======================================
echo.
echo 请记得更新 update_history.txt 文件
echo.
pause
