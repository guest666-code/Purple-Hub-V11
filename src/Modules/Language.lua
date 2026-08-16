-- Purple Hub V11 | Language Module
local Language = {}

Language.Translations = {
    US = { -- İngilizce (ABD)
        AutoAim = "Auto-Aim",
        NoRecoil = "No-Recoil",
        ESP = "ESP / Visuals",
        StatusOpen = "ON",
        StatusClose = "OFF",
        Title = "Purple Hub V11"
    },
    BR = { -- Portekizce (Brezilya)
        AutoAim = "Mira Automática",
        NoRecoil = "Sem Recuo",
        ESP = "ESP / Visuais",
        StatusOpen = "LIGADO",
        StatusClose = "DESLIGADO",
        Title = "Purple Hub V11"
    },
    TR = { -- Türkçe
        AutoAim = "Otomatik Nişan",
        NoRecoil = "Geri Tepme Yok",
        ESP = "ESP / Görseller",
        StatusOpen = "AÇIK",
        StatusClose = "KAPALI",
        Title = "Purple Hub V11"
    },
    DE = { -- Almanca
        AutoAim = "Auto-Zielen",
        NoRecoil = "Kein Rückstoß",
        ESP = "ESP / Visuell",
        StatusOpen = "AN",
        StatusClose = "AUS",
        Title = "Purple Hub V11"
    },
    RU = { -- Rusça
        AutoAim = "Авто-прицел",
        NoRecoil = "Без отдачи",
        ESP = "ESP / Визуал",
        StatusOpen = "ВКЛ",
        StatusClose = "ВЫКЛ",
        Title = "Purple Hub V11"
    },
    TH = { -- Tayca
        AutoAim = "เล็งอัตโนมัติ",
        NoRecoil = "ไร้แรงสะท้อน",
        ESP = "มองทะลุ",
        StatusOpen = "เปิด",
        StatusClose = "ปิด",
        Title = "Purple Hub V11"
    },
    KZ = { -- Kazakça
        AutoAim = "Авто-Нысана",
        NoRecoil = "Тебусіз",
        ESP = "ESP / Көрініс",
        StatusOpen = "ҚОСУЛЫ",
        StatusClose = "ӨШІРУЛІ",
        Title = "Purple Hub V11"
    }
}

-- Kullanıcının dilini otomatik tespit etme fonksiyonu
function Language.GetPlayerLanguage()
    local LocalizationService = game:GetService("LocalizationService")
    local code = LocalizationService.RobloxLocaleId:sub(1, 2):upper()
    
    -- Dil kodu tabloda varsa onu döndür, yoksa varsayılan İngilizce (US) yap
    if Language.Translations[code] then
        return Language.Translations[code]
    else
        return Language.Translations.US
    end
end

return Language

