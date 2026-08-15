-- Purple Hub V11 | UI Components Module
local Components = {}

-- Sürüklenebilir Başlık / Panel Temeli
function Components.CreateFrame(parent, size, pos, theme)
    local frame = Instance.new("Frame")
    frame.Size = size
    frame.Position = pos
    frame.BackgroundColor3 = theme.Background
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Draggable = true -- Tabletlerde parmakla taşınabilir
    frame.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    return frame
end

-- Tıklanabilir / Durum Değiştiren Toggle Butonu
function Components.CreateToggle(parent, text, defaultState, callback, theme, utility)
    local state = defaultState

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 42)
    btn.BackgroundColor3 = state and theme.Accent or theme.ButtonUnchecked
    btn.Text = text .. ": " .. (state and "AÇIK" or "KAPALI")
    btn.TextColor3 = theme.Text
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 16
    btn.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.BackgroundColor3 = state and theme.Accent or theme.ButtonUnchecked
        btn.Text = text .. ": " .. (state and "AÇIK" or "KAPALI")
        
        if utility and utility.PlayClick then
            utility.PlayClick()
        end
        
        if callback then
            callback(state)
        end
    end)

    return btn
end

return Components
