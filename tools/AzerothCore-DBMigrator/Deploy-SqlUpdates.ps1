# AzerothCore 数据库更新部署脚本
# 将源代码的 SQL 更新部署到服务器

param(
    [string]$SourcePath = "D:\az3.3.5TwoBot\AZtwobotSources\data\sql",
    [string]$ServerPath = "D:\az3.3.5TwoBot\wowshub_playerbot_npcbot_newrace_V2.1_20251225_fixreadtextand255level20260117shiyijian",
    [switch]$SkipBackup
)

$ErrorActionPreference = "Stop"

Write-Host "====== AzerothCore SQL Update Deployer ======" -ForegroundColor Cyan
Write-Host ""

# 生成备份日期标签
$BackupDate = Get-Date -Format "yyyyMMdd"
$BackupTime = Get-Date -Format "HHmmss"

# 路径定义
$SourceSqlPath = $SourcePath
$ServerUpdatePath = Join-Path $ServerPath "update"
$ServerDataSqlPath = Join-Path $ServerUpdatePath "data\sql"
$BackupPath = Join-Path $ServerPath "update-backup-$BackupDate"

Write-Host "源代码路径: $SourceSqlPath" -ForegroundColor Yellow
Write-Host "服务器路径: $ServerDataSqlPath" -ForegroundColor Yellow
Write-Host "备份路径: $BackupPath" -ForegroundColor Yellow
Write-Host ""

# 检查源路径
if (-not (Test-Path $SourceSqlPath)) {
    Write-Host "❌ 错误: 源代码 SQL 路径不存在!" -ForegroundColor Red
    Write-Host "   路径: $SourceSqlPath" -ForegroundColor Red
    exit 1
}

# 检查服务器路径
if (-not (Test-Path $ServerUpdatePath)) {
    Write-Host "❌ 错误: 服务器 update 路径不存在!" -ForegroundColor Red
    Write-Host "   路径: $ServerUpdatePath" -ForegroundColor Red
    exit 1
}

# 步骤 1: 备份当前服务器的 update 目录
if (-not $SkipBackup) {
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
    Write-Host "步骤 1/3: 备份当前服务器 update 目录" -ForegroundColor Cyan
    Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
    
    if (Test-Path $BackupPath) {
        $BackupPath = "${BackupPath}_${BackupTime}"
        Write-Host "⚠ 备份目录已存在，使用时间戳: $BackupPath" -ForegroundColor Yellow
    }
    
    Write-Host "正在备份..." -ForegroundColor Gray
    Copy-Item -Path $ServerUpdatePath -Destination $BackupPath -Recurse -Force
    Write-Host "✓ 备份完成: $BackupPath" -ForegroundColor Green
    Write-Host ""
}
else {
    Write-Host "⚠ 跳过备份（使用了 -SkipBackup 参数）" -ForegroundColor Yellow
    Write-Host ""
}

# 步骤 2: 删除服务器中的旧 data/sql 目录
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "步骤 2/3: 清理服务器旧的 SQL 文件" -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan

if (Test-Path $ServerDataSqlPath) {
    Write-Host "正在删除旧文件..." -ForegroundColor Gray
    Remove-Item -Path $ServerDataSqlPath -Recurse -Force
    Write-Host "✓ 旧文件已删除" -ForegroundColor Green
}
else {
    Write-Host "ℹ 服务器 data/sql 目录不存在，跳过清理" -ForegroundColor Gray
}
Write-Host ""

# 步骤 3: 复制源代码的 SQL 文件到服务器
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "步骤 3/3: 部署新的 SQL 文件" -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan

Write-Host "正在复制文件..." -ForegroundColor Gray

# 确保目标目录的 data 文件夹存在
$ServerDataPath = Join-Path $ServerUpdatePath "data"
if (-not (Test-Path $ServerDataPath)) {
    New-Item -ItemType Directory -Path $ServerDataPath -Force | Out-Null
}

# 复制 sql 目录
Copy-Item -Path $SourceSqlPath -Destination $ServerDataPath -Recurse -Force

Write-Host "✓ SQL 文件部署完成" -ForegroundColor Green
Write-Host ""

# 统计信息
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "部署统计" -ForegroundColor Cyan
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan

# 统计 updates 文件数量
$databases = @("db_auth", "db_characters", "db_world")
$totalUpdates = 0

foreach ($db in $databases) {
    $updatesPath = Join-Path $ServerDataSqlPath "updates\$db"
    if (Test-Path $updatesPath) {
        $count = (Get-ChildItem -Path $updatesPath -Filter "*.sql" -File).Count
        Write-Host "  ✓ $db`: $count 个新更新" -ForegroundColor Green
        $totalUpdates += $count
    }
}

Write-Host ""
Write-Host "总计: $totalUpdates 个待应用的更新文件" -ForegroundColor Yellow

if (-not $SkipBackup) {
    Write-Host "备份位置: $BackupPath" -ForegroundColor Gray
}

Write-Host ""
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host "✅ 部署完成！现在可以启动 worldserver" -ForegroundColor Green
Write-Host "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" -ForegroundColor Cyan
Write-Host ""
