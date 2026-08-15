-- Purple Hub V11 | Loader
local BaseUrl = "https://raw.githubusercontent.com/guest666-code/Purple-Hub-V11/main/src/"

-- Modülleri Yükle
local Settings = loadstring(game:HttpGet(BaseUrl .. "Config/Settings.lua"))()
local Utility  = loadstring(game:HttpGet(BaseUrl .. "Modules/Utility.lua"))()
local UI       = loadstring(game:HttpGet(BaseUrl .. "UI/MainGui.lua"))()

-- Başlatma Bildirimi
Utility.Notify("Purple Hub V11", "Tablet versiyonu başarıyla yüklendi!")
