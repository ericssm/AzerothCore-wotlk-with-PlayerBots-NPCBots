---
name: "wow_custom_race_fixes"
description: "Fixes for WoW Custom Race shapeshifting visuals, totem rendering, server stability (overloading), and UI Lua bugs in transmog addons"
---

# 魔兽世界：自定义种族核心问题修复总结 (Skills)

本 Skill 文档记录了针对 AzerothCore 3.3.5 带有 Custom Race 和 Playerbot、NPCbot 的服务端版本中，几个最致命和隐蔽的Bug及其修复方案。此文档可以保留作为后续排查此类问题的核心知识库。

## 问题 1：变鬼狼后模型扭曲出错、小德变豹子模型错误及解除变身头盔变成黑方块 (Shapeshift Visual & Gender Bug)

**问题表现：**
自定义种族在进行“变狼”、“变成猎豹”等改变模型的变身（Shapeshift）后，模型变得非常丑陋扭曲。不仅如此，当取消变身恢复人形时，头盔直接渲染失败，变成一个黑色的方块显示在头上！

**根本原因：**
服务端处理变身形态时，某些生物模型（例如狼、猎豹）的性别是默认的 `GENDER_NONE`。原生种族在 `SetDisplayId` 更新性别为 `GENDER_NONE` 时能够正确读取到自身的原始性别，但是对于**自定义种族（Custom Race）**，原生游戏逻辑并未做处理，导致自定义种族取消变形时，服务端错误地将其当前物理性别永久写成了 `GENDER_NONE`。这就导致原本的人形头盔无法找到对应性别的渲染路线，直接渲染黑块。

**修复方案：**
修复位于源码的 `src/server/game/Entities/Unit/Unit.cpp` 中的 `Unit::SetDisplayId(uint32 modelId)` 函数：
当模型 ID 试图恢复为当前角色的 `GetNativeDisplayId()` (即人类形态) 时，应该强制使用角色最真实的属性 `GetNativeGender()`，而不是依赖于变身残留下来的错误性别 `GENDER_NONE`。
```cpp
// 修复核心代码逻辑：在恢复原生模型时，强制恢复原生性别
if (modelId == GetNativeDisplayId()) {
    if (Player* player = ToPlayer()) {
        SetByteValue(UNIT_FIELD_BYTES_0, 2, player->GetNativeGender());
    } else {
        SetByteValue(UNIT_FIELD_BYTES_0, 2, GetNativeGender());
    }
}
```

---

## 问题 2：新种族图腾模型不显示/错误 (Totem Models Fix)

**问题表现：**
新添加的自定义种族（尤其是萨满）在插图腾时，图腾可能不显示，或者显示的种类、模型并非原汁原味的图腾（或者串模型了）。

**根本原因：**
AzerothCore 的数据库扩展（如 `playerbot_world.player_totem_model.sql` 等表）中，写死了旧有原生种族对应的图腾模型 ID (DisplayID)。自定义种族的 Race ID 缺少对应的数据插入。

**修复方案：**
在数据库中针对该自定义种族的 `race_id`，补全不同属性图腾（地、水、火、风）对应的 Model ID 条目，确保图腾的 display id 存在且合法。

---

## 问题 3：服务器假死崩溃卡主，循环刷新率 412 秒/帧 (Server Stability/Playerbot Overload)

**问题表现：**
游戏客户端无法登入停留在响应界面，服务器后台不崩溃，但是直接“卡死”。后台打印红字：`Update time diff: 412893ms`，意思是服务器跑了一帧竟然用了极其夸张的 7 分钟时间，将底层 CPU 或者 IO 直接全堵死了（即使有 128GB 的物理内存也会挂掉）。

**根本原因：**
配置了过量了后台真实 AI 电脑人：
`AiPlayerbot.MaxRandomBots = 1000`
虽然服务器内存完全够用，由于 Playerbot 是高度复杂的实体，它们需要计算寻路、施法判断且跟数据库极高频率的重读写交互。1000 个后台机器人直接吃瘪了单线程和数据库连接池，使得游戏引擎陷入假死等待状态。

**修复方案：**
修改 Playerbots 服务端独立配置文件：`configs/modules/playerbots.conf`
把并发运行机器人数值降到物理机单线程算力能顶得住的安全范围：
```ini
AiPlayerbot.MinRandomBots = 50
AiPlayerbot.MaxRandomBots = 150
```
大幅度缩减无意义的待命机器人，世界依旧保持热闹但服务器刷新率将回到正常的 <50ms 级别。

---

## 问题 4：ezCollections 幻化插件 lua 报错 "attempt to index field 'controlFrame' / 'settings' (a nil value)" 和 PortraitHelpBox

**问题表现：**
登录游戏打开幻化等功能时，频繁引发 Lua 红字报错：
- `ModelFrames.lua:57: attempt to index field 'settings'`
- `Blizzard_Wardrobe.lua:748: ... controlFrame ...`
- `[string "*:OnLoad"]:1: attempt to index field 'Glow' ...`

**根本原因：**
因为使用了自定义种族，旧版 `ezCollections` 在按原生性别查找镜头距离表（如 `ModelSettings["CustomRaceMale"]`）时找不到数据，导致 `settings` 为 `nil` 而全局崩溃。同时最新版本的 XML 缺失 `GlowBoxArrowTemplate` 以及部分由于 `controlFrame` 没初始化引发的链式崩溃。

**修复方案：**
1. **Fallback 保底处理：** 修改插件 `ModelFrames.lua` 下的 `SelectSettings(model)` 方法。如果查不到对应种族的视角参数，强行附一个 `"HumanMale"` 的安全值作为保底兜底。
2. **XML 添加兼容父级发光框：** 将报错的 `Blizzard_Collections.xml` 中无名箭头的框架 `<Frame parentKey="Arrow" inherits="GlowBoxArrowTemplate">` 显式声明 Name 避免 `index 'Glow'` 的 nil 异常。
3. **判空跳过操作：** 在 `Blizzard_Wardrobe.lua` 第 748 行和 755 行添加 `if (WardrobeTransmogFrame.Model.controlFrame) then ... end` 的防空崩溃检测。

---
## End of Documentation
