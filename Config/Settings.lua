-- Purple Hub V11 | Configuration Settings
local Settings = {
    -- [COMBAT MODÜLLERİ]
    Combat = {
        AutoAim = false,
        SilentAim = false,
        NoRecoil = false,
        HitboxExpander = false,
        AimFOV = 100 -- Hedefleme alanının büyüklüğü
    },
    
    -- [VISUALS / ESP MODÜLLERİ]
    Visuals = {
        ESP = false,
        Boxes = false,
        Tracers = false,
        Names = false,
        HighlightColor = Color3.fromRGB(138, 43, 226) -- Purpleguy Moru
    },

    -- [UI & SES AYARLARI]
    System = {
        Volume = 0.5,
        SoundEffects = true,
        MinimizeKey = Enum.KeyCode.RightControl,
        Version = "V11-PRO"
    }
}

return Settings

