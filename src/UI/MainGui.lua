-- Purple Hub V11 | Main GUI Loader
local MainGui = {}

function MainGui.Init(Settings, Theme, Components, Utility)
    local CoreGui = game:GetService("CoreGui")
    
    -- Eski GUI varsa temizle (Çakışmayı önler)
    if CoreGui:FindFirstChild("PurpleHubV11") then
        CoreGui.PurpleHubV11:Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "PurpleHubV11"
    ScreenGui.ResetOnSpawn = false -- Öldüğünde menü kapanmaz
    ScreenGui.Parent = CoreGui

    -- Ana Panel (Tablet boyutlarına uygun)
    local MainFrame = Components.CreateFrame(
        ScreenGui, 
        UDim2.new(0, 240, 0, 320), 
        UDim2.new(0.5, -120, 0.4, -160), 
        Theme
    )

    -- Başlık Barı
    local Header = Instance.new("TextLabel")
    Header.Size = UDim2.new(1, 0, 0, 40)
    Header.BackgroundColor3 = Theme.Header
    Header.Text = "Purple Hub V11"
    Header.TextColor3 = Theme.Accent
    Header.Font = Enum.Font.SourceSansBold
    Header.TextSize = 18
    Header.Parent = MainFrame

    local HeaderCorner = Instance.new("UICorner")
    HeaderCorner.CornerRadius = UDim.new(0, 8)
    HeaderCorner.Parent = Header

    -- Dikey Sıralayıcı (Layout)
    local Layout = Instance.new("UIListLayout")
    Layout.Parent = MainFrame
    Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.Padding = UDim.new(0, 8)

    -- Başlık sonrası boşluk için offset
    local Padding = Instance.new("UIPadding")
    Padding.PaddingTop = UDim.new(0, 48)
    Padding.Parent = MainFrame

    -- Combat & Visuals Butonları
    Components.CreateToggle(MainFrame, "Auto-Aim", Settings.Combat.AutoAim, function(val)
        Settings.Combat.AutoAim = val
    end, Theme, Utility)

    Components.CreateToggle(MainFrame, "No-Recoil", Settings.Combat.NoRecoil, function(val)
        Settings.Combat.NoRecoil = val
    end, Theme, Utility)

    Components.CreateToggle(MainFrame, "ESP", Settings.Visuals.ESP, function(val)
        Settings.Visuals.ESP = val
    end, Theme, Utility)

    return ScreenGui
end

return MainGui
