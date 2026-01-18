# AzerothCore Database Migrator

🚀 **专业的 AzerothCore 数据库更新归档与部署工具**

## 📋 简介

这是一个用于 AzerothCore 服务器的完整数据库更新管理解决方案。包含两个核心工具：
1. **归档工具** - 在源代码目录清理旧的 SQL 更新文件
2. **部署工具** - 将清理后的 SQL 文件部署到服务器

## 🔄 完整工作流程（两步走）

### 第一步：归档源代码中的旧更新
```
双击 Run-Migration.bat
→ 输入上次更新日期（查看 update_history.txt）
→ 归档 data/sql 中 ≤ 该日期的文件
→ 保留新增的更新文件
```

### 第二步：部署到服务器
```
双击 Deploy-SqlUpdates.bat
→ 自动备份服务器当前的 update 目录（名称：update-backup-YYYYMMDD）
→ 复制源代码的 data/sql 到服务器的 update/data/sql
→ 完成！启动 worldserver 应用更新
```

## ✨ 功能特性

- ✅ **自动化归档** - 一键归档所有数据库（auth, characters, world）的旧更新
- ✅ **智能比对** - 基于日期自动判断哪些文件需要归档
- ✅ **安全可靠** - 只移动文件，不删除，可随时恢复
- ✅ **详细日志** - 清晰显示归档和保留的文件数量
- ✅ **易于使用** - 单条命令完成所有操作

## 📁 文件说明

```
AzerothCore-DBMigrator/
├── Migrate-DatabaseUpdates.ps1    # 主工具脚本
├── update_history.txt              # 更新历史记录
├── README.md                       # 本文件
└── Run-Migration.bat               # Windows 快捷启动（双击运行）
```

## 🚀 快速开始

### 方法 1: 使用快捷方式（推荐）

1. 双击 `Run-Migration.bat`
2. 输入上次更新的日期（格式：YYYYMMDD）
3. 完成！

### 方法 2: 使用 PowerShell

```powershell
cd tools\AzerothCore-DBMigrator
.\Migrate-DatabaseUpdates.ps1 -BaselineDate "20260118"
```

## 📖 使用说明

### 参数说明

- **BaselineDate** (必需)
  - 上次部署/更新的基准日期
  - 格式: YYYYMMDD（例如：20260118）
  - 所有 ≤ 此日期的文件将被归档
  - 所有 > 此日期的文件将被保留

- **ServerPath** (可选)
  - 服务器运行目录
  - 如果服务器路径改变，使用此参数指定

### 使用场景

**场景：从上次更新（2026-01-18）到现在（2026-02-15）拉取了新代码**

```powershell
# 归档 2026-01-18 及之前的更新
.\Migrate-DatabaseUpdates.ps1 -BaselineDate "20260118"
```

## 📊 工作原理

```
┌─────────────────────────────────────────┐
│  1. 读取更新目录                       │
│     - db_auth/updates                   │
│     - db_characters/updates             │
│     - db_world/updates                  │
└─────────────────────────────────────────┘
              ↓
┌─────────────────────────────────────────┐
│  2. 按日期比对文件                     │
│     - ≤ BaselineDate → 归档            │
│     - > BaselineDate → 保留            │
└─────────────────────────────────────────┘
              ↓
┌─────────────────────────────────────────┐
│  3. 移动文件到 archive 目录            │
│     - updates/ → archive/              │
└─────────────────────────────────────────┘
              ↓
┌─────────────────────────────────────────┐
│  4. 显示统计结果                       │
│     - 归档了多少文件                   │
│     - 保留了多少文件                   │
└─────────────────────────────────────────┘
```

## 🔄 完整更新流程

### 更新前

```bash
# 1. 备份数据库
cd _Release_Management/00_Tools
.\Tool_BackupDB.ps1

# 2. 查看上次更新日期
cd ../../tools/AzerothCore-DBMigrator
cat update_history.txt
```

### 更新代码

```bash
# 3. 拉取最新代码
cd ../..
git pull origin Playerbot
git submodule update --init --recursive --remote
```

### 归档更新

```bash
# 4. 运行归档工具
cd tools/AzerothCore-DBMigrator
.\Migrate-DatabaseUpdates.ps1 -BaselineDate "上次更新日期"
```

### 更新后

```bash
# 5. 重新编译（如需要）
cd ../..
cd build
cmake --build . --config RelWithDebInfo

# 6. 启动服务器测试

# 7. 记录本次更新
cd ../tools/AzerothCore-DBMigrator
notepad update_history.txt  # 添加本次记录
```

## 📝 更新历史记录

请在每次使用后更新 `update_history.txt`，记录：
- 更新日期
- 使用的基准日期
- 归档文件数量
- 任何特殊说明

这样下次就能快速找到正确的基准日期！

## ⚠️ 注意事项

1. **首次使用需要确认基准日期**
   - 查看 archive 目录中最新的文件日期
   - 或查看上次部署的日期

2. **归档不是删除**
   - 文件只是移动到 archive 目录
   - 如需恢复，可手动移回 updates 目录

3. **更新前备份数据库**
   - 使用 `Tool_BackupDB.ps1` 备份
   - 保留至少最近 3 次备份

## 🛠️ 故障排除

### 问题：提示找不到 updates 目录

**解决方案**: 
```powershell
# 使用 -ServerPath 参数指定正确的服务器路径
.\Migrate-DatabaseUpdates.ps1 -BaselineDate "20260118" `
  -ServerPath "D:\YourServerPath"
```

### 问题：文件被占用无法移动

**解决方案**: 
1. 关闭 worldserver.exe
2. 关闭任何打开该目录的程序
3. 重新运行工具

### 问题：不确定基准日期

**解决方案**: 
```powershell
# 查看 archive 目录中最新的文件
dir "服务器路径\update\data\sql\archive\db_world" | Sort-Object Name -Descending | Select-Object -First 5
```

## 📞 技术支持

- **脚本语言**: PowerShell 5.1+
- **兼容系统**: Windows 10/11, Windows Server
- **依赖**: 无（纯 PowerShell，无需额外安装）

## 📜 版本历史

- **v1.0** (2026-01-18)
  - ✨ 首次发布
  - ✅ 支持三个数据库自动归档
  - ✅ 基于日期的智能比对
  - ✅ 详细的操作日志

## 📄 许可证

本工具遵循 AzerothCore 项目的开源协议。

---

**Made with ❤️ for AzerothCore Community**
