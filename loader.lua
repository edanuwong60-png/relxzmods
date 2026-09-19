--[[ RelxzMods v3.1 - Rainbow Edition --]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local Config = {
    Aimbot = false,
    ESP = false,
    WallCheck = true,
    FOV = 150,
    Smoothness = 0.25,
    TargetPart = "Head",
}

if not Drawing then
    warn("No Drawing API")
    return
end

-- =========================================
-- RAINBOW HELPER
-- =========================================
local rainbowObjects = {}

local function registerRainbow(obj, prop)
    table.insert(rainbowObjects, {obj = obj, prop = prop or "BackgroundColor3"})
end

-- Update rainbow tiap frame
RunService.RenderStepped:Connect(function()
    local t = tick()
    for _, item in ipairs(rainbowObjects) do
        if item.obj and item.obj.Parent then
            local hue = (t * 0.15 + (item.offset or 0)) % 1
            local color = Color3.fromHSV(hue, 0.8, 1)
            pcall(function()
                item.obj[item.prop] = color
            end)
        end
    end
end)

-- =========================================
-- UI
-- =========================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RelxzMods"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
pcall(function() ScreenGui.Parent = game.CoreGui end)

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 270, 0, 430)
Main.Position = UDim2.new(0, 20, 0.5, -215)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

local Stroke = Instance.new("UIStroke")
Stroke.Thickness = 1.5
Stroke.Transparency = 0.2
Stroke.Parent = Main
registerRainbow(Stroke, "Color")

-- ===== LOGO BANNER =====
local LogoFrame = Instance.new("Frame")
LogoFrame.Size = UDim2.new(1, 0, 0, 75)
LogoFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
LogoFrame.BorderSizePixel = 0
LogoFrame.Parent = Main
Instance.new("UICorner", LogoFrame).CornerRadius = UDim.new(0, 10)

-- Logo box
local LogoBox = Instance.new("Frame")
LogoBox.Size = UDim2.new(0, 65, 0, 65)
LogoBox.Position = UDim2.new(0, 8, 0, 5)
LogoBox.BackgroundColor3 = Color3.fromRGB(90, 160, 240)
LogoBox.BorderSizePixel = 0
LogoBox.Parent = LogoFrame
Instance.new("UICorner", LogoBox).CornerRadius = UDim.new(0, 10)
registerRainbow(LogoBox, "BackgroundColor3")

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Color = Color3.fromRGB(255, 255, 255)
LogoStroke.Thickness = 1
LogoStroke.Transparency = 0.3
LogoStroke.Parent = LogoBox

-- Teks "RM"
local LogoInitials = Instance.new("TextLabel")
LogoInitials.Size = UDim2.new(1, 0, 1, 0)
LogoInitials.BackgroundTransparency = 1
LogoInitials.Text = "RM"
LogoInitials.TextColor3 = Color3.fromRGB(255, 255, 255)
LogoInitials.Font = Enum.Font.GothamBlack
LogoInitials.TextSize = 28
LogoInitials.Parent = LogoBox

-- Judul "RELXZ MODS" - rainbow
local LogoTextShadow = Instance.new("TextLabel")
LogoTextShadow.Size = UDim2.new(1, -82, 1, 0)
LogoTextShadow.Position = UDim2.new(0, 73, 0, 1)
LogoTextShadow.BackgroundTransparency = 1
LogoTextShadow.Text = "RELXZ MODS"
LogoTextShadow.TextColor3 = Color3.fromRGB(0, 0, 0)
LogoTextShadow.TextXAlignment = Enum.TextXAlignment.Left
LogoTextShadow.Font = Enum.Font.GothamBlack
LogoTextShadow.TextSize = 19
LogoTextShadow.Parent = LogoFrame

local LogoText = Instance.new("TextLabel")
LogoText.Size = UDim2.new(1, -80, 1, 0)
LogoText.Position = UDim2.new(0, 72, 0, 0)
LogoText.BackgroundTransparency = 1
LogoText.Text = "RELXZ MODS"
LogoText.TextColor3 = Color3.fromRGB(240, 240, 255)
LogoText.TextXAlignment = Enum.TextXAlignment.Left
LogoText.Font = Enum.Font.GothamBlack
LogoText.TextSize = 19
LogoText.Parent = LogoFrame
registerRainbow(LogoText, "TextColor3")

local LogoSub = Instance.new("TextLabel")
LogoSub.Size = UDim2.new(1, -80, 0, 16)
LogoSub.Position = UDim2.new(0, 72, 0, 42)
LogoSub.BackgroundTransparency = 1
LogoSub.Text = "Powerful tools. One mirror."
LogoSub.TextColor3 = Color3.fromRGB(140, 140, 180)
LogoSub.TextXAlignment = Enum.TextXAlignment.Left
LogoSub.Font = Enum.Font.Gotham
LogoSub.TextSize = 10
LogoSub.Parent = LogoFrame

-- Garis pembatas rainbow
local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(1, -20, 0, 1.5)
Divider.Position = UDim2.new(0, 10, 0, 76)
Divider.BackgroundColor3 = Color3.fromRGB(120, 80, 220)
Divider.BorderSizePixel = 0
Divider.Parent = Main
registerRainbow(Divider, "BackgroundColor3")

-- TITLE
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -90, 0, 20)
Title.Position = UDim2.new(0, 12, 0, 80)
Title.BackgroundTransparency = 1
Title.Text = "RelxzMods v3.1 Rainbow"
Title.TextColor3 = Color3.fromRGB(150, 150, 180)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.Gotham
Title.TextSize = 10
Title.Parent = Main

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 24, 0, 24)
CloseBtn.Position = UDim2.new(1, -30, 0, 78)
CloseBtn.BackgroundColor3 = Color3.fromRGB(60, 40, 40)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(240, 200, 200)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 13
CloseBtn.Parent = Main
Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local HideBtn = Instance.new("TextButton")
HideBtn.Size = UDim2.new(0, 24, 0, 24)
HideBtn.Position = UDim2.new(1, -60, 0, 78)
HideBtn.BackgroundColor3 = Color3.fromRGB(40, 50, 60)
HideBtn.Text = "-"
HideBtn.TextColor3 = Color3.fromRGB(200, 220, 240)
HideBtn.Font = Enum.Font.GothamBold
HideBtn.TextSize = 16
HideBtn.Parent = Main
Instance.new("UICorner", HideBtn).CornerRadius = UDim.new(0, 6)

local MiniBtn = Instance.new("TextButton")
MiniBtn.Size = UDim2.new(0, 55, 0, 55)
MiniBtn.Position = UDim2.new(0, 20, 0.5, -27)
MiniBtn.BackgroundColor3 = Color3.fromRGB(90, 160, 240)
MiniBtn.Text = "RM"
MiniBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MiniBtn.Font = Enum.Font.GothamBlack
MiniBtn.TextSize = 20
MiniBtn.Visible = false
MiniBtn.Parent = ScreenGui
Instance.new("UICorner", MiniBtn).CornerRadius = UDim.new(0, 10)
registerRainbow(MiniBtn, "BackgroundColor3")

local MiniStroke = Instance.new("UIStroke")
MiniStroke.Color = Color3.fromRGB(255, 255, 255)
MiniStroke.Thickness = 1
MiniStroke.Transparency = 0.3
MiniStroke.Parent = MiniBtn

HideBtn.MouseButton1Click:Connect(function()
    Main.Visible = false; MiniBtn.Visible = true
end)
MiniBtn.MouseButton1Click:Connect(function()
    Main.Visible = true; MiniBtn.Visible = false
end)
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        Main.Visible = not Main.Visible
        MiniBtn.Visible = not MiniBtn.Visible
    end
end)

-- LIST
local List = Instance.new("Frame")
List.Size = UDim2.new(1, -20, 1, -150)
List.Position = UDim2.new(0, 10, 0, 110)
List.BackgroundTransparency = 1
List.Parent = Main

local Canvas = Instance.new("ScrollingFrame")
Canvas.Size = UDim2.new(1, 0, 1, 0)
Canvas.BackgroundTransparency = 1
Canvas.BorderSizePixel = 0
Canvas.ScrollBarThickness = 6
Canvas.ScrollBarImageColor3 = Color3.fromRGB(120, 80, 220)
Canvas.CanvasSize = UDim2.new(0, 0, 0, 0)
Canvas.AutomaticCanvasSize = Enum.AutomaticSize.Y
Canvas.Parent = List
registerRainbow(Canvas, "ScrollBarImageColor3")

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 6)
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = Canvas

local function makeToggle(name, callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -8, 0, 32)
    Btn.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
    Btn.BorderSizePixel = 0
    Btn.Text = name .. ": OFF"
    Btn.TextColor3 = Color3.fromRGB(200, 200, 220)
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 13
    Btn.Parent = Canvas
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 7)

    local state = false
    Btn.MouseButton1Click:Connect(function()
        state = not state
        Btn.Text = name .. (state and ": ON" or ": OFF")
        if state then
            Btn.BackgroundColor3 = Color3.fromRGB(45, 110, 70)
            -- Daftarkan rainbow pas ON
            registerRainbow(Btn, "BackgroundColor3")
        else
            Btn.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
            -- Hapus dari rainbow
            for i, item in ipairs(rainbowObjects) do
                if item.obj == Btn then
                    table.remove(rainbowObjects, i)
                    break
                end
            end
        end
        if callback then pcall(callback, state) end
    end)
    return Btn
end

local function makeSlider(labelText, minV, maxV, defaultV, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -8, 0, 46)
    Frame.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
    Frame.BorderSizePixel = 0
    Frame.Parent = Canvas
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 7)

    local Lbl = Instance.new("TextLabel")
    Lbl.Size = UDim2.new(1, -12, 0, 18)
    Lbl.Position = UDim2.new(0, 6, 0, 2)
    Lbl.BackgroundTransparency = 1
    Lbl.Text = labelText .. ": " .. defaultV
    Lbl.TextColor3 = Color3.fromRGB(200, 200, 220)
    Lbl.TextXAlignment = Enum.TextXAlignment.Left
    Lbl.Font = Enum.Font.Gotham
    Lbl.TextSize = 12
    Lbl.Parent = Frame

    local Bar = Instance.new("Frame")
    Bar.Size = UDim2.new(1, -16, 0, 8)
    Bar.Position = UDim2.new(0, 8, 0, 26)
    Bar.BackgroundColor3 = Color3.fromRGB(42, 42, 52)
    Bar.BorderSizePixel = 0
    Bar.Parent = Frame
    Instance.new("UICorner", Bar).CornerRadius = UDim.new(1, 0)

    local Fill = Instance.new("Frame")
    local rel0 = (defaultV - minV) / (maxV - minV)
    Fill.Size = UDim2.new(rel0, 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(120, 80, 220)
    Fill.BorderSizePixel = 0
    Fill.Parent = Bar
    Instance.new("UICorner", Fill).CornerRadius = UDim.new(1, 0)
    registerRainbow(Fill, "BackgroundColor3")

    local dragging = false
    local function upd(x)
        local rel = math.clamp((x - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
        local v = minV + (maxV - minV) * rel
        Lbl.Text = labelText .. ": " .. math.floor(v)
        Fill.Size = UDim2.new(rel, 0, 1, 0)
        if callback then pcall(callback, v) end
    end
    Bar.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging = true; upd(i.Position.X)
        end
    end)
    UserInputService.InputChanged:Connect(function(i)
        if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            upd(i.Position.X)
        end
    end)
    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

makeSlider("FOV", 30, 600, Config.FOV, function(v) Config.FOV = v end)
makeSlider("Smoothness", 1, 100, Config.Smoothness * 100, function(v) Config.Smoothness = v / 100 end)

-- Target selector
local PartFrame = Instance.new("Frame")
PartFrame.Size = UDim2.new(1, -8, 0, 60)
PartFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
PartFrame.BorderSizePixel = 0
PartFrame.Parent = Canvas
Instance.new("UICorner", PartFrame).CornerRadius = UDim.new(0, 7)

local PartLbl = Instance.new("TextLabel")
PartLbl.Size = UDim2.new(1, -12, 0, 18)
PartLbl.Position = UDim2.new(0, 6, 0, 2)
PartLbl.BackgroundTransparency = 1
PartLbl.Text = "Target: Head"
PartLbl.TextColor3 = Color3.fromRGB(200, 200, 220)
PartLbl.TextXAlignment = Enum.TextXAlignment.Left
PartLbl.Font = Enum.Font.Gotham
PartLbl.TextSize = 12
PartLbl.Parent = PartFrame

local partOptions = {"Head", "UpperTorso", "LowerTorso", "HumanoidRootPart"}
for i, text in ipairs(partOptions) do
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.25, -6, 0, 26)
    b.Position = UDim2.new((i-1) * 0.25, 4, 0, 26)
    b.BackgroundColor3 = Color3.fromRGB(38, 38, 48)
    b.Text = text
    b.TextColor3 = Color3.fromRGB(200, 200, 220)
    b.Font = Enum.Font.Gotham
    b.TextSize = 10
    b.Parent = PartFrame
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 5)
    b.MouseButton1Click:Connect(function()
        Config.TargetPart = text
        PartLbl.Text = "Target: " .. text
    end)
end

-- FOV Circle (rainbow juga)
local FovCircle = Drawing.new("Circle")
FovCircle.Thickness = 1.5
FovCircle.Color = Color3.fromRGB(120, 80, 220)
FovCircle.Filled = false
FovCircle.NumSides = 60
FovCircle.Transparency = 1
FovCircle.Visible = false

RunService.RenderStepped:Connect(function()
    if FovCircle.Visible then
        FovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
        FovCircle.Radius = Config.FOV / 2
        -- Rainbow FOV circle
        FovCircle.Color = Color3.fromHSV((tick() * 0.3) % 1, 0.9, 1)
    end
end)

makeToggle("FOV Circle", function(s) FovCircle.Visible = s end)

-- =========================================
-- WALL CHECK
-- =========================================
local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Exclude

local function isVisible(targetPart)
    if not Config.WallCheck then return true end
    if not targetPart then return false end
    local origin = Camera.CFrame.Position
    local direction = (targetPart.Position - origin)
    local result = workspace:Raycast(origin, direction, raycastParams)
    if result then
        local hit = result.Instance
        if hit and hit:IsDescendantOf(targetPart.Parent) then
            return true
        end
        return false
    end
    return true
end

-- =========================================
-- ESP BOX + NAME (rainbow juga)
-- =========================================
local espCache = {}
local espRainbow = true  -- ESP box warna rainbow

local function clearESP()
    for _, v in pairs(espCache) do
        if v.box then v.box:Remove() end
        if v.name then v.name:Remove() end
    end
    espCache = {}
end

local function updateESP()
    if not Config.ESP then return end
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
            local hum = plr.Character:FindFirstChildOfClass("Humanoid")
            if hrp and hum and hum.Health > 0 then
                if not espCache[plr] then
                    local box = Drawing.new("Square")
                    box.Thickness = 1.5
                    box.Color = Color3.fromRGB(255, 80, 80)
                    box.Filled = false
                    local nameTag = Drawing.new("Text")
                    nameTag.Size = 14
                    nameTag.Center = true
                    nameTag.Outline = true
                    nameTag.Color = Color3.fromRGB(255, 255, 255)
                    nameTag.OutlineColor = Color3.fromRGB(0, 0, 0)
                    espCache[plr] = {box=box, name=nameTag}
                end
                local data = espCache[plr]
                local topPos = hrp.Position + Vector3.new(0, 3, 0)
                local botPos = hrp.Position - Vector3.new(0, 3, 0)
                local top = Camera:WorldToViewportPoint(topPos)
                local bot = Camera:WorldToViewportPoint(botPos)
                local center = Camera:WorldToViewportPoint(hrp.Position)

                if center.Z > 0 then
                    local h = math.abs(top.Y - bot.Y)
                    local w = h / 2
                    data.box.Size = Vector2.new(w, h)
                    data.box.Position = Vector2.new(center.X - w/2, center.Y - h/2)
                    data.box.Visible = true
                    data.name.Text = plr.Name .. " [" .. math.floor(hum.Health) .. "]"
                    data.name.Position = Vector2.new(center.X, center.Y - h/2 - 16)
                    data.name.Visible = true

                    -- ESP box warna rainbow
                    if espRainbow then
                        data.box.Color = Color3.fromHSV((tick() * 0.2) % 1, 0.9, 1)
                    end
                else
                    data.box.Visible = false
                    data.name.Visible = false
                end
            elseif espCache[plr] then
                espCache[plr].box.Visible = false
                espCache[plr].name.Visible = false
            end
        end
    end
end

makeToggle("ESP Box + Name", function(s)
    Config.ESP = s
    if not s then clearESP() end
end)

makeToggle("Wall Check", function(s) Config.WallCheck = s end)

-- =========================================
-- TARGET HELPER
-- =========================================
local function getClosestTarget()
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    local closest, dist = nil, Config.FOV / 2
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local part = plr.Character:FindFirstChild(Config.TargetPart)
            local hum = plr.Character:FindFirstChildOfClass("Humanoid")
            if part and hum and hum.Health > 0 then
                if isVisible(part) then
                    local pos, on = Camera:WorldToViewportPoint(part.Position)
                    if on then
                        local d = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                        if d < dist then dist = d; closest = part end
                    end
                end
            end
        end
    end
    return closest
end

-- =========================================
-- AIMBOT
-- =========================================
makeToggle("Aimbot (Auto Lock)", function(s) Config.Aimbot = s end)

-- =========================================
-- DEBUG LABEL (rainbow)
-- =========================================
local DebugLabel = Instance.new("TextLabel")
DebugLabel.Size = UDim2.new(0, 300, 0, 26)
DebugLabel.Position = UDim2.new(0.5, -150, 1, -60)
DebugLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DebugLabel.BackgroundTransparency = 0.5
DebugLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
DebugLabel.Font = Enum.Font.Code
DebugLabel.TextSize = 13
DebugLabel.Text = "Ready"
DebugLabel.Parent = ScreenGui
Instance.new("UICorner", DebugLabel).CornerRadius = UDim.new(0, 6)
registerRainbow(DebugLabel, "TextColor3")

-- =========================================
-- MAIN LOOP
-- =========================================
RunService.RenderStepped:Connect(function()
    if LocalPlayer.Character then
        raycastParams.FilterDescendantsInstances = {LocalPlayer.Character, Camera}
    end

    pcall(updateESP)

    if Config.Aimbot then
        local t = getClosestTarget()
        if t then
            DebugLabel.Text = "LOCK -> " .. t.Parent.Name
            local cur = Camera.CFrame
            local new = CFrame.lookAt(cur.Position, t.Position)
            Camera.CFrame = cur:Lerp(new, Config.Smoothness)
        else
            DebugLabel.Text = "No visible target"
        end
    else
        DebugLabel.Text = "Aimbot OFF"
    end
end)
