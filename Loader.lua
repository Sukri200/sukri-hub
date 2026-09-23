local baseURL = "https://raw.githubusercontent.com/Sukri200/sukri-hub/main/"

local function RequireModule(path)
    local url = baseURL .. path
    local success, content = pcall(game.HttpGet, game, url)
    if not success or not content or content == "404: Not Found" then
        warn("❌ File tidak ditemukan / 404: " .. path)
        return nil
    end
    
    local func, err = loadstring(content)
    if not func then
        warn("❌ Error sintaks pada " .. path .. ": " .. tostring(err))
        return nil
    end
    return func()
end

local UI = RequireModule("UI.lua")
local AntiTrap = RequireModule("Fitur/AntiTrap.lua")

if UI and AntiTrap then
    UI.Init()
    UI.CreateToggleButton(function()
        return AntiTrap.Toggle()
    end)
    _G.YOKUDO_AntiTrap = AntiTrap
    print("✅ Sukri Hub Berhasil Dimuat!")
end
