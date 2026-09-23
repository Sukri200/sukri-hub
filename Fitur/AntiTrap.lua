-- ==================================================
-- FILE: Features/AntiTrap.lua
-- ==================================================
local AntiTrap = {}

local AntiTrapEnabled = false
local storedTraps = {} 

local function HideAndStoreDebris()
    local Folder = workspace:FindFirstChild("__DEBRIS")
    if not Folder then return end

    for _, child in ipairs(Folder:GetChildren()) do
        pcall(function()
            child.Parent = nil 
            table.insert(storedTraps, child)
        end)
    end
end

function AntiTrap.Enable()
    if AntiTrapEnabled then return end
    AntiTrapEnabled = true

    HideAndStoreDebris()

    task.spawn(function()
        while AntiTrapEnabled do
            task.wait(1)
            if AntiTrapEnabled then
                HideAndStoreDebris()
            end
        end
    end)
end

function AntiTrap.Disable()
    AntiTrapEnabled = false
    local Folder = workspace:FindFirstChild("__DEBRIS")
    if Folder then
        for _, child in ipairs(storedTraps) do
            pcall(function()
                if child and child.Parent == nil then
                    child.Parent = Folder
                end
            end)
        end
    end
    storedTraps = {}
end

-- Fungsi Toggle akan mengembalikan nilai true/false untuk dibaca oleh UI
function AntiTrap.Toggle()
    if AntiTrapEnabled then
        AntiTrap.Disable()
    else
        AntiTrap.Enable()
    end
    return AntiTrapEnabled 
end

return AntiTrap

