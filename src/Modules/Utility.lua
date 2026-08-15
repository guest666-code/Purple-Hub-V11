-- Purple Hub V11 | Utility Module
local Utility = {}

-- Donmayı engelleyen güvenli döngü fonksiyonu
function Utility.SafeLoop(interval, callback)
    task.spawn(function()
        while true do
            callback()
            task.wait(interval or 0.1) -- Nefes payı
        end
    end)
end

-- Tıklama ses efekti
function Utility.PlayClick()
    local sound = Instance.new("Sound", game:GetService("SoundService"))
    sound.SoundId = "rbxassetid://12221967"
    sound.Volume = 0.5
    sound:Play()
    game:GetService("Debris"):AddItem(sound, 1)
end

return Utility
