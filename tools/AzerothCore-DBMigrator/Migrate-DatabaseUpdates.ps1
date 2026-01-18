# AzerothCore 数据库更新自动化归档脚本
# 基于版本比对的专业数据库迁移管理

param(
    [string]$BaselineDate = "20251225",  # 上次部署的基准日期
    [string]$ServerPath = "D:\az3.3.5TwoBot\wowshub_playerbot_npcbot_newrace_V2.1_20251225_fixreadtextand255level20260117shiyijian"
)

Write-Host "==== AzerothCore Database Migration Manager ====" -ForegroundColor Cyan
Write-Host "Baseline Date: $BaselineDate" -ForegroundColor Yellow
Write-Host "Server Path: $ServerPath`n" -ForegroundColor Yellow

# 定义数据库列表
$databases = @(
    @{Name = "Auth"; Path = "db_auth" },
    @{Name = "Characters"; Path = "db_characters" },
    @{Name = "World"; Path = "db_world" }
)

$totalArchived = 0
$totalKept = 0

foreach ($db in $databases) {
    Write-Host "`n=== Processing $($db.Name) Database ===" -ForegroundColor Cyan
    
    $updatesPath = Join-Path $ServerPath "update\data\sql\updates\$($db.Path)"
    $archivePath = Join-Path $ServerPath "update\data\sql\archive\$($db.Path)"
    
    # 检查目录
    if (-not (Test-Path $updatesPath)) {
        Write-Host "  ⚠ Updates directory not found, skipping..." -ForegroundColor Yellow
        continue
    }
    
    # 创建 archive 目录
    if (-not (Test-Path $archivePath)) {
        New-Item -ItemType Directory -Path $archivePath -Force | Out-Null
    }
    
    # 获取所有更新文件
    $files = Get-ChildItem -Path $updatesPath -Filter "*.sql" -File
    
    $archived = 0
    $kept = 0
    
    foreach ($file in $files) {
        # 解析文件日期
        if ($file.Name -match '^(\d{4})_(\d{2})_(\d{2})') {
            $fileDate = $Matches[1] + $Matches[2] + $Matches[3]
            
            # 比较日期
            if ([int]$fileDate -le [int]$BaselineDate) {
                # 归档旧文件
                Move-Item -Path $file.FullName -Destination $archivePath -Force
                $archived++
            }
            else {
                # 保留新文件
                $kept++
            }
        }
        else {
            Write-Host "  ⚠ Invalid filename format: $($file.Name)" -ForegroundColor Yellow
        }
    }
    
    Write-Host "  ✓ Archived: $archived files" -ForegroundColor Gray
    Write-Host "  ✓ Kept: $kept files" -ForegroundColor Green
    
    $totalArchived += $archived
    $totalKept += $kept
}

Write-Host "`n==== Migration Complete ====" -ForegroundColor Cyan
Write-Host "Total Archived: $totalArchived" -ForegroundColor Yellow
Write-Host "Total Kept: $totalKept" -ForegroundColor Green
Write-Host "`nServer is ready to start with clean update state." -ForegroundColor Cyan
