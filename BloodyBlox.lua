repeat task.wait() until game:IsLoaded()

local GuiParent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

if GuiParent:FindFirstChild("BloodyNightUI") then
    GuiParent.BloodyNightUI:Destroy()
    task.wait(0.5)
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

print("═══════════════════════════════════════")
print("  BloodyNight Beta 0.5.1")
print("═══════════════════════════════════════")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "BloodyNightUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = GuiParent

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 850, 0, 550)
Main.Position = UDim2.new(0.5, -425, 0, 20)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
Main.BackgroundTransparency = 0.30
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = ScreenGui

local Background = Instance.new("Frame")
Background.BackgroundColor3 = Color3.fromRGB(20, 0, 0)
Background.BorderSizePixel = 0
Background.Size = UDim2.new(1, 0, 1, 0)
Background.ZIndex = 0
Background.Parent = Main

local BackgroundGradient = Instance.new("UIGradient")
BackgroundGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 12)),
})
BackgroundGradient.Rotation = 45
BackgroundGradient.Parent = Background

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 6)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(139, 0, 0)
MainStroke.Thickness = 2
MainStroke.Parent = Main

local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Size = UDim2.new(1, 40, 1, 40)
Shadow.Position = UDim2.new(0, -20, 0, -20)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://5028857472"
Shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
Shadow.ImageTransparency = 0.5
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(24, 24, 276, 276)
Shadow.ZIndex = 0
Shadow.Parent = Main

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
TopBar.BackgroundTransparency = 0.30
TopBar.BorderSizePixel = 0
TopBar.ZIndex = 1
TopBar.Parent = Main

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 6)
TopBarCorner.Parent = TopBar

local TopBarFix = Instance.new("Frame")
TopBarFix.Size = UDim2.new(1, 0, 0, 6)
TopBarFix.Position = UDim2.new(0, 0, 1, -6)
TopBarFix.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
TopBarFix.BackgroundTransparency = 0.30
TopBarFix.BorderSizePixel = 0
TopBarFix.ZIndex = 1
TopBarFix.Parent = TopBar

local TopBarLine = Instance.new("Frame")
TopBarLine.Size = UDim2.new(1, 0, 0, 1)
TopBarLine.Position = UDim2.new(0, 0, 1, 0)
TopBarLine.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
TopBarLine.BorderSizePixel = 0
TopBarLine.ZIndex = 2
TopBarLine.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 400, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "BLOODYNIGHT"
Title.TextColor3 = Color3.fromRGB(139, 0, 0)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 2
Title.Parent = TopBar

local Version = Instance.new("TextLabel")
Version.Size = UDim2.new(0, 100, 1, 0)
Version.Position = UDim2.new(0, 145, 0, 0)
Version.BackgroundTransparency = 1
Version.Text = "BETA 0.3.0"
Version.TextColor3 = Color3.fromRGB(80, 80, 85)
Version.TextSize = 11
Version.Font = Enum.Font.GothamBold
Version.TextXAlignment = Enum.TextXAlignment.Left
Version.ZIndex = 2
Version.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -40, 0.5, -15)
CloseBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
CloseBtn.BorderSizePixel = 0
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.TextSize = 16
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.ZIndex = 2
CloseBtn.Parent = TopBar

local CloseBtnCorner = Instance.new("UICorner")
CloseBtnCorner.CornerRadius = UDim.new(0, 4)
CloseBtnCorner.Parent = CloseBtn

CloseBtn.MouseEnter:Connect(function()
    TweenService:Create(CloseBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(200, 0, 0)}):Play()
end)

CloseBtn.MouseLeave:Connect(function()
    TweenService:Create(CloseBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(20, 20, 25)}):Play()
end)

local SidebarScroll = Instance.new("ScrollingFrame")
SidebarScroll.Size = UDim2.new(0, 180, 1, -55)
SidebarScroll.Position = UDim2.new(0, 10, 0, 50)
SidebarScroll.BackgroundTransparency = 1
SidebarScroll.BorderSizePixel = 0
SidebarScroll.ScrollBarThickness = 4
SidebarScroll.ScrollBarImageColor3 = Color3.fromRGB(139, 0, 0)
SidebarScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
SidebarScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
SidebarScroll.ZIndex = 1
SidebarScroll.Parent = Main

local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(1, 0, 1, 0)
Sidebar.BackgroundTransparency = 1
Sidebar.ZIndex = 1
Sidebar.Parent = SidebarScroll

local TabList = Instance.new("UIListLayout")
TabList.SortOrder = Enum.SortOrder.LayoutOrder
TabList.Padding = UDim.new(0, 6)
TabList.Parent = Sidebar

local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -210, 1, -65)
ContentArea.Position = UDim2.new(0, 200, 0, 55)
ContentArea.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
ContentArea.BorderSizePixel = 0
ContentArea.ZIndex = 1
ContentArea.Parent = Main

local ContentCorner = Instance.new("UICorner")
ContentCorner.CornerRadius = UDim.new(0, 4)
ContentCorner.Parent = ContentArea

local ContentStroke = Instance.new("UIStroke")
ContentStroke.Color = Color3.fromRGB(25, 25, 30)
ContentStroke.Thickness = 1
ContentStroke.Parent = ContentArea

local Tabs = {}
local ActiveTab = nil

local function CreateTab(name)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Size = UDim2.new(1, 0, 0, 38)
    TabBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
    TabBtn.BorderSizePixel = 0
    TabBtn.Text = ""
    TabBtn.AutoButtonColor = false
    TabBtn.ZIndex = 2
    TabBtn.Parent = Sidebar

    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 4)
    TabCorner.Parent = TabBtn

    local TabLabel = Instance.new("TextLabel")
    TabLabel.Size = UDim2.new(1, -20, 1, 0)
    TabLabel.Position = UDim2.new(0, 15, 0, 0)
    TabLabel.BackgroundTransparency = 1
    TabLabel.Text = name
    TabLabel.TextColor3 = Color3.fromRGB(140, 140, 150)
    TabLabel.TextSize = 13
    TabLabel.Font = Enum.Font.GothamBold
    TabLabel.TextXAlignment = Enum.TextXAlignment.Left
    TabLabel.ZIndex = 3
    TabLabel.Parent = TabBtn

    local Indicator = Instance.new("Frame")
    Indicator.Size = UDim2.new(0, 3, 1, -8)
    Indicator.Position = UDim2.new(0, 0, 0, 4)
    Indicator.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
    Indicator.BorderSizePixel = 0
    Indicator.Visible = false
    Indicator.ZIndex = 3
    Indicator.Parent = TabBtn

    local IndicatorCorner = Instance.new("UICorner")
    IndicatorCorner.CornerRadius = UDim.new(1, 0)
    IndicatorCorner.Parent = Indicator

    local Content = Instance.new("ScrollingFrame")
    Content.Size = UDim2.new(1, -20, 1, -20)
    Content.Position = UDim2.new(0, 10, 0, 10)
    Content.BackgroundTransparency = 1
    Content.BorderSizePixel = 0
    Content.ScrollBarThickness = 4
    Content.ScrollBarImageColor3 = Color3.fromRGB(139, 0, 0)
    Content.CanvasSize = UDim2.new(0, 0, 0, 0)
    Content.Visible = false
    Content.ZIndex = 2
    Content.Parent = ContentArea

    local Layout = Instance.new("UIListLayout")
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.Padding = UDim.new(0, 8)
    Layout.Parent = Content

    Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Content.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 10)
    end)

    TabBtn.MouseEnter:Connect(function()
        if ActiveTab and ActiveTab.Button ~= TabBtn then
            TweenService:Create(TabBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(22, 22, 28)}):Play()
        end
    end)

    TabBtn.MouseLeave:Connect(function()
        if ActiveTab and ActiveTab.Button ~= TabBtn then
            TweenService:Create(TabBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(18, 18, 22)}):Play()
        end
    end)

    TabBtn.MouseButton1Click:Connect(function()
        for _, tab in pairs(Tabs) do
            TweenService:Create(tab.Button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(18, 18, 22)}):Play()
            tab.Label.TextColor3 = Color3.fromRGB(140, 140, 150)
            tab.Indicator.Visible = false
            tab.Content.Visible = false
        end

        TweenService:Create(TabBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(139, 0, 0)}):Play()
        TabLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        Indicator.Visible = true
        Content.Visible = true
        ActiveTab = {Button = TabBtn, Content = Content, Label = TabLabel, Indicator = Indicator}
    end)

    local tab = {Button = TabBtn, Content = Content, Label = TabLabel, Indicator = Indicator}
    table.insert(Tabs, tab)

    if #Tabs == 1 then
        TabBtn.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
        TabLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        Indicator.Visible = true
        Content.Visible = true
        ActiveTab = tab
    end

    return Content
end

local function AddToggle(parent, text, default, callback)
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, 0, 0, 42)
    Container.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    Container.BorderSizePixel = 0
    Container.ZIndex = 2
    Container.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 4)
    Corner.Parent = Container

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -70, 1, 0)
    Label.Position = UDim2.new(0, 12, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(220, 220, 230)
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamSemibold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.ZIndex = 3
    Label.Parent = Container

    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Size = UDim2.new(0, 44, 0, 22)
    ToggleFrame.Position = UDim2.new(1, -54, 0.5, -11)
    ToggleFrame.BackgroundColor3 = default and Color3.fromRGB(139, 0, 0) or Color3.fromRGB(35, 35, 40)
    ToggleFrame.BorderSizePixel = 0
    ToggleFrame.ZIndex = 3
    ToggleFrame.Parent = Container

    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(1, 0)
    ToggleCorner.Parent = ToggleFrame

    local Circle = Instance.new("Frame")
    Circle.Size = UDim2.new(0, 16, 0, 16)
    Circle.Position = default and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
    Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Circle.BorderSizePixel = 0
    Circle.ZIndex = 4
    Circle.Parent = ToggleFrame

    local CircleCorner = Instance.new("UICorner")
    CircleCorner.CornerRadius = UDim.new(1, 0)
    CircleCorner.Parent = Circle

    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 1, 0)
    Button.BackgroundTransparency = 1
    Button.Text = ""
    Button.ZIndex = 5
    Button.Parent = ToggleFrame

    local enabled = default

    Button.MouseButton1Click:Connect(function()
        enabled = not enabled

        TweenService:Create(ToggleFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            BackgroundColor3 = enabled and Color3.fromRGB(139, 0, 0) or Color3.fromRGB(35, 35, 40)
        }):Play()

        TweenService:Create(Circle, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
            Position = enabled and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
        }):Play()

        callback(enabled)
    end)
end

local function AddButton(parent, text, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 38)
    Button.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
    Button.BorderSizePixel = 0
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 13
    Button.Font = Enum.Font.GothamBold
    Button.AutoButtonColor = false
    Button.ZIndex = 2
    Button.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 4)
    Corner.Parent = Button

    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(160, 0, 0)}):Play()
    end)

    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(139, 0, 0)}):Play()
    end)

    Button.MouseButton1Click:Connect(function()
        Button.BackgroundColor3 = Color3.fromRGB(110, 0, 0)
        task.wait(0.08)
        Button.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
        callback()
    end)
end

local function AddSlider(parent, text, min, max, default, callback)
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, 0, 0, 60)
    Container.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    Container.BorderSizePixel = 0
    Container.ZIndex = 2
    Container.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 4)
    Corner.Parent = Container

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.65, 0, 0, 20)
    Label.Position = UDim2.new(0, 12, 0, 8)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(220, 220, 230)
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamSemibold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.ZIndex = 3
    Label.Parent = Container

    local Value = Instance.new("TextLabel")
    Value.Size = UDim2.new(0.35, -12, 0, 20)
    Value.Position = UDim2.new(0.65, 0, 0, 8)
    Value.BackgroundTransparency = 1
    Value.Text = tostring(default)
    Value.TextColor3 = Color3.fromRGB(139, 0, 0)
    Value.TextSize = 13
    Value.Font = Enum.Font.GothamBold
    Value.TextXAlignment = Enum.TextXAlignment.Right
    Value.ZIndex = 3
    Value.Parent = Container

    local SliderBack = Instance.new("Frame")
    SliderBack.Size = UDim2.new(1, -24, 0, 6)
    SliderBack.Position = UDim2.new(0, 12, 0, 38)
    SliderBack.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    SliderBack.BorderSizePixel = 0
    SliderBack.ZIndex = 3
    SliderBack.Parent = Container

    local SliderCorner = Instance.new("UICorner")
    SliderCorner.CornerRadius = UDim.new(1, 0)
    SliderCorner.Parent = SliderBack

    local SliderFill = Instance.new("Frame")
    SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    SliderFill.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
    SliderFill.BorderSizePixel = 0
    SliderFill.ZIndex = 4
    SliderFill.Parent = SliderBack

    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(1, 0)
    FillCorner.Parent = SliderFill

    local Circle = Instance.new("Frame")
    Circle.Size = UDim2.new(0, 14, 0, 14)
    Circle.Position = UDim2.new((default - min) / (max - min), -7, 0.5, -7)
    Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Circle.BorderSizePixel = 0
    Circle.ZIndex = 5
    Circle.Parent = SliderBack

    local CircleCorner = Instance.new("UICorner")
    CircleCorner.CornerRadius = UDim.new(1, 0)
    CircleCorner.Parent = Circle

    local CircleStroke = Instance.new("UIStroke")
    CircleStroke.Color = Color3.fromRGB(139, 0, 0)
    CircleStroke.Thickness = 2
    CircleStroke.Parent = Circle

    local dragging = false
    local currentValue = default

    local function update(input)
        local pos = math.clamp((input.Position.X - SliderBack.AbsolutePosition.X) / SliderBack.AbsoluteSize.X, 0, 1)
        currentValue = math.floor(min + (max - min) * pos)

        TweenService:Create(SliderFill, TweenInfo.new(0.08), {Size = UDim2.new(pos, 0, 1, 0)}):Play()
        TweenService:Create(Circle, TweenInfo.new(0.08), {Position = UDim2.new(pos, -7, 0.5, -7)}):Play()

        Value.Text = tostring(currentValue)
        callback(currentValue)
    end

    SliderBack.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            update(input)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            update(input)
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

local function AddDropdown(parent, text, options, callback)
    local Container = Instance.new("Frame")
    Container.Size = UDim2.new(1, 0, 0, 42)
    Container.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    Container.BorderSizePixel = 0
    Container.ZIndex = 2
    Container.Parent = parent

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 4)
    Corner.Parent = Container

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.35, 0, 1, 0)
    Label.Position = UDim2.new(0, 12, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.TextColor3 = Color3.fromRGB(220, 220, 230)
    Label.TextSize = 12
    Label.Font = Enum.Font.GothamSemibold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.ZIndex = 3
    Label.Parent = Container

    local Dropdown = Instance.new("TextButton")
    Dropdown.Size = UDim2.new(0.62, -16, 0, 28)
    Dropdown.Position = UDim2.new(0.38, 0, 0.5, -14)
    Dropdown.BackgroundColor3 = Color3.fromRGB(28, 28, 33)
    Dropdown.BorderSizePixel = 0
    Dropdown.Text = "  Select..."
    Dropdown.TextColor3 = Color3.fromRGB(180, 180, 190)
    Dropdown.TextSize = 11
    Dropdown.Font = Enum.Font.Gotham
    Dropdown.TextXAlignment = Enum.TextXAlignment.Left
    Dropdown.AutoButtonColor = false
    Dropdown.ZIndex = 3
    Dropdown.Parent = Container

    local DropCorner = Instance.new("UICorner")
    DropCorner.CornerRadius = UDim.new(0, 3)
    DropCorner.Parent = Dropdown

    local Arrow = Instance.new("TextLabel")
    Arrow.Size = UDim2.new(0, 20, 1, 0)
    Arrow.Position = UDim2.new(1, -22, 0, 0)
    Arrow.BackgroundTransparency = 1
    Arrow.Text = "▼"
    Arrow.TextColor3 = Color3.fromRGB(139, 0, 0)
    Arrow.TextSize = 9
    Arrow.Font = Enum.Font.GothamBold
    Arrow.ZIndex = 4
    Arrow.Parent = Dropdown

    local List = Instance.new("Frame")
    List.Size = UDim2.new(0.62, -16, 0, math.min(#options * 28, 112))
    List.Position = UDim2.new(0.38, 0, 1, 4)
    List.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
    List.BorderSizePixel = 0
    List.Visible = false
    List.ZIndex = 10
    List.Parent = Container

    local ListCorner = Instance.new("UICorner")
    ListCorner.CornerRadius = UDim.new(0, 3)
    ListCorner.Parent = List

    local ListStroke = Instance.new("UIStroke")
    ListStroke.Color = Color3.fromRGB(139, 0, 0)
    ListStroke.Thickness = 1
    ListStroke.Parent = List

    local Scroll = Instance.new("ScrollingFrame")
    Scroll.Size = UDim2.new(1, -4, 1, -4)
    Scroll.Position = UDim2.new(0, 2, 0, 2)
    Scroll.BackgroundTransparency = 1
    Scroll.BorderSizePixel = 0
    Scroll.ScrollBarThickness = 3
    Scroll.ScrollBarImageColor3 = Color3.fromRGB(139, 0, 0)
    Scroll.CanvasSize = UDim2.new(0, 0, 0, #options * 28)
    Scroll.ZIndex = 11
    Scroll.Parent = List

    for i, option in ipairs(options) do
        local Opt = Instance.new("TextButton")
        Opt.Size = UDim2.new(1, 0, 0, 28)
        Opt.Position = UDim2.new(0, 0, 0, (i - 1) * 28)
        Opt.BackgroundColor3 = Color3.fromRGB(28, 28, 33)
        Opt.BorderSizePixel = 0
        Opt.Text = "  " .. option
        Opt.TextColor3 = Color3.fromRGB(180, 180, 190)
        Opt.TextSize = 11
        Opt.Font = Enum.Font.Gotham
        Opt.TextXAlignment = Enum.TextXAlignment.Left
        Opt.AutoButtonColor = false
        Opt.ZIndex = 12
        Opt.Parent = Scroll

        Opt.MouseEnter:Connect(function()
            TweenService:Create(Opt, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(139, 0, 0)}):Play()
        end)

        Opt.MouseLeave:Connect(function()
            TweenService:Create(Opt, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(28, 28, 33)}):Play()
        end)

        Opt.MouseButton1Click:Connect(function()
            Dropdown.Text = "  " .. option
            List.Visible = false
            TweenService:Create(Arrow, TweenInfo.new(0.15), {Rotation = 0}):Play()
            callback(option)
        end)
    end

    Dropdown.MouseButton1Click:Connect(function()
        List.Visible = not List.Visible
        TweenService:Create(Arrow, TweenInfo.new(0.15), {Rotation = List.Visible and 180 or 0}):Play()
    end)

    return {
        SetOptions = function(newOptions)
            Scroll:ClearAllChildren()
            for i, option in ipairs(newOptions) do
                local Opt = Instance.new("TextButton")
                Opt.Size = UDim2.new(1, 0, 0, 28)
                Opt.Position = UDim2.new(0, 0, 0, (i - 1) * 28)
                Opt.BackgroundColor3 = Color3.fromRGB(28, 28, 33)
                Opt.BorderSizePixel = 0
                Opt.Text = "  " .. option
                Opt.TextColor3 = Color3.fromRGB(180, 180, 190)
                Opt.TextSize = 11
                Opt.Font = Enum.Font.Gotham
                Opt.TextXAlignment = Enum.TextXAlignment.Left
                Opt.AutoButtonColor = false
                Opt.ZIndex = 12
                Opt.Parent = Scroll

                Opt.MouseEnter:Connect(function()
                    TweenService:Create(Opt, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(139, 0, 0)}):Play()
                end)

                Opt.MouseLeave:Connect(function()
                    TweenService:Create(Opt, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(28, 28, 33)}):Play()
                end)

                Opt.MouseButton1Click:Connect(function()
                    Dropdown.Text = "  " .. option
                    List.Visible = false
                    TweenService:Create(Arrow, TweenInfo.new(0.15), {Rotation = 0}):Play()
                    callback(option)
                end)
            end
            Scroll.CanvasSize = UDim2.new(0, 0, 0, #newOptions * 28)
            List.Size = UDim2.new(0.62, -16, 0, math.min(#newOptions * 28, 112))
        end
    }
end

local FarmTab = CreateTab("FARM")
local RebirthTab = CreateTab("REBIRTH")
local CombatTab = CreateTab("COMBAT")
local TeleportTab = CreateTab("TELEPORT")
local PlayerTab = CreateTab("PLAYER")
local MiscTab = CreateTab("MISC")
local SettingTab = CreateTab("SETTING")

local LogHistory = {}
local LogEntryFrames = {}
local MaxLogs = 100

local function AddLog(message)
    if not message or message == "" then return end

    local timestamp = os.date("%H:%M:%S")
    local logEntry = string.format("[%s] %s", timestamp, tostring(message))
    table.insert(LogHistory, logEntry)

    if LogEntryList then
        local entryBtn = Instance.new("TextButton")
        entryBtn.Size = UDim2.new(1, 0, 0, 20)
        entryBtn.AutomaticSize = Enum.AutomaticSize.Y
        entryBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
        entryBtn.BackgroundTransparency = 0.3
        entryBtn.BorderSizePixel = 0
        entryBtn.Text = "  " .. logEntry
        entryBtn.TextColor3 = Color3.fromRGB(200, 200, 210)
        entryBtn.TextSize = 11
        entryBtn.Font = Enum.Font.Code
        entryBtn.TextXAlignment = Enum.TextXAlignment.Left
        entryBtn.TextYAlignment = Enum.TextYAlignment.Top
        entryBtn.TextWrapped = true
        entryBtn.AutoButtonColor = false
        entryBtn.ZIndex = 3
        entryBtn.LayoutOrder = #LogEntryFrames
        entryBtn.Parent = LogEntryList

        local entryPadding = Instance.new("UIPadding")
        entryPadding.PaddingTop = UDim.new(0, 3)
        entryPadding.PaddingBottom = UDim.new(0, 3)
        entryPadding.PaddingLeft = UDim.new(0, 4)
        entryPadding.PaddingRight = UDim.new(0, 4)
        entryPadding.Parent = entryBtn

        entryBtn.MouseButton1Click:Connect(function()
            if setclipboard then
                pcall(setclipboard, logEntry)
                local orig = entryBtn.BackgroundColor3
                entryBtn.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
                task.delay(0.2, function()
                    if entryBtn and entryBtn.Parent then
                        entryBtn.BackgroundColor3 = orig
                    end
                end)
            end
        end)

        table.insert(LogEntryFrames, entryBtn)

        if #LogEntryFrames > MaxLogs then
            local oldest = table.remove(LogEntryFrames, 1)
            table.remove(LogHistory, 1)
            if oldest then oldest:Destroy() end
        end

        if LogScrollFrame then
            task.defer(function()
                if LogEntryList then
                    LogScrollFrame.CanvasSize = UDim2.new(0, 0, 0, LogEntryList.AbsoluteContentSize.Y + 10)
                end
            end)
        end
    end
end

local OriginalPrint = print
print = function(...)
    local args = {...}
    local parts = {}
    for _, v in ipairs(args) do
        if v ~= nil and tostring(v) ~= "" then
            table.insert(parts, tostring(v))
        end
    end
    if #parts > 0 then
        local message = table.concat(parts, " ")
        OriginalPrint(message)
        AddLog(message)
    end
end

local Config = {
    MenuSize = 1.0,
    Farm = {AutoFarm = false, AutoPushups = false},
    Rebirth = {AutoRebirth = false, NoRemoveTP = false, FastRebirth = false},
    Combat = {AntiAim = false, AutoKill = false, AutoKillWhiteList = {}, AutoBadAura = false, AutoGoodAura = false},
    Player = {Fly = false, NoClip = false, Speed = 16, AntiAFK = true},
    Misc = {NoWeightSound = false},
    Teleport = {Locations = {}},
    UI = {ShowWatermark = true, WatermarkMove = false}
}

local function GetMenuSize()
    local baseWidth = 850
    local baseHeight = 550
    return baseWidth * Config.MenuSize, baseHeight * Config.MenuSize
end

local function UpdateMenuSize()
    local width, height = GetMenuSize()
    if Main.Visible then
        TweenService:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
            Size = UDim2.new(0, width, 0, height),
            Position = UDim2.new(0.5, -width/2, 0, 20)
        }):Play()
    else
        Main.Size = UDim2.new(0, width, 0, height)
        Main.Position = UDim2.new(0.5, -width/2, 0, 20)
    end
end

local Connections = {}

AddToggle(FarmTab, "Auto Farm", false, function(v)
    Config.Farm.AutoFarm = v
    if v then
        Connections.AutoFarm = RunService.Heartbeat:Connect(function()
            pcall(function()
                if not Config.Farm.AutoFarm then return end

                local char = LocalPlayer.Character
                if not char then return end
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if not humanoid then return end

                local weightTool = char:FindFirstChild("Weight")
                if not weightTool then
                    local backpackWeight = LocalPlayer.Backpack:FindFirstChild("Weight")
                    if backpackWeight then
                        humanoid:EquipTool(backpackWeight)
                    end
                    return
                end

                if weightTool and weightTool:IsA("Tool") then
                    weightTool:Activate()
                end
            end)
        end)
    else
        if Connections.AutoFarm then
            Connections.AutoFarm:Disconnect()
            Connections.AutoFarm = nil
        end
    end
end)

AddToggle(FarmTab, "Auto Pushups", false, function(v)
    Config.Farm.AutoPushups = v
    if v then
        Connections.AutoPushups = RunService.Heartbeat:Connect(function()
            pcall(function()
                if not Config.Farm.AutoPushups then return end

                local char = LocalPlayer.Character
                if not char then return end
                local humanoid = char:FindFirstChildOfClass("Humanoid")
                if not humanoid then return end

                local pushupTool
                for _, item in ipairs(char:GetChildren()) do
                    if item:IsA("Tool") and item.Name:lower():find("pushup") then
                        pushupTool = item
                        break
                    end
                end

                if not pushupTool then
                    for _, item in ipairs(LocalPlayer.Backpack:GetChildren()) do
                        if item:IsA("Tool") and item.Name:lower():find("pushup") then
                            humanoid:EquipTool(item)
                            return
                        end
                    end
                    return
                end

                pushupTool:Activate()
            end)
        end)
    else
        if Connections.AutoPushups then
            Connections.AutoPushups:Disconnect()
            Connections.AutoPushups = nil
        end
    end
end)

local weightTimerNames = {"attackTime", "workoutTime", "AttackTime", "WorkoutTime", "repTime", "RepTime"}
local weightTimerKeywords = {"time", "cooldown", "delay", "rep", "rate", "speed"}

local function zeroWeightToolTimers(tool)
    if not tool then return end
    for _, memberName in ipairs(weightTimerNames) do
        local child = tool:FindFirstChild(memberName)
        if child and child:IsA("NumberValue") and child.Value ~= 0 then
            pcall(function() child.Value = 0 end)
        end
    end

    for _, child in ipairs(tool:GetChildren()) do
        if child:IsA("NumberValue") and child.Value ~= 0 then
            local lname = child.Name:lower()
            for _, keyword in ipairs(weightTimerKeywords) do
                if lname:find(keyword, 1, true) then
                    pcall(function() child.Value = 0 end)
                    break
                end
            end
        end
    end
end

local function getWeightTool(char)
    local weightTool = char:FindFirstChild("Weight")
    if weightTool then return weightTool end
    return LocalPlayer.Backpack:FindFirstChild("Weight")
end

AddToggle(FarmTab, "Fast Weight", false, function(v)
    Config.Farm.FastWeight = v
    if v then
        print("[FastWeight] Enabled - spamming Activate() as fast as possible. Real gain rate may be server-gated (repTime=0 confirmed to only affect animation, not rate) - use 'Spy Remote Calls' in Analyzer to find the real gain remote if this doesn't help.")
        Connections.FastWeight = task.spawn(function()
            while Config.Farm.FastWeight do
                pcall(function()
                    local char = LocalPlayer.Character
                    if not char then return end

                    local humanoid = char:FindFirstChildOfClass("Humanoid")
                    if not humanoid then return end

                    local weightTool = getWeightTool(char)
                    if not weightTool then return end

                    if weightTool.Parent ~= char then
                        humanoid:EquipTool(weightTool)
                        task.wait(0.1)
                    end

                    zeroWeightToolTimers(weightTool)
                    weightTool:Activate()
                end)
                task.wait()
            end
        end)
    else
        if Connections.FastWeight then
            task.cancel(Connections.FastWeight)
            Connections.FastWeight = nil
        end
        print("[FastWeight] Disabled")
    end
end)

local nonRebirthPriorities = {
    [Enum.AnimationPriority.Core] = true,
    [Enum.AnimationPriority.Idle] = true,
    [Enum.AnimationPriority.Movement] = true,
}

local function killAnimationTracks(char, duration)
    local endTime = tick() + duration
    task.spawn(function()
        while tick() < endTime do
            pcall(function()
                local humanoid = char and char:FindFirstChildOfClass("Humanoid")
                local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
                if animator then
                    for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                        if not nonRebirthPriorities[track.Priority] then
                            track:Stop(0)
                        end
                    end
                end
            end)
            task.wait(0.03)
        end
    end)

    pcall(function()
        local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
        if not playerGui then return end
        for _, gui in pairs(playerGui:GetDescendants()) do
            local lname = gui.Name:lower()
            if (lname:find("rebirth") or lname:find("cutscene")) and (gui:IsA("Frame") or gui:IsA("ScreenGui") or gui:IsA("ImageLabel")) then
                pcall(function() gui.Visible = false end)
            end
        end
    end)
end

local savedRespawnCFrame = nil

local function restoreAfterRespawn(savedCFrame)
    local conn
    conn = LocalPlayer.CharacterAdded:Connect(function(newChar)
        if conn then conn:Disconnect() end
        local newHrp = newChar:WaitForChild("HumanoidRootPart", 5)
        if newHrp then
            newHrp.CFrame = savedCFrame
        end
        if Config.Rebirth.FastRebirth then
            killAnimationTracks(newChar, 1.5)
        end
    end)
    task.delay(5, function()
        if conn then conn:Disconnect() end
    end)
end

AddToggle(RebirthTab, "Auto Rebirth", false, function(v)
    Config.Rebirth.AutoRebirth = v
    if v then
        Connections.AutoRebirthTimer = task.spawn(function()
            while Config.Rebirth.AutoRebirth do
                task.spawn(function()
                    pcall(function()
                        local rEvents = ReplicatedStorage:FindFirstChild("rEvents")
                        if not rEvents then return end

                        local rebirthRemote = rEvents:FindFirstChild("rebirthRemote")
                        if not rebirthRemote then return end

                        local char = LocalPlayer.Character
                        local hrp = char and char:FindFirstChild("HumanoidRootPart")
                        local savedPos = hrp and hrp.CFrame

                        if Config.Rebirth.FastRebirth and char then
                            killAnimationTracks(char, 1.5)
                        end

                        local success = pcall(function()
                            rebirthRemote:InvokeServer("rebirthRequest")
                        end)

                        if success and Config.Rebirth.NoRemoveTP and savedPos then
                            restoreAfterRespawn(savedPos)
                        end
                    end)
                end)

                task.wait(0.5)
            end
        end)

        print("[AutoRebirth] Enabled - 0.5s interval (optimized)")
    else
        Config.Rebirth.AutoRebirth = false
        print("[AutoRebirth] Disabled")
    end
end)

AddToggle(RebirthTab, "No Remove TP", false, function(v)
    Config.Rebirth.NoRemoveTP = v
    if v then
        Connections.NoRemoveTPTracker = task.spawn(function()
            while Config.Rebirth.NoRemoveTP do
                pcall(function()
                    local char = LocalPlayer.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        savedRespawnCFrame = hrp.CFrame
                    end
                end)
                task.wait(0.5)
            end
        end)

        Connections.NoRemoveTPCharAdded = LocalPlayer.CharacterAdded:Connect(function(newChar)
            if not Config.Rebirth.NoRemoveTP then return end
            if not savedRespawnCFrame then return end
            local newHrp = newChar:WaitForChild("HumanoidRootPart", 5)
            if newHrp then
                newHrp.CFrame = savedRespawnCFrame
            end
        end)

        print("[NoRemoveTP] Enabled - tracking position independently")
    else
        if Connections.NoRemoveTPTracker then
            task.cancel(Connections.NoRemoveTPTracker)
            Connections.NoRemoveTPTracker = nil
        end
        if Connections.NoRemoveTPCharAdded then
            Connections.NoRemoveTPCharAdded:Disconnect()
            Connections.NoRemoveTPCharAdded = nil
        end
        print("[NoRemoveTP] Disabled")
    end
end)

AddToggle(RebirthTab, "Fast Rebirth", false, function(v)
    Config.Rebirth.FastRebirth = v
    if v then
        local char = LocalPlayer.Character
        if char then killAnimationTracks(char, 2) end
    end
end)

AddToggle(CombatTab, "Anti Aim", false, function(v)
    Config.Combat.AntiAim = v
    if v then
        Connections.AntiAim = RunService.Heartbeat:Connect(function()
            pcall(function()
                if not Config.Combat.AntiAim then return end
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(10), 0)
                end
            end)
        end)
    else
        if Connections.AntiAim then
            Connections.AntiAim:Disconnect()
            Connections.AntiAim = nil
        end
    end
end)

local function getAutoKillTargets()
    local targets = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health > 0 then
                local isWhitelisted = false
                for _, name in pairs(Config.Combat.AutoKillWhiteList) do
                    if player.Name == name then
                        isWhitelisted = true
                        break
                    end
                end
                if not isWhitelisted then
                    table.insert(targets, player)
                end
            end
        end
    end
    return targets
end

AddToggle(CombatTab, "Auto Kill", false, function(v)
    Config.Combat.AutoKill = v
    if v then
        Connections.AutoKill = task.spawn(function()
            while Config.Combat.AutoKill do
                pcall(function()
                    local targets = getAutoKillTargets()
                    if #targets == 0 then
                        task.wait(1)
                        return
                    end

                    for _, target in pairs(targets) do
                        if not Config.Combat.AutoKill then break end

                        local char = LocalPlayer.Character
                        local targetChar = target.Character

                        if char and targetChar and char:FindFirstChild("HumanoidRootPart") and targetChar:FindFirstChild("HumanoidRootPart") then
                            local targetHRP = targetChar.HumanoidRootPart
                            local targetHum = targetChar:FindFirstChild("Humanoid")

                            if targetHum and targetHum.Health > 0 then

                                local behindPos = targetHRP.CFrame * CFrame.new(0, 0, 3)
                                char.HumanoidRootPart.CFrame = behindPos
                                task.wait(0.15)

                                local muscleEvent = LocalPlayer:FindFirstChild("muscleEvent")
                                if muscleEvent then
                                    muscleEvent:FireServer("punch", "leftHand")
                                    task.wait(0.2)
                                    muscleEvent:FireServer("punch", "rightHand")
                                    task.wait(0.3)
                                end
                            end
                        end
                    end
                end)
                task.wait(0.5)
            end
        end)
        print("[AutoKill] Enabled")
    else
        if Connections.AutoKill then
            task.cancel(Connections.AutoKill)
            Connections.AutoKill = nil
        end
        print("[AutoKill] Disabled")
    end
end)

local badTitles = {
    "Жесткий", "Тёмный", "Зло", "Охотник", "Скрытность", "Разъяренный",
    "Разблокировано", "Новичок дробилка", "Крушитель спортзала", "Угроза",
    "Убийца смерти", "Разрушитель", "Кошмар", "Повелитель"
}

local goodTitles = {
    "Нейтральный", "Красивая", "Охранник", "Защитник", "Принудитель",
    "Хранитель", "Герой", "Мститель", "Чемпион", "Миротворец",
    "Защитник", "Авангард", "Спаситель", "Пример для подражания", "Ангел-защитник"
}

local loggedAuraTitles = {}
local loggedAuraDumps = {}

local function logAuraTitleOnce(player, titleValue)
    local key = player.Name .. ":" .. titleValue
    if loggedAuraTitles[key] then return end
    loggedAuraTitles[key] = true
    print("[AuraDebug] " .. player.Name .. " Title = \"" .. titleValue .. "\"")
end

local function dumpPlayerStructureOnce(player)
    if loggedAuraDumps[player.Name] then return end
    loggedAuraDumps[player.Name] = true
    pcall(function()
        print("[AuraDebug] No Title found for " .. player.Name .. " - dumping structure:")
        for _, child in ipairs(player:GetChildren()) do
            print("  [Player] " .. child.Name .. " (" .. child.ClassName .. ")")
        end
        for attrName, attrValue in pairs(player:GetAttributes()) do
            print("  [PlayerAttr] " .. attrName .. " = " .. tostring(attrValue))
        end
        local char = player.Character
        if char then
            local head = char:FindFirstChild("Head")
            if head then
                for _, child in ipairs(head:GetChildren()) do
                    print("  [Head] " .. child.Name .. " (" .. child.ClassName .. ")")
                end
            end
        end
    end)
end

local function scanForAuraKeyword(player)
    if loggedAuraDumps["kw:" .. player.Name] then return end
    loggedAuraDumps["kw:" .. player.Name] = true
    pcall(function()
        local found = false
        for _, descendant in ipairs(player:GetDescendants()) do
            local lname = descendant.Name:lower()
            if lname:find("aura", 1, true) or lname:find("buff", 1, true) then
                found = true
                local valueStr = ""
                pcall(function()
                    if descendant:IsA("ValueBase") then
                        valueStr = " = " .. tostring(descendant.Value)
                    end
                end)
                print("  [AuraKeyword] " .. player.Name .. " -> " .. descendant:GetFullName() .. " (" .. descendant.ClassName .. ")" .. valueStr)
            end
        end
        local char = player.Character
        if char then
            for _, descendant in ipairs(char:GetDescendants()) do
                local lname = descendant.Name:lower()
                if lname:find("aura", 1, true) or lname:find("buff", 1, true) then
                    found = true
                    print("  [AuraKeyword] " .. player.Name .. " (char) -> " .. descendant:GetFullName() .. " (" .. descendant.ClassName .. ")")
                end
            end
        end
        if not found then
            print("  [AuraKeyword] " .. player.Name .. " -> no 'aura'/'buff' named instance found in Player or Character")
        end
    end)
end

local function findTitleValue(player)
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats then
        local title = leaderstats:FindFirstChild("Title")
        if title and (title:IsA("StringValue") or title:IsA("ObjectValue")) then
            return tostring(title.Value)
        end
    end

    local attrTitle = player:GetAttribute("Title")
    if attrTitle ~= nil then
        return tostring(attrTitle)
    end

    for _, container in ipairs({leaderstats, player}) do
        if container then
            for _, descendant in ipairs(container:GetDescendants()) do
                if descendant:IsA("StringValue") and descendant.Name:lower():find("title", 1, true) then
                    return tostring(descendant.Value)
                end
            end
        end
    end

    local char = player.Character
    if char then
        local head = char:FindFirstChild("Head")
        if head then
            for _, gui in ipairs(head:GetChildren()) do
                if gui:IsA("BillboardGui") then
                    local label = gui:FindFirstChild("Title") or gui:FindFirstChildWhichIsA("TextLabel", true)
                    if label and label:IsA("TextLabel") and label.Text ~= "" then
                        return label.Text
                    end
                end
            end
        end
    end

    return nil
end

local function hasBadAura(player)
    scanForAuraKeyword(player)
    local titleValue = findTitleValue(player)
    if not titleValue then
        dumpPlayerStructureOnce(player)
        return false
    end

    logAuraTitleOnce(player, titleValue)
    local lowerTitle = titleValue:lower()
    for _, badTitle in pairs(badTitles) do
        if lowerTitle:find(badTitle:lower(), 1, true) then
            return true
        end
    end
    return false
end

local function hasGoodAura(player)
    scanForAuraKeyword(player)
    local titleValue = findTitleValue(player)
    if not titleValue then
        dumpPlayerStructureOnce(player)
        return false
    end

    logAuraTitleOnce(player, titleValue)
    local lowerTitle = titleValue:lower()
    for _, goodTitle in pairs(goodTitles) do
        if lowerTitle:find(goodTitle:lower(), 1, true) then
            return true
        end
    end
    return false
end

AddToggle(CombatTab, "Auto Bad Aura", false, function(v)
    Config.Combat.AutoBadAura = v
    if v then
        Connections.AutoBadAura = task.spawn(function()
            while Config.Combat.AutoBadAura do
                pcall(function()
                    local targets = {}
                    for _, player in pairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            local humanoid = player.Character:FindFirstChild("Humanoid")
                            if humanoid and humanoid.Health > 0 and hasBadAura(player) then
                                table.insert(targets, player)
                            end
                        end
                    end

                    if #targets == 0 then
                        task.wait(1)
                        return
                    end

                    for _, target in pairs(targets) do
                        if not Config.Combat.AutoBadAura then break end

                        local char = LocalPlayer.Character
                        local targetChar = target.Character

                        if char and targetChar and char:FindFirstChild("HumanoidRootPart") and targetChar:FindFirstChild("HumanoidRootPart") then
                            local targetHRP = targetChar.HumanoidRootPart
                            local targetHum = targetChar:FindFirstChild("Humanoid")

                            if targetHum and targetHum.Health > 0 then

                                local behindPos = targetHRP.CFrame * CFrame.new(0, 0, 3)
                                char.HumanoidRootPart.CFrame = behindPos
                                task.wait(0.15)

                                local muscleEvent = LocalPlayer:FindFirstChild("muscleEvent")
                                if muscleEvent then
                                    muscleEvent:FireServer("punch", "leftHand")
                                    task.wait(0.2)
                                    muscleEvent:FireServer("punch", "rightHand")
                                    task.wait(0.3)
                                end
                            end
                        end
                    end
                end)
                task.wait(0.5)
            end
        end)
        print("[AutoBadAura] Enabled - farming bad aura players")
    else
        if Connections.AutoBadAura then
            task.cancel(Connections.AutoBadAura)
            Connections.AutoBadAura = nil
        end
        print("[AutoBadAura] Disabled")
    end
end)

AddToggle(CombatTab, "Auto Good Aura", false, function(v)
    Config.Combat.AutoGoodAura = v
    if v then
        Connections.AutoGoodAura = task.spawn(function()
            while Config.Combat.AutoGoodAura do
                pcall(function()
                    local targets = {}
                    for _, player in pairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            local humanoid = player.Character:FindFirstChild("Humanoid")
                            if humanoid and humanoid.Health > 0 and hasGoodAura(player) then
                                table.insert(targets, player)
                            end
                        end
                    end

                    if #targets == 0 then
                        task.wait(1)
                        return
                    end

                    for _, target in pairs(targets) do
                        if not Config.Combat.AutoGoodAura then break end

                        local char = LocalPlayer.Character
                        local targetChar = target.Character

                        if char and targetChar and char:FindFirstChild("HumanoidRootPart") and targetChar:FindFirstChild("HumanoidRootPart") then
                            local targetHRP = targetChar.HumanoidRootPart
                            local targetHum = targetChar:FindFirstChild("Humanoid")

                            if targetHum and targetHum.Health > 0 then

                                local behindPos = targetHRP.CFrame * CFrame.new(0, 0, 3)
                                char.HumanoidRootPart.CFrame = behindPos
                                task.wait(0.15)

                                local muscleEvent = LocalPlayer:FindFirstChild("muscleEvent")
                                if muscleEvent then
                                    muscleEvent:FireServer("punch", "leftHand")
                                    task.wait(0.2)
                                    muscleEvent:FireServer("punch", "rightHand")
                                    task.wait(0.3)
                                end
                            end
                        end
                    end
                end)
                task.wait(0.5)
            end
        end)
        print("[AutoGoodAura] Enabled - farming good aura players")
    else
        if Connections.AutoGoodAura then
            task.cancel(Connections.AutoGoodAura)
            Connections.AutoGoodAura = nil
        end
        print("[AutoGoodAura] Disabled")
    end
end)

local WLFrame = Instance.new("Frame")
WLFrame.Size = UDim2.new(1, 0, 0, 150)
WLFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
WLFrame.BorderSizePixel = 0
WLFrame.Parent = CombatTab

local WLCorner = Instance.new("UICorner")
WLCorner.CornerRadius = UDim.new(0, 4)
WLCorner.Parent = WLFrame

local WLTitle = Instance.new("TextLabel")
WLTitle.Size = UDim2.new(1, -16, 0, 24)
WLTitle.Position = UDim2.new(0, 8, 0, 4)
WLTitle.BackgroundTransparency = 1
WLTitle.Text = "Auto Kill WhiteList"
WLTitle.TextColor3 = Color3.fromRGB(200, 200, 210)
WLTitle.TextSize = 12
WLTitle.Font = Enum.Font.GothamBold
WLTitle.TextXAlignment = Enum.TextXAlignment.Left
WLTitle.Parent = WLFrame

local WLScroll = Instance.new("ScrollingFrame")
WLScroll.Size = UDim2.new(1, -16, 1, -64)
WLScroll.Position = UDim2.new(0, 8, 0, 32)
WLScroll.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
WLScroll.BorderSizePixel = 0
WLScroll.ScrollBarThickness = 4
WLScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
WLScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
WLScroll.Parent = WLFrame

local WLScrollCorner = Instance.new("UICorner")
WLScrollCorner.CornerRadius = UDim.new(0, 4)
WLScrollCorner.Parent = WLScroll

local WLList = Instance.new("UIListLayout")
WLList.Padding = UDim.new(0, 4)
WLList.SortOrder = Enum.SortOrder.LayoutOrder
WLList.Parent = WLScroll

local function updateAutoKillWhiteList()
    for _, child in pairs(WLScroll:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    for idx, playerName in pairs(Config.Combat.AutoKillWhiteList) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -8, 0, 28)
        btn.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
        btn.BorderSizePixel = 0
        btn.Text = playerName .. " [Remove]"
        btn.TextColor3 = Color3.fromRGB(200, 200, 210)
        btn.TextSize = 11
        btn.Font = Enum.Font.Gotham
        btn.Parent = WLScroll

        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 4)
        btnCorner.Parent = btn

        btn.MouseButton1Click:Connect(function()
            table.remove(Config.Combat.AutoKillWhiteList, idx)
            updateAutoKillWhiteList()
            print("[AutoKill] Removed: " .. playerName)
        end)

        btn.MouseEnter:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(139, 0, 0)}):Play()
        end)

        btn.MouseLeave:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(18, 18, 22)}):Play()
        end)
    end
end

local WLAddBtn = Instance.new("TextButton")
WLAddBtn.Size = UDim2.new(1, -16, 0, 28)
WLAddBtn.Position = UDim2.new(0, 8, 1, -32)
WLAddBtn.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
WLAddBtn.BorderSizePixel = 0
WLAddBtn.Text = "Добавить игрока"
WLAddBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
WLAddBtn.TextSize = 11
WLAddBtn.Font = Enum.Font.GothamBold
WLAddBtn.Parent = WLFrame

local WLAddCorner = Instance.new("UICorner")
WLAddCorner.CornerRadius = UDim.new(0, 4)
WLAddCorner.Parent = WLAddBtn

WLAddBtn.MouseButton1Click:Connect(function()
    local availablePlayers = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local alreadyListed = false
            for _, name in pairs(Config.Combat.AutoKillWhiteList) do
                if player.Name == name then
                    alreadyListed = true
                    break
                end
            end
            if not alreadyListed then
                table.insert(availablePlayers, player.Name)
            end
        end
    end

    if #availablePlayers > 0 then
        local selected = availablePlayers[math.random(1, #availablePlayers)]
        table.insert(Config.Combat.AutoKillWhiteList, selected)
        updateAutoKillWhiteList()
        print("[AutoKill] Added: " .. selected)
    end
end)

WLAddBtn.MouseEnter:Connect(function()
    TweenService:Create(WLAddBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(160, 0, 0)}):Play()
end)

WLAddBtn.MouseLeave:Connect(function()
    TweenService:Create(WLAddBtn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(139, 0, 0)}):Play()
end)

updateAutoKillWhiteList()

local PlayerButtonsContainer = Instance.new("ScrollingFrame")
PlayerButtonsContainer.Size = UDim2.new(1, -8, 0, 200)
PlayerButtonsContainer.Position = UDim2.new(0, 4, 0, 180)
PlayerButtonsContainer.BackgroundTransparency = 1
PlayerButtonsContainer.BorderSizePixel = 0
PlayerButtonsContainer.ScrollBarThickness = 4
PlayerButtonsContainer.ScrollBarImageColor3 = Color3.fromRGB(139, 0, 0)
PlayerButtonsContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
PlayerButtonsContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
PlayerButtonsContainer.Parent = TeleportTab

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 4)
UIListLayout.Parent = PlayerButtonsContainer

local function RefreshPlayerButtons()
    for _, child in pairs(PlayerButtonsContainer:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    local playerCount = 0
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and playerCount < 25 then
            playerCount = playerCount + 1

            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, -8, 0, 32)
            btn.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
            btn.BorderSizePixel = 0
            btn.Text = player.Name
            btn.TextColor3 = Color3.fromRGB(200, 200, 210)
            btn.TextSize = 12
            btn.Font = Enum.Font.Gotham
            btn.LayoutOrder = playerCount
            btn.Parent = PlayerButtonsContainer

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 4)
            corner.Parent = btn

            btn.MouseButton1Click:Connect(function()
                pcall(function()
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
                        print("[TP] Teleported to: " .. player.Name)
                    end
                end)
            end)

            btn.MouseEnter:Connect(function()
                TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(139, 0, 0)}):Play()
            end)

            btn.MouseLeave:Connect(function()
                TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(18, 18, 22)}):Play()
            end)
        end
    end
end

RefreshPlayerButtons()

Players.PlayerAdded:Connect(RefreshPlayerButtons)
Players.PlayerRemoving:Connect(RefreshPlayerButtons)

AddToggle(PlayerTab, "Fly", false, function(v)
    Config.Player.Fly = v
    if v then
        local char = LocalPlayer.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") then
            Config.Player.Fly = false
            return
        end
        local hrp = char.HumanoidRootPart

        local bv = Instance.new("BodyVelocity")
        bv.Name = "FlyVelocity"
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        bv.Parent = hrp

        local bg = Instance.new("BodyGyro")
        bg.Name = "FlyGyro"
        bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.P = 9e4
        bg.Parent = hrp

        Connections.Fly = RunService.Heartbeat:Connect(function()
            pcall(function()
                if not Config.Player.Fly or not hrp or not hrp.Parent then
                    if bv and bv.Parent then bv:Destroy() end
                    if bg and bg.Parent then bg:Destroy() end
                    if Connections.Fly then
                        Connections.Fly:Disconnect()
                        Connections.Fly = nil
                    end
                    return
                end

                local cam = workspace.CurrentCamera
                local move = Vector3.new(0, 0, 0)

                if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - cam.CFrame.LookVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + cam.CFrame.RightVector end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0, 1, 0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then move = move - Vector3.new(0, 1, 0) end

                if bv and bv.Parent then
                    bv.Velocity = move * 150
                end
                if bg and bg.Parent then
                    bg.CFrame = cam.CFrame
                end
            end)
        end)

        print("[Fly] Enabled")
    else
        if Connections.Fly then
            Connections.Fly:Disconnect()
            Connections.Fly = nil
        end

        pcall(function()
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                local hrp = char.HumanoidRootPart
                local bv = hrp:FindFirstChild("FlyVelocity")
                local bg = hrp:FindFirstChild("FlyGyro")
                if bv then bv:Destroy() end
                if bg then bg:Destroy() end
            end
        end)

        print("[Fly] Disabled")
    end
end)

AddToggle(PlayerTab, "No Clip", false, function(v)
    Config.Player.NoClip = v
    if v then
        Connections.NoClip = RunService.Stepped:Connect(function()
            pcall(function()
                for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end)
        end)
    else
        if Connections.NoClip then
            Connections.NoClip:Disconnect()
            Connections.NoClip = nil
        end
    end
end)

AddSlider(PlayerTab, "Speed", 16, 500, 16, function(v)
    Config.Player.Speed = v
    pcall(function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = v
        end
    end)
end)

AddToggle(PlayerTab, "Anti AFK", true, function(v)
    Config.Player.AntiAFK = v
    if v then
        local VirtualUser = game:GetService("VirtualUser")

        Connections.AntiAFK = LocalPlayer.Idled:Connect(function()
            pcall(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        end)

        Connections.AntiAFKLoop = task.spawn(function()
            while Config.Player.AntiAFK do
                pcall(function()
                    VirtualUser:CaptureController()
                    VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                    task.wait(0.05)
                    VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                end)

                pcall(function()
                    local char = LocalPlayer.Character
                    local humanoid = char and char:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        task.wait(0.1)
                        humanoid:ChangeState(Enum.HumanoidStateType.Landed)
                    end
                end)

                task.wait(15)
            end
        end)

        print("[BloodyNight] Anti AFK enabled")
    else
        if Connections.AntiAFK then
            Connections.AntiAFK:Disconnect()
            Connections.AntiAFK = nil
        end
        if Connections.AntiAFKLoop then
            task.cancel(Connections.AntiAFKLoop)
            Connections.AntiAFKLoop = nil
        end
        print("[BloodyNight] Anti AFK disabled")
    end
end)

local gymLocations = {
    {name = "Промышленный Спортзал", pos = Vector3.new(-5563.23, 57.55, 4942.44)},
    {name = "Джунгли", pos = Vector3.new(-8685.62, 3.88, 2392.33)},
    {name = "Рай", pos = Vector3.new(4603.28, 988.63, -3897.87)},
    {name = "Ад", pos = Vector3.new(-6758.96, 4.45, -1284.92)},
    {name = "Король Мускулов", pos = Vector3.new(-8625.93, 14.30, -5730.47)},
    {name = "Мифический", pos = Vector3.new(2250.78, 4.45, 1073.23)},
    {name = "Мороз", pos = Vector3.new(-2623.02, 4.45, -409.07)},
    {name = "Крошечный Остров", pos = Vector3.new(-26.45, 4.60, 1917.58)}
}

for _, gym in ipairs(gymLocations) do
    AddButton(TeleportTab, gym.name, function()
        pcall(function()
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = CFrame.new(gym.pos)
                print("[TP] Teleported to: " .. gym.name)
            end
        end)
    end)
end

local originalSoundVolumes = {}
local noWeightSoundTarget = "All"

local NoWeightSoundLabel = Instance.new("TextLabel")
NoWeightSoundLabel.Size = UDim2.new(1, 0, 0, 32)
NoWeightSoundLabel.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
NoWeightSoundLabel.BorderSizePixel = 0
NoWeightSoundLabel.Text = "  Target: Все игроки"
NoWeightSoundLabel.TextColor3 = Color3.fromRGB(180, 180, 190)
NoWeightSoundLabel.TextSize = 11
NoWeightSoundLabel.Font = Enum.Font.Gotham
NoWeightSoundLabel.TextXAlignment = Enum.TextXAlignment.Left
NoWeightSoundLabel.ZIndex = 2
NoWeightSoundLabel.Parent = MiscTab

local LabelCorner = Instance.new("UICorner")
LabelCorner.CornerRadius = UDim.new(0, 4)
LabelCorner.Parent = NoWeightSoundLabel

local TargetButton = Instance.new("TextButton")
TargetButton.Size = UDim2.new(0, 120, 0, 24)
TargetButton.Position = UDim2.new(1, -130, 0, 4)
TargetButton.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
TargetButton.BorderSizePixel = 0
TargetButton.Text = "Сменить"
TargetButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TargetButton.TextSize = 11
TargetButton.Font = Enum.Font.GothamBold
TargetButton.ZIndex = 3
TargetButton.Parent = NoWeightSoundLabel

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 4)
BtnCorner.Parent = TargetButton

TargetButton.MouseButton1Click:Connect(function()
    if noWeightSoundTarget == "All" then
        noWeightSoundTarget = "Me"
        NoWeightSoundLabel.Text = "  Target: Только я"
    else
        noWeightSoundTarget = "All"
        NoWeightSoundLabel.Text = "  Target: Все игроки"
    end
    print("[BloodyNight] Target changed to: " .. noWeightSoundTarget)
end)

local printedSounds = {}

local screamSoundKeywords = {"scream", "yell", "grunt", "shout", "крик", "strengthgain", "strength_gain", "lift", "workoutsound", "workout_sound"}

local function isTargetedScreamSound(obj)
    local name = obj.Name:lower()
    local id = obj.SoundId:lower()
    for _, keyword in ipairs(screamSoundKeywords) do
        if name:find(keyword, 1, true) or id:find(keyword, 1, true) then
            return true
        end
    end
    return false
end

AddToggle(MiscTab, "No Weight Sound", false, function(v)
    Config.Misc.NoWeightSound = v
    if v then
        printedSounds = {}
        print("[BloodyNight] NoWeightSound: targeting scream/grunt sounds only")
        print("[BloodyNight] Качай — новые незнакомые звуки печатаются в консоль для донастройки списка ключевых слов")

        Connections.NoWeightSoundDebug = task.spawn(function()
            while Config.Misc.NoWeightSound do
            pcall(function()
                local targetChars = {}
                if noWeightSoundTarget == "Me" then
                    if LocalPlayer.Character then
                        table.insert(targetChars, LocalPlayer.Character)
                    end
                else
                    for _, player in pairs(Players:GetPlayers()) do
                        if player.Character then
                            table.insert(targetChars, player.Character)
                        end
                    end
                end

                for _, char in pairs(targetChars) do
                    for _, obj in pairs(char:GetDescendants()) do
                        if obj:IsA("Sound") and obj.Playing then
                            local soundKey = obj.Name .. "_" .. obj.SoundId
                            local targeted = isTargetedScreamSound(obj)

                            if not printedSounds[soundKey] then
                                print(string.format("[SOUND%s] Name: '%s' | Parent: '%s' | SoundId: '%s'", targeted and " MUTED" or "", obj.Name, obj.Parent.Name, obj.SoundId))
                                printedSounds[soundKey] = true
                            end

                            if targeted then
                                if not originalSoundVolumes[obj] then
                                    originalSoundVolumes[obj] = obj.Volume
                                end
                                obj.Volume = 0
                            end
                        end
                    end
                end
            end)
            task.wait(0.15)
            end
        end)
    else
        if Connections.NoWeightSoundDebug then
            task.cancel(Connections.NoWeightSoundDebug)
            Connections.NoWeightSoundDebug = nil
        end

        pcall(function()
            for sound, volume in pairs(originalSoundVolumes) do
                if sound and sound.Parent then
                    sound.Volume = volume
                end
            end
            originalSoundVolumes = {}
        end)

        printedSounds = {}
        print("[BloodyNight] NoWeightSound disabled")
    end
end)

local eggAnimationKeywords = {"egg", "hatch", "open", "pet", "reward", "chest", "gift", "unbox", "crack", "roll", "summon", "cutscene", "reveal"}
local eggButtonKeywords = {"skip", "claim", "ok", "close", "continue", "collect", "x"}
local loggedEggGuiNames = {}

local function logEggGuiOnce(name, className)
    local key = name .. ":" .. className
    if loggedEggGuiNames[key] then return end
    loggedEggGuiNames[key] = true
    print("[EggDebug] New GUI while SkipEggAnimation active: " .. name .. " (" .. className .. ")")
end

local function clickButtonReal(btn)
    if getconnections then
        local ok = pcall(function()
            for _, conn in pairs(getconnections(btn.MouseButton1Click)) do
                conn:Fire()
            end
        end)
        if ok then return true end
    end

    local ok2 = pcall(function()
        local VirtualUser = game:GetService("VirtualUser")
        local pos = btn.AbsolutePosition + btn.AbsoluteSize / 2
        VirtualUser:CaptureController()
        VirtualUser:ClickButton1(Vector2.new(pos.X, pos.Y), workspace.CurrentCamera.CFrame)
    end)
    if ok2 then return true end

    return pcall(function() btn.MouseButton1Click:Fire() end)
end

local function nameMatchesEggKeywords(name)
    for _, keyword in ipairs(eggAnimationKeywords) do
        if name:find(keyword, 1, true) then
            return true
        end
    end
    return false
end

local function trySkipEggGui(gui)
    if not gui or not gui.Parent then return end

    local matches = false
    local node = gui
    local depth = 0
    while node and depth < 4 do
        if nameMatchesEggKeywords(node.Name:lower()) then
            matches = true
            break
        end
        if node == LocalPlayer.PlayerGui then break end
        node = node.Parent
        depth = depth + 1
    end
    if not matches then return end
    gui = node

    local clicked = false
    for _, btn in pairs(gui:GetDescendants()) do
        if btn:IsA("TextButton") or btn:IsA("ImageButton") then
            local text = (btn:IsA("TextButton") and btn.Text or ""):lower()
            for _, keyword in ipairs(eggButtonKeywords) do
                if text:find(keyword, 1, true) then
                    clicked = clickButtonReal(btn)
                    break
                end
            end
            if clicked then break end
        end
    end

    task.wait(0.15)
    if gui.Parent then
        pcall(function() gui:Destroy() end)
    end
end

AddToggle(MiscTab, "Skip Egg Animation", false, function(v)
    Config.Misc.SkipEggAnimation = v
    if v then
        Connections.SkipEggAnimation = LocalPlayer.PlayerGui.DescendantAdded:Connect(function(gui)
            if not Config.Misc.SkipEggAnimation then return end
            logEggGuiOnce(gui.Name, gui.ClassName)
            if not (gui:IsA("ScreenGui") or gui:IsA("Frame") or gui:IsA("CanvasGroup") or gui:IsA("ImageLabel") or gui:IsA("ViewportFrame") or gui:IsA("BillboardGui") or gui:IsA("SurfaceGui")) then return end
            pcall(trySkipEggGui, gui)
        end)

        print("[SkipEggAnimation] Enabled - watching for skip/claim GUI buttons only (Animator-track killing removed, it broke animations without skipping them)")
    else
        if Connections.SkipEggAnimation then
            Connections.SkipEggAnimation:Disconnect()
            Connections.SkipEggAnimation = nil
        end
        print("[SkipEggAnimation] Disabled")
    end
end)


local Watermark = Instance.new("Frame")
Watermark.Name = "Watermark"
Watermark.Size = UDim2.new(0, 200, 0, 42)
Watermark.Position = UDim2.new(0.5, -100, 0, 12)
Watermark.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
Watermark.BackgroundTransparency = 0.25
Watermark.BorderSizePixel = 0
Watermark.Parent = ScreenGui

local WaterCorner = Instance.new("UICorner")
WaterCorner.CornerRadius = UDim.new(0, 4)
WaterCorner.Parent = Watermark

local WaterStroke = Instance.new("UIStroke")
WaterStroke.Color = Color3.fromRGB(139, 0, 0)
WaterStroke.Thickness = 1.5
WaterStroke.Parent = Watermark

local WaterButton = Instance.new("TextButton")
WaterButton.Size = UDim2.new(1, 0, 1, 0)
WaterButton.BackgroundTransparency = 1
WaterButton.Text = ""
WaterButton.ZIndex = 10
WaterButton.Parent = Watermark

local WaterTitle = Instance.new("TextLabel")
WaterTitle.Size = UDim2.new(1, -16, 0, 18)
WaterTitle.Position = UDim2.new(0, 8, 0, 6)
WaterTitle.BackgroundTransparency = 1
WaterTitle.Text = "BLOODYNIGHT 0.5.0 BETA"
WaterTitle.TextColor3 = Color3.fromRGB(139, 0, 0)
WaterTitle.TextSize = 12
WaterTitle.Font = Enum.Font.GothamBold
WaterTitle.TextXAlignment = Enum.TextXAlignment.Left
WaterTitle.Parent = Watermark

local WaterSub = Instance.new("TextLabel")
WaterSub.Size = UDim2.new(1, -16, 0, 14)
WaterSub.Position = UDim2.new(0, 8, 0, 22)
WaterSub.BackgroundTransparency = 1
WaterSub.Text = "FPS: 60 | Click to toggle"
WaterSub.TextColor3 = Color3.fromRGB(120, 120, 130)
WaterSub.TextSize = 10
WaterSub.Font = Enum.Font.Gotham
WaterSub.TextXAlignment = Enum.TextXAlignment.Left
WaterSub.Parent = Watermark

local waterDragging, waterDragStart, waterStartPos

WaterButton.MouseButton1Click:Connect(function()
    if not Config.UI.WatermarkMove then
        local width, height = GetMenuSize()
        if Main.Visible then
            local currentPos = Main.Position
            TweenService:Create(Main, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(currentPos.X.Scale, currentPos.X.Offset, currentPos.Y.Scale, currentPos.Y.Offset)
            }):Play()
            task.wait(0.25)
            Main.Visible = false
            Main.Size = UDim2.new(0, width, 0, height)
        else
            Main.Visible = true
            local savedPos = Main.Position
            Main.Size = UDim2.new(0, 0, 0, 0)
            TweenService:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, width, 0, height),
                Position = savedPos
            }):Play()
        end
    end
end)

WaterButton.InputBegan:Connect(function(input)
    if Config.UI.WatermarkMove and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
        waterDragging = true
        waterDragStart = input.Position
        waterStartPos = Watermark.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                waterDragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if Config.UI.WatermarkMove and waterDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - waterDragStart
        Watermark.Position = UDim2.new(waterStartPos.X.Scale, waterStartPos.X.Offset + delta.X, waterStartPos.Y.Scale, waterStartPos.Y.Offset + delta.Y)
    end
end)

WaterButton.MouseEnter:Connect(function()
    TweenService:Create(WaterStroke, TweenInfo.new(0.15), {Color = Color3.fromRGB(160, 0, 0)}):Play()
end)

WaterButton.MouseLeave:Connect(function()
    TweenService:Create(WaterStroke, TweenInfo.new(0.15), {Color = Color3.fromRGB(139, 0, 0)}):Play()
end)

task.spawn(function()
    local lastUpdate = tick()
    local frames = 0
    RunService.RenderStepped:Connect(function()
        frames = frames + 1
        if tick() - lastUpdate >= 0.5 then
            local fps = math.floor(frames / (tick() - lastUpdate))
            WaterSub.Text = string.format("FPS: %d | Click to toggle", fps)
            frames = 0
            lastUpdate = tick()
        end
    end)
end)

AddToggle(SettingTab, "Watermark Move", false, function(v)
    Config.UI.WatermarkMove = v
    if v then
        print("[Settings] Watermark dragging enabled")
    else
        print("[Settings] Watermark dragging disabled")
    end
end)

AddButton(SettingTab, "EXIT", function()
    for _, conn in pairs(Connections) do
        if conn then conn:Disconnect() end
    end
    ScreenGui:Destroy()
end)

AddSlider(SettingTab, "Menu Size", 50, 150, 100, function(value)
    Config.MenuSize = value / 100
    UpdateMenuSize()
end)

CloseBtn.MouseButton1Click:Connect(function()
    local width, height = GetMenuSize()
    local currentPos = Main.Position
    TweenService:Create(Main, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(currentPos.X.Scale, currentPos.X.Offset, currentPos.Y.Scale, currentPos.Y.Offset)
    }):Play()
    task.wait(0.25)
    Main.Visible = false
    Main.Size = UDim2.new(0, width, 0, height)
end)

local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.Insert then
        local width, height = GetMenuSize()
        if Main.Visible then
            local currentPos = Main.Position
            TweenService:Create(Main, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(currentPos.X.Scale, currentPos.X.Offset, currentPos.Y.Scale, currentPos.Y.Offset)
            }):Play()
            task.wait(0.25)
            Main.Visible = false
            Main.Size = UDim2.new(0, width, 0, height)
        else
            Main.Visible = true
            local savedPos = Main.Position
            Main.Size = UDim2.new(0, 0, 0, 0)
            TweenService:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, width, 0, height),
                Position = savedPos
            }):Play()
        end
    end
end)

Main.Size = UDim2.new(0, 0, 0, 0)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
task.wait(0.1)
local width, height = GetMenuSize()
TweenService:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = UDim2.new(0, width, 0, height),
    Position = UDim2.new(0.5, -425, 0.5, -275)
}):Play()

print("✓ BloodyNight Beta 0.5.1 loaded!")
print("✓ Press INSERT to toggle")
print("✓ Auto Farm: Equips Weight tool and activates")
print("✓ Auto Rebirth: Single-click system")
print("═══════════════════════════════════════")
