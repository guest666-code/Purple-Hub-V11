-- Purple Hub V11 | Master Init.lua
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")

-- Eski Menü Varsa Temizle
if CoreGui:FindFirstChild("PurpleHubV11") then
    CoreGui.PurpleHubV11:Destroy()
end

-- Global Durum / Settings
local Settings = {
    AutoAim = false,
    NoRecoil = false,
    ESP = false
}

-- Tıklama Ses Efekti
local function PlayClickSound()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://12221967"
    sound.Volume = 0.5
    sound.Parent = SoundService
    sound:Play()
    Debris:AddItem(sound, 1)
end

-- ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PurpleHubV11"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- Ana Çerçeve (Main Frame)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 0, 0, 0) -- Animasyon için sıfır boyuttan başlıyor
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.Draggable = true -- Dokunarak/fareyle sürükleme
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

-- Başlık Çubuğu (Header)
local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(30, 28, 38)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 10)
HeaderCorner.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(0.6, 0, 1, 0)
Title.Position = UDim2.new(0.05, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Purple Hub V11"
Title.TextColor3 = Color3.fromRGB(138, 43, 226) -- Mor Accent
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

-- Kapatma (X) Butonu
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0.5, -15)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 14
CloseBtn.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

-- Küçültme (-) Butonu
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.Position = UDim2.new(1, -70, 0.5, -15)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
MinimizeBtn.Text = "-"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.Font = Enum.Font.SourceSansBold
MinimizeBtn.TextSize = 16
MinimizeBtn.Parent = Header

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 6)
MinCorner.Parent = MinimizeBtn

-- Butonlar İçi İçerik Alanı
local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, 0, 1, -40)
Container.Position = UDim2.new(0, 0, 0, 40)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local Layout = Instance.new("UIListLayout")
Layout.Parent = Container
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Padding = UDim.new(0, 8)

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, 10)
Padding.Parent = Container

-- Toggle Buton Oluşturucu (Hover, Ses ve Animasyonlu)
local function CreateToggle(name, settingKey)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 40)
    btn.BackgroundColor3 = Settings[settingKey] and Color3.fromRGB(138, 43, 226) or Color3.fromRGB(40, 40, 48)
    btn.Text = name .. ": " .. (Settings[settingKey] and "AÇIK" or "KAPALI")
    btn.TextColor3 = Color3.fromRGB(240, 240, 240)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 15
    btn.Parent = Container

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    -- Hover Efektleri (Üzerine gelince / Dokununca renk değişimi)
    btn.MouseEnter:Connect(function()
        if not Settings[settingKey] then
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 72)}):Play()
        end
    end)

    btn.MouseLeave:Connect(function()
        if not Settings[settingKey] then
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 48)}):Play()
        end
    end)

    -- Tıklama Olayı
    btn.MouseButton1Click:Connect(function()
        PlayClickSound()
        Settings[settingKey] = not Settings[settingKey]
        
        local targetColor = Settings[settingKey] and Color3.fromRGB(138, 43, 226) or Color3.fromRGB(40, 40, 48)
        TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = targetColor}):Play()
        
        btn.Text = name .. ": " .. (Settings[settingKey] and "AÇIK" or "KAPALI")
    end)
end

-- Özellik Butonlarını Ekle
CreateToggle("Auto-Aim", "AutoAim")
CreateToggle("No-Recoil", "NoRecoil")
CreateToggle("ESP", "ESP")

-- Açılış Animasyonu (Pop-Up)
MainFrame:TweenSize(
    UDim2.new(0, 250, 0, 220),
    Enum.EasingDirection.Out,
    Enum.EasingStyle.Back,
    0.4,
    true
)

-- Küçültme (-) Fonksiyonu
local isMinimized = false
MinimizeBtn.MouseButton1Click:Connect(function()
    PlayClickSound()
    isMinimized = not isMinimized
    
    local targetSize = isMinimized and UDim2.new(0, 250, 0, 40) or UDim2.new(0, 250, 0, 220)
    MainFrame:TweenSize(targetSize, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
end)

-- Kapatma (X) Fonksiyonu -> BÜTÜN HİLELERİ KAPATIR VEYA SİLER
CloseBtn.MouseButton1Click:Connect(function()
    PlayClickSound()
    
    -- Tüm özellikleri sıfırla/kapat
    for key in pairs(Settings) do
        Settings[key] = false
    end
    
    -- Kapanış Animasyonu
    local closeTween = MainFrame:TweenSize(
        UDim2.new(0, 0, 0, 0),
        Enum.EasingDirection.In,
        Enum.EasingStyle.Back,
        0.3,
        true
    )
    
    task.wait(0.3)
    ScreenGui:Destroy()
end)
