-- Custom XP Bar for levels beyond 80
local frame = CreateFrame("Frame", "CustomXPBarFrame", UIParent)
frame:SetSize(300, 30)
frame:SetPoint("CENTER", UIParent, "TOP", 0, -100)
frame:SetFrameStrata("HIGH")
frame:SetFrameLevel(100)

-- Border
frame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true,
    tileSize = 32,
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
frame:SetBackdropColor(0, 0, 0, 0.8)

-- XP Bar
local bar = CreateFrame("StatusBar", nil, frame)
bar:SetSize(280, 20)
bar:SetPoint("CENTER", frame, "CENTER", 0, 0)
bar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
bar:SetStatusBarColor(0.2, 0.8, 0.2)
bar:SetMinMaxValues(0, 100)
bar:SetValue(0)

-- Text
local text = bar:CreateFontString(nil, "OVERLAY", "GameFontNormal")
text:SetPoint("CENTER", bar, "CENTER", 0, 0)
text:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")

-- Update function
local function UpdateXPBar()
    local level = UnitLevel("player")
    local currentXP = UnitXP("player")
    local maxXP = UnitXPMax("player")
    local restXP = GetXPExhaustion() or 0
    
    if maxXP > 0 then
        local percent = (currentXP / maxXP) * 100
        bar:SetMinMaxValues(0, maxXP)
        bar:SetValue(currentXP)
        
        -- Display text
        local displayText = string.format("等级 %d - %d / %d (%.1f%%)", 
            level, currentXP, maxXP, percent)
        
        if restXP > 0 then
            displayText = displayText .. string.format(" [休息: %d]", restXP)
        end
        
        text:SetText(displayText)
        frame:Show()
    else
        -- Max level reached
        text:SetText(string.format("等级 %d - 满级", level))
        bar:SetValue(100)
    end
end

-- Event handler
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_XP_UPDATE")
frame:RegisterEvent("PLAYER_LEVEL_UP")
frame:RegisterEvent("UPDATE_EXHAUSTION")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

frame:SetScript("OnEvent", function(self, event, ...)
    UpdateXPBar()
end)

-- Make frame movable
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

-- Tooltip
frame:SetScript("OnEnter", function(self)
    GameTooltip:SetOwner(self, "ANCHOR_BOTTOM")
    GameTooltip:SetText("自定义经验条", 1, 1, 1)
    GameTooltip:AddLine("拖动可移动位置", 0.7, 0.7, 0.7)
    GameTooltip:Show()
end)

frame:SetScript("OnLeave", function(self)
    GameTooltip:Hide()
end)

print("|cFF00FF00Custom XP Bar 已加载！|r 支持 255 级")
