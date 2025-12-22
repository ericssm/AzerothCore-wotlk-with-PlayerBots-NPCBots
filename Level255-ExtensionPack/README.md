# Level 255 Extension Pack (255级扩展包)

## 📋 简介

将 AzerothCore WoW 3.3.5 服务器的最大等级从 80 级扩展到 255 级的完整解决方案。

**版本:** 1.0  
**作者:** Custom  
**适用:** AzerothCore 3.3.5 (WotLK)  
**创建日期:** 2025-12-23

---

## 📦 包含内容

### 1. **源代码修改**
- 修改 `src/server/shared/DataStores/DBCEnums.h`
- 将 `MAX_LEVEL` 从 100 改为 255

### 2. **数据库文件**
- `Database/Player225Stats.sql` - 81-255 级角色属性数据
- 增长率：每级 +3% (公式: 1.03^x)

### 3. **客户端插件**
- `ClientAddon/CustomXPBar/` - 自定义经验条插件
- 显示 81-255 级的经验进度

---

## 🚀 安装步骤

### 步骤 1: 修改源代码

编辑文件：
```
src/server/shared/DataStores/DBCEnums.h
```

找到第 39 行，修改：
```cpp
// 修改前
#define MAX_LEVEL    100

// 修改后
#define MAX_LEVEL    255
```

### 步骤 2: 重新编译服务器

```powershell
cd var/build
cmake ../..
cmake --build . --config RelWithDebInfo --target worldserver
```

### 步骤 3: 导入数据库

```sql
mysql -u acore -pacore acore_world < Database/Player225Stats.sql
```

或者在 SQLyog/HeidiSQL 中导入 `Database/Player225Stats.sql`

### 步骤 4: 修改配置文件

编辑 `worldserver.conf`：

```ini
# 找到这一行
MaxPlayerLevel = 80

# 改为
MaxPlayerLevel = 255
```

### 步骤 5: 安装客户端插件

复制 `ClientAddon/CustomXPBar/` 到游戏客户端：

```
客户端路径/Interface/AddOns/
```

完整路径示例：
```
D:/World of Warcraft/Interface/AddOns/CustomXPBar/
```

### 步骤 6: 重启服务器

重启 worldserver，应该看到：
```
✅ Config loaded: MaxPlayerLevel = 255
```

---

## ✅ 验证安装

### 服务器端验证：

```
1. 启动 worldserver
2. 检查日志，确认无错误
3. 登录游戏
```

### 游戏内验证：

```sql
.level 100   # 应该成功
.level 150   # 应该成功
.level 255   # 应该成功
```

### 经验条验证：

1. 进入游戏
2. 屏幕顶部应该显示绿色经验条
3. 可拖动移动位置

---

## 📊 属性增长

### 增长公式：

```
等级 X 的属性 = 80级属性 × 1.03^(X - 80)
```

### 示例（假设 80 级力量 = 1000）：

| 等级 | 力量 | 相比80级 |
|------|------|---------|
| 80 | 1,000 | 基准 |
| 100 | 1,806 | +80.6% |
| 150 | 7,918 | +691.8% |
| 200 | 34,702 | +3370% |
| 255 | 254,000+ | +25300%+ |

---

## ⚙️ 配置

### 调整经验获取速率

编辑 `worldserver.conf`：

```ini
Rate.XP.Kill = 10      # 击杀怪物经验 x10
Rate.XP.Quest = 10     # 任务经验 x10
Rate.XP.Explore = 10   # 探索经验 x10
```

### 自定义属性增长率

如果想修改增长率，编辑 `Database/Player225Stats.sql`：

```sql
# 找到这一行（每个职业都有）
POWER(1.03, levels.`Level` - @startLevel)

# 修改 1.03 为其他值：
# 1.02 = 每级 +2%
# 1.05 = 每级 +5%
# 1.10 = 每级 +10%
```

---

## 🐛 常见问题

### Q: 启动服务器时报错 "MaxPlayerLevel failed validation"

**A:** 源代码未正确编译。确保：
1. 修改了 `DBCEnums.h`
2. 重新编译了 worldserver
3. 使用的是新编译的可执行文件

---

### Q: 80 级后经验条消失

**A:** WoW 3.3.5 客户端硬编码了 80 级上限。解决方案：
1. 使用提供的 CustomXPBar 插件
2. 或使用宏查看经验：
```lua
/run local xp,max=UnitXP("player"),UnitXPMax("player");print(string.format("%d/%d (%.1f%%)",xp,max,(xp/max)*100))
```

---

### Q: 属性没有按照预期增长

**A:** 检查：
1. SQL 是否成功导入
2. 查询数据库确认数据存在：
```sql
SELECT * FROM player_class_stats WHERE Level > 80 LIMIT 10;
```

---

### Q: 客户端插件不显示

**A:** 尝试：
1. 角色选择界面启用插件
2. 游戏内输入：`/run ReloadUI()`
3. 或输入：`/run CustomXPBarFrame:Show()`

---

## 📝 文件结构

```
Level255-ExtensionPack/
├── README.md                    # 本文件
├── CHANGELOG.md                 # 更新日志
├── ClientAddon/                 # 客户端插件
│   └── CustomXPBar/
│       ├── CustomXPBar.toc
│       └── CustomXPBar.lua
├── Database/                    # 数据库文件
│   └── Player225Stats.sql
└── Docs/                        # 文档
    ├── 安装指南.md
    └── 源代码修改说明.md
```

---

## ⚠️ 注意事项

1. **备份数据库**  
   导入 SQL 前务必备份 `acore_world` 数据库

2. **编译时间**  
   重新编译可能需要 10-30 分钟

3. **客户端限制**  
   某些 UI 元素可能不支持 80+ 级，使用插件解决

4. **平衡性**  
   255 级时属性会极其夸张，建议配合副本难度调整模块使用

---

## 🔗 相关链接

- **AzerothCore**: https://github.com/azerothcore/azerothcore-wotlk
- **问题反馈**: [创建 Issue]

---

## 📜 许可

MIT License - 自由使用和修改

---

## 🙏 致谢

- AzerothCore 开发团队
- WoW 模拟器社区

---

**享受你的 255 级之旅！** 🎮✨
