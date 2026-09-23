-- ==================================================
-- FILE: Loader.lua
-- ==================================================

-- GANTI URL INI DENGAN URL RAW GITHUB ANDA NANTI
local baseURL = "local baseURL = "https://raw.githubusercontent.com/Sukri200/sukri-hub/main/"
"

-- Fungsi pembantu untuk memanggil file
local function RequireModule(path)
    local success, result = pcall(function()
        return loadstring(game:HttpGet(baseURL .. path, true))()
    end)
    
    if not success then
        warn("Gagal memuat modul: " .. path)
        return nil
    end
    return result
end

print("⏳ Sedang memuat Yokudo Hub...")

-- 1. Panggil Modul
local UI = RequireModule("UI.lua")
local AntiTrap = RequireModule("Features/AntiTrap.lua")

if UI and AntiTrap then
    -- 2. Buat Tampilan Utama
    UI.Init()
    
    -- 3. Buat Tombol dan hubungkan dengan Fitur AntiTrap
    UI.CreateToggleButton(function()
        -- Saat tombol diklik, jalankan fungsi toggle di AntiTrap.lua
        local statusSekarang = AntiTrap.Toggle() 
        return statusSekarang -- Kembalikan nilai (true/false) agar UI bisa mengubah warna
    end)

    -- 4. Export Global seperti di script awal Anda
    _G.YOKUDO_AntiTrap = AntiTrap

    print("✅ Yokudo Hub (Modular) Loaded Successfully!")
else
    warn("❌ Gagal memuat script. Pastikan URL GitHub sudah benar.")
end
