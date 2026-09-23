-- ==================================================
-- FILE: UI.lua
-- ==================================================
local UI = {}
local CoreGui = game:GetService("CoreGui")

function UI.Init()
    -- Hapus UI lama jika ada
    if CoreGui:FindFirstChild("YokudoAntiTrapUI") then
        CoreGui.YokudoAntiTrapUI:Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "YokudoAntiTrapUI"
    ScreenGui.Parent = CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    MainFrame.Position = UDim2.new(0.5, -100, 0.1, 0)
    MainFrame.Size = UDim2.new(0, 200, 0, 95)
    MainFrame.Active = true
    MainFrame.Draggable = true 

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = MainFrame

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Parent = MainFrame
    TitleLabel.BackgroundTransparency = 1.00
    TitleLabel.Position = UDim2.new(0, 0, 0, 8)
    TitleLabel.Size = UDim2.new(1, 0, 0, 20)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = "YOKUDO | Anti Trap"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 13
    
    UI.MainFrame = MainFrame -- Simpan MainFrame agar bisa diakses oleh fungsi pembuat tombol
end

-- Fungsi membuat tombol toggle yang menerima "callback" (fungsi yang dijalankan saat diklik)
function UI.CreateToggleButton(callback)
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Name = "ToggleButton"
    ToggleButton.Parent = UI.MainFrame
    ToggleButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50) 
    ToggleButton.Position = UDim2.new(0.1, 0, 0, 38)
    ToggleButton.Size = UDim2.new(0.8, 0, 0, 42)
    ToggleButton.Font = Enum.Font.GothamBold
    ToggleButton.Text = "Status: OFF 🔴"
    ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    ToggleButton.TextSize = 14

    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 6)
    ButtonCorner.Parent = ToggleButton

    -- Event klik
    ToggleButton.MouseButton1Click:Connect(function()
        -- Jalankan fitur dari script lain (lewat callback) dan ambil status on/off terbarunya
        local isEnabled = callback() 
        
        -- Update UI berdasarkan status
        if isEnabled then
            ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50) 
            ToggleButton.Text = "Status: ON 🟢"
        else
            ToggleButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50) 
            ToggleButton.Text = "Status: OFF 🔴"
        end
    end)
end

return UI

