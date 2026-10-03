--// PHANTOM KEY SYSTEM V1
--// UI only - Get Key / Copy Link / Key Input
--// Configure apenas KEY_LINK

local KEY_LINK = "https://SEU-SITE.netlify.app"

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--// Remove UI antiga
local Old = PlayerGui:FindFirstChild("PhantomKeySystem")
if Old then
    Old:Destroy()
end

--// CONFIG
local PURPLE = Color3.fromRGB(145, 70, 255)
local BG = Color3.fromRGB(12, 12, 16)
local PANEL = Color3.fromRGB(18, 18, 24)
local PANEL2 = Color3.fromRGB(23, 23, 30)
local TEXT = Color3.fromRGB(245, 245, 250)
local MUTED = Color3.fromRGB(145, 145, 155)

--// GUI
local Gui = Instance.new("ScreenGui")
Gui.Name = "PhantomKeySystem"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.Parent = PlayerGui

--// Shadow
local Shadow = Instance.new("Frame")
Shadow.Size = UDim2.new(0, 440, 0, 340)
Shadow.Position = UDim2.new(0.5, -220, 0.5, -170)
Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BackgroundTransparency = 0.45
Shadow.BorderSizePixel = 0
Shadow.Parent = Gui

local ShadowCorner = Instance.new("UICorner")
ShadowCorner.CornerRadius = UDim.new(0, 14)
ShadowCorner.Parent = Shadow

--// Main
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 420, 0, 320)
Main.Position = UDim2.new(0.5, -210, 0.5, -160)
Main.BackgroundColor3 = BG
Main.BorderSizePixel = 0
Main.Parent = Gui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = Main

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(45, 45, 55)
Stroke.Thickness = 1
Stroke.Parent = Main

--// Top bar
local Top = Instance.new("Frame")
Top.Size = UDim2.new(1, 0, 0, 64)
Top.BackgroundColor3 = PANEL
Top.BorderSizePixel = 0
Top.Parent = Main

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 12)
TopCorner.Parent = Top

--// Logo
local Logo = Instance.new("TextLabel")
Logo.Size = UDim2.new(0, 38, 0, 38)
Logo.Position = UDim2.new(0, 14, 0.5, -19)
Logo.BackgroundColor3 = PURPLE
Logo.Text = "P"
Logo.TextColor3 = Color3.fromRGB(255,255,255)
Logo.TextSize = 22
Logo.Font = Enum.Font.GothamBold
Logo.Parent = Top

local LogoCorner = Instance.new("UICorner")
LogoCorner.CornerRadius = UDim.new(0, 9)
LogoCorner.Parent = Logo

--// Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0, 240, 0, 25)
Title.Position = UDim2.new(0, 64, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "PHANTOM KEY SYSTEM"
Title.TextColor3 = TEXT
Title.TextSize = 15
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Top

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(0, 240, 0, 18)
Subtitle.Position = UDim2.new(0, 64, 0, 34)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Secure Access"
Subtitle.TextColor3 = MUTED
Subtitle.TextSize = 11
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = Top

--// Close
local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 34, 0, 34)
Close.Position = UDim2.new(1, -46, 0.5, -17)
Close.BackgroundTransparency = 1
Close.Text = "×"
Close.TextColor3 = MUTED
Close.TextSize = 25
Close.Font = Enum.Font.GothamMedium
Close.Parent = Top

Close.MouseEnter:Connect(function()
    TweenService:Create(
        Close,
        TweenInfo.new(0.15),
        {TextColor3 = Color3.fromRGB(255, 90, 90)}
    ):Play()
end)

Close.MouseLeave:Connect(function()
    TweenService:Create(
        Close,
        TweenInfo.new(0.15),
        {TextColor3 = MUTED}
    ):Play()
end)

--// Content
local Header = Instance.new("TextLabel")
Header.Size = UDim2.new(1, -40, 0, 30)
Header.Position = UDim2.new(0, 20, 0, 84)
Header.BackgroundTransparency = 1
Header.Text = "KEY NECESSÁRIA"
Header.TextColor3 = TEXT
Header.TextSize = 18
Header.Font = Enum.Font.GothamBold
Header.TextXAlignment = Enum.TextXAlignment.Left
Header.Parent = Main

local Description = Instance.new("TextLabel")
Description.Size = UDim2.new(1, -40, 0, 42)
Description.Position = UDim2.new(0, 20, 0, 112)
Description.BackgroundTransparency = 1
Description.Text = "Obtenha sua Key através do sistema PHANTOM para continuar."
Description.TextColor3 = MUTED
Description.TextSize = 12
Description.Font = Enum.Font.Gotham
Description.TextWrapped = true
Description.TextXAlignment = Enum.TextXAlignment.Left
Description.Parent = Main

--// Key Input
local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(1, -40, 0, 42)
KeyBox.Position = UDim2.new(0, 20, 0, 158)
KeyBox.BackgroundColor3 = PANEL2
KeyBox.BorderSizePixel = 0
KeyBox.PlaceholderText = "Digite sua Key..."
KeyBox.PlaceholderColor3 = Color3.fromRGB(100,100,110)
KeyBox.Text = ""
KeyBox.TextColor3 = TEXT
KeyBox.TextSize = 12
KeyBox.Font = Enum.Font.Gotham
KeyBox.ClearTextOnFocus = false
KeyBox.Parent = Main

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 8)
KeyCorner.Parent = KeyBox

local KeyStroke = Instance.new("UIStroke")
KeyStroke.Color = Color3.fromRGB(42,42,52)
KeyStroke.Thickness = 1
KeyStroke.Parent = KeyBox

--// Get Key
local GetKey = Instance.new("TextButton")
GetKey.Size = UDim2.new(0.48, -5, 0, 42)
GetKey.Position = UDim2.new(0, 20, 0, 212)
GetKey.BackgroundColor3 = PURPLE
GetKey.BorderSizePixel = 0
GetKey.Text = "OBTER KEY"
GetKey.TextColor3 = Color3.fromRGB(255,255,255)
GetKey.TextSize = 12
GetKey.Font = Enum.Font.GothamBold
GetKey.Parent = Main

local GetCorner = Instance.new("UICorner")
GetCorner.CornerRadius = UDim.new(0, 8)
GetCorner.Parent = GetKey

--// Verify
local Verify = Instance.new("TextButton")
Verify.Size = UDim2.new(0.48, -5, 0, 42)
Verify.Position = UDim2.new(0.52, -15, 0, 212)
Verify.BackgroundColor3 = PANEL2
Verify.BorderSizePixel = 0
Verify.Text = "VERIFICAR"
Verify.TextColor3 = TEXT
Verify.TextSize = 12
Verify.Font = Enum.Font.GothamBold
Verify.Parent = Main

local VerifyCorner = Instance.new("UICorner")
VerifyCorner.CornerRadius = UDim.new(0, 8)
VerifyCorner.Parent = Verify

local VerifyStroke = Instance.new("UIStroke")
VerifyStroke.Color = Color3.fromRGB(45,45,55)
VerifyStroke.Parent = Verify

--// Status
local Status = Instance.new("TextLabel")
Status.Size = UDim2.new(1, -40, 0, 25)
Status.Position = UDim2.new(0, 20, 0, 265)
Status.BackgroundTransparency = 1
Status.Text = "●  Aguardando Key"
Status.TextColor3 = MUTED
Status.TextSize = 11
Status.Font = Enum.Font.GothamMedium
Status.TextXAlignment = Enum.TextXAlignment.Left
Status.Parent = Main

--// Open browser
local function OpenKeySite()
    local success = false

    pcall(function()
        if syn and syn.request then
            -- Não necessário para abrir; mantido sem requisições.
        end
    end)

    -- Clipboard, quando disponível
    pcall(function()
        if setclipboard then
            setclipboard(KEY_LINK)
            success = true
        end
    end)

    Status.Text = success
        and "●  Link copiado para a área de transferência"
        or "●  Copie o link manualmente: " .. KEY_LINK
    Status.TextColor3 = PURPLE
end

--// Buttons
GetKey.MouseButton1Click:Connect(function()
    OpenKeySite()
end)

Verify.MouseButton1Click:Connect(function()
    if KeyBox.Text == "" then
        Status.Text = "●  Digite uma Key primeiro"
        Status.TextColor3 = Color3.fromRGB(255, 180, 70)
        return
    end

    -- A validação real será feita pela API posteriormente.
    Status.Text = "●  Sistema de validação ainda não conectado"
    Status.TextColor3 = Color3.fromRGB(255, 180, 70)
end)

--// Button hover
local function Hover(button, normal, hover)
    button.MouseEnter:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.15),
            {BackgroundColor3 = hover}
        ):Play()
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(
            button,
            TweenInfo.new(0.15),
            {BackgroundColor3 = normal}
        ):Play()
    end)
end

Hover(GetKey, PURPLE, Color3.fromRGB(165, 90, 255))
Hover(Verify, PANEL2, Color3.fromRGB(30, 30, 38))

--// Drag
local dragging = false
local dragStart
local startPos

Top.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

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

UserInputService.InputChanged:Connect(function(input)
    if not dragging then return end

    if input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch then

        local delta = input.Position - dragStart

        Main.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )

        Shadow.Position = UDim2.new(
            Main.Position.X.Scale,
            Main.Position.X.Offset + 10,
            Main.Position.Y.Scale,
            Main.Position.Y.Offset + 10
        )
    end
end)

--// Close
Close.MouseButton1Click:Connect(function()
    local tween = TweenService:Create(
        Main,
        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
        {
            Size = UDim2.new(0, 380, 0, 280),
            BackgroundTransparency = 1
        }
    )

    tween:Play()

    TweenService:Create(
        Shadow,
        TweenInfo.new(0.2),
        {BackgroundTransparency = 1}
    ):Play()

    task.wait(0.2)
    Gui:Destroy()
end)
