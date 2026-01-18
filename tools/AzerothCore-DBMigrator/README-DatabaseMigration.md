# AzerothCore 数据库更新归档工具使用说明

## 工具信息
- **脚本名称**: Migrate-DatabaseUpdates.ps1
- **位置**: d:\az3.3.5TwoBot\AZtwobotSources\
- **用途**: 自动归档旧的数据库更新文件，保留新的更新

---

## 使用说明

### 基本用法

```powershell
.\Migrate-DatabaseUpdates.ps1 -BaselineDate "YYYYMMDD"
```

### 参数说明

- `-BaselineDate`: 上次部署的基准日期（必需）
  - 格式: YYYYMMDD (例如: 20260118)
  - 所有 ≤ 此日期的更新文件将被归档
  - 所有 > 此日期的更新文件将被保留

- `-ServerPath`: 服务器路径（可选）
  - 默认: `D:\az3.3.5TwoBot\wowshub_playerbot_npcbot_newrace_V2.1_20251225_fixreadtextand255level20260117shiyijian`
  - 如果服务器路径改变，使用此参数指定新路径

---

## 使用场景示例

### 场景 1: 日常更新

```powershell
# 假设上次更新是 2026-01-18，现在是 2026-02-15
cd d:\az3.3.5TwoBot\AZtwobotSources
.\Migrate-DatabaseUpdates.ps1 -BaselineDate "20260118"
```

### 场景 2: 更换服务器目录后

```powershell
.\Migrate-DatabaseUpdates.ps1 -BaselineDate "20260118" -ServerPath "D:\NewServer"
```

---

## 最佳实践

### 更新前检查清单

1. ✅ **备份数据库**
   ```bash
   # 运行备份脚本
   .\Tool_BackupDB.ps1
   ```

2. ✅ **记录上次更新日期**
   - 查看 `update_history.txt`（见下方）
   - 或查看上次归档日志

3. ✅ **从 Git 拉取最新代码**
   ```bash
   git pull origin Playerbot
   git submodule update --init --recursive --remote
   ```

4. ✅ **运行归档工具**
   ```powershell
   .\Migrate-DatabaseUpdates.ps1 -BaselineDate "上次日期"
   ```

5. ✅ **重新编译服务器**（如果需要）

6. ✅ **启动 worldserver**
   - 检查日志确认更新成功
   - 确认没有重复文件错误

7. ✅ **记录本次更新日期**
   - 更新 `update_history.txt`

---

## 更新历史记录

建议保存每次更新的记录：

| 日期 | 基准日期 | 归档文件数 | 保留文件数 | 备注 |
|------|---------|----------|----------|------|
| 2026-01-18 | 20251225 | 20 | 84 | 首次使用归档工具 |
| 2026-02-15 | 20260118 | ? | ? | 下次更新... |

---

## 故障排除

### 问题：找不到 updates 目录

**解决方案**: 检查 `-ServerPath` 参数是否正确

### 问题：文件被锁定无法移动

**解决方案**: 
1. 关闭 worldserver
2. 关闭所有访问该目录的程序
3. 重新运行脚本

### 问题：不确定上次更新日期

**解决方案**: 
1. 查看 `update\data\sql\archive\db_world` 中最新的文件日期
2. 这个日期就是上次的基准日期

---

## 维护建议

### 定期清理 archive 目录

```powershell
# 删除 1 年前的归档文件（可选）
$archivePath = "...\update\data\sql\archive\db_world"
Get-ChildItem $archivePath -Filter "2025_*.sql" | Remove-Item
```

### 备份策略

- 每次更新前备份数据库
- 保留至少最近 3 次的备份
- 重要更新前创建完整快照

---

## 技术支持

如需修改脚本或遇到问题，请联系开发人员或查看脚本源码注释。

脚本使用的是标准 PowerShell，易于维护和扩展。
