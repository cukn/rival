-- ╔══════════════════════════════════════════════════════╗
-- ║        ANIHA SKIN CHANGER  v5.0                     ║
-- ║  Press K to toggle  |  Press / to chat while hidden ║
-- ╚══════════════════════════════════════════════════════╝
local Players           = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService  = game:GetService("UserInputService")
local RunService        = game:GetService("RunService")
local Lighting          = game:GetService("Lighting")
local TextChatService   = game:GetService("TextChatService")
local StarterGui        = game:GetService("StarterGui")
local player            = Players.LocalPlayer
local mouse             = player:GetMouse()

-- ═══════════════════════════════════════════════
-- SKIN LISTS
-- ═══════════════════════════════════════════════
local SkinLists = {
    ["Assault Rifle"]    = {"Default","AK-47","AUG","Tommy Gun","Boneclaw Rifle","Gingerbread AUG","AKEY-47","100K Visits","10 Billion Visits","Phoenix Rifle"},
    ["Bow"]              = {"Default","Compound Bow","Raven Bow","Dream Bow","Bat Bow","Frostbite Bow","Beloved Bow","Balloon Bow","Glorious Bow","Key Bow","Arch Bow"},
    ["Burst Rifle"]      = {"Default","Electro Burst","Aqua Burst","FAMAS","Spectral Burst","Pine Burst"},
    ["Crossbow"]         = {"Default","Pixel Crossbow","Harpoon Crossbow","Violin Crossbow","Crossbone","Frostbite Crossbow","Arch Crossbow","Glorious Crossbow"},
    ["Distortion"]       = {"Default","Plasma Distortion","Magma Distortion","Cyber Distortion","Expirement D15","Sleighstortion"},
    ["Energy Rifle"]     = {"Default","Hacker Rifle","Hydro Rifle","Void Rifle","Soul Rifle","New Years Energy Rifle"},
    ["Flamethrower"]     = {"Default","Pixel Flamethrower","Lamethrower","Glitterthrower","Jack O' Thrower","Snowblower","Keythrower","Rainbowthrower"},
    ["Grenade Launcher"] = {"Default","Swashbuckler","Uranium Launcher","Gearnade Launcher","Skull Grenade Launcher","Snowball Launcher"},
    ["Gunblade"]         = {"Default","Hyper Gunblade","Crude Gunblade","Gunsaw","Boneblade","Elf's Gunblade"},
    ["Minigun"]          = {"Default","Lasergun 3000","Pixel Minigun","Fighter Jet","Pumpkin Minigun","Wrapped Minigun"},
    ["Paintball Gun"]    = {"Default","Slime Gun","Boba Gun","Ketchup Gun","Brain Gun","Snowball Gun"},
    ["RPG"]              = {"Default","Nuke Launcher","Spaceship Launcher","Squid Launcher","Pumpkin Launcher","Firework Launcher"},
    ["Shotgun"]          = {"Default","Balloon Shotgun","Hyper Shotgun","Cactus Shotgun","Broomstick","Wrapped Shotgun"},
    ["Sniper"]           = {"Default","Pixel Sniper","Hyper Sniper","Event Horizon","Eyething Sniper","Gingerbread Sniper","Keyper","Glorious Sniper"},
    ["Daggers"]          = {"Default","Aces","Paper Planes","Shurikens","Bat Daggers","Cookies","Crystal Daggers","Keynais"},
    ["Energy Pistols"]   = {"Default","Void Pistols","Hydro Pistols","Soul Pistols","New Years Energy Pistols"},
    ["Exogun"]           = {"Default","Singularity","Raygun","Repulsor","Exogourd","Midnight Festive Exogun"},
    ["Flare Gun"]        = {"Default","Firework Gun","Dynamite Gun","Banana Flare","Vexed Flare Gun","Wrapped Flare Gun"},
    ["Handgun"]          = {"Default","Blaster","Hand Gun","Gumball Handgun","Pumpkin Handgun","Gingerbread Handgun"},
    ["Revolver"]         = {"Default","Desert Eagle","Sheriff","Peppergun","Boneclaw Revolver","Peppermint Sheriff"},
    ["Shorty"]           = {"Default","Not So Shorty","Lovely Shorty","Balloon Shorty","Demon Shorty","Wrapped Shorty"},
    ["Slingshot"]        = {"Default","Stick","Goal Post","Harp","Boneshot","Reindeer Slingshot","Lucky Horseshoe"},
    ["Spray"]            = {"Default","Lovely Spray","Nail Gun","Bottle Spray","Boneclaw Spray","Pine Spray","Key Spray"},
    ["Uzi"]              = {"Default","Water Uzi","Electro Uzi","Money Gun","Demon Uzi","Pine Uzi"},
    ["Warper"]           = {"Default","Glitter Warper","Arcane Warper","Hotel Bell","Experiment W4","Frost Warper"},
    ["Battle Axe"]       = {"Default","The Shred","Ban Axe","Cerulean Axe","Mimic Axe","Nordic Axe"},
    ["Chainsaw"]         = {"Default","Blobsaw","Handsaws","Mega Drill","Buzzsaw","Festive Buzzsaw"},
    ["Fists"]            = {"Default","Fist","Boxing Gloves","Fists of Hurt","Brass Knuckles","Festive Fists","Glorious Fists","Pumpkin Claws"},
    ["Katana"]           = {"Default","Saber","Lightning Bolt","Stellar Katana","Evil Trident","New Years Katana","Keytana","Arch Katana","Crystal Katana","Pixel Katana","Glorious Katana"},
    ["Knife"]            = {"Default","Chancla","Karambit","Balisong","Machete","Candy Cane","Keylisong","Keyrambit","Caladbolg"},
    ["Riot Shield"]      = {"Default","Door","Energy Shield","Masterpiece","Tombstone Shield","Sled"},
    ["Scythe"]           = {"Default","Scythe of Death","Anchor","Sakura Scythe","Bat Scythe","Cryo Scythe","Crystal Scythe","Keythe","Bug Net","Arch Scythe"},
    ["Trowel"]           = {"Default","Plastic Shovel","Garden Shovel","Paintbrush","Pumpkin Carver","Snow Shovel"},
    ["Flashbang"]        = {"Default","Disco Ball","Camera","Lightbulb","Skullbang","Shining Star"},
    ["Freeze Ray"]       = {"Default","Temporal Ray","Bubble Ray","Gum Ray","Spider Ray","Wrapped Freeze Ray"},
    ["Grenade"]          = {"Default","Whoopee Cushion","Water Balloon","Dynamite","Soul Grenade","Jingle Grenade"},
    ["Jump Pad"]         = {"Default","Trampoline","Bounce House","Shady Chicken Sandwich","Spider Web","Jolly Man"},
    ["Medkit"]           = {"Default","Sandwich","Laptop","Medkitty","Bucket of Candy","Milk & Cookies","Box of Chocolates","Briefcase"},
    ["Molotov"]          = {"Default","Coffee","Torch","Lava Lamp","Vexed Candle","Hot Coals","Arch Molotov"},
    ["Satchel"]          = {"Default","Advanced Satchel","Notebook Satchel","Bag O' Money","Potion Satchel","Suspicious Gift"},
    ["Smoke Grenade"]    = {"Default","Emoji Cloud","Balance","Hourglass","Eyeball","Snowglobe"},
    ["Subspace Tripmine"]= {"Default","Don't Press","Spring","DIY Tripmine","Trick or Treat","Dev In the Box","Pot O Keys"},
    ["War Horn"]         = {"Default","Trumpet","Megaphone","Air Horn","Boneclaw Horn","Mammoth Horn"},
    ["Warpstone"]        = {"Default","Cyber Warpstone","Teleport Disc","Electropunk Warpstone","Warpbone","Warpstar"},
    ["Permafrost"]       = {"Default","Snowman Permafrost","Ice Permafrost","Glorious Permafrost"},
}

-- ═══════════════════════════════════════════════
-- KILL FINISHER LIST  (per-weapon: weapon name → finisher)
-- ═══════════════════════════════════════════════
local FinisherList = {
    "Balloons","Beacon","BONK!","Boogie","Broom Ride","Chark Attack",
    "Clapped","Crushed","Darkheart","Disco Fever","Dynamite",
    "Electrocuted","Explode","Freeze","Gone Fishing","Haunted",
    "Into The Void","Jingle","Key Drop","Launched","Merry Christmas",
    "Obliterated","Party Time","Pixel Death","Pumpkin Bomb","Recalled",
    "Rocket Launch","Shattered","Spaghettified","Stomped",
    "Summoned","Teleported","Tombstone","Vortex","Wrapped Up",
}

-- Wrap list
local WrapList = {
    "None","Dark",
    ".exe wrap","A5","Black Damascus","Black Dark Wrap","Black Glass","Black Opal Wrap",
    "Blush Wrapping","Brain","Cardinal","Carpet Wrap","Cheese","Circuit","Clouds",
    "Community Wrap","Cross Wrap","Crystalliz","Damascus","Danger","Dawn",
    "Diamond","Digital Camo","Frosted","Gingerbread","Glass","Gold","Groove",
    "Hesper","Hollow Wrap","Hologram Arena","Honeycomb Wrap","Hyperdrive",
    "Ladybug","Lovely Leopard","Maganite","Mainframe Wrap","Meat Wrap",
    "Mesh","Midas Touch","Moonstone","Nauseite","Neon Lights","Nova",
    "Ocean Camo","OranGG","PB&J Wrap","Patriot","Pink Lemonade",
    "Pixel Camo","Reptile","Rift Wrap","Sensite","Slime Wrap","Spectral",
    "Starblaze","Starfall","Street Camo","Sunset","Supernova","Termination",
    "Urban Camo","Water","Watermelon","Woven",
}

-- ═══════════════════════════════════════════════
-- GLOBAL STATE
-- ═══════════════════════════════════════════════
_G.AnihaVersion = "5.0"
_G.ActiveTab    = "Skins"
_G.EquippedData = _G.EquippedData or {}
for w in pairs(SkinLists) do
    if not _G.EquippedData[w] then _G.EquippedData[w] = {Skin="Default", Wrap="None", Finisher="None"} end
end

_G.PerfSettings = _G.PerfSettings or { DamageColor = Color3.fromRGB(255,50,50) }
_G.OutlineSettings = _G.OutlineSettings or { Enabled=true, Color=Color3.fromRGB(255,80,80) }
_G.AimAssist = _G.AimAssist or { Enabled=false, Strength=0.35, Range=85, BindKey=Enum.KeyCode.V, HoldMode=false }
_G.WeaponHidden = _G.WeaponHidden or false
_G.ArmsHidden   = _G.ArmsHidden   or false
_G.HideMuzzle   = _G.HideMuzzle   or false
_G.HideBullets  = _G.HideBullets  or false
_G.HideReload   = _G.HideReload   or false
_G.HideNames    = _G.HideNames    or false
_G.HideChat     = _G.HideChat     or false

-- ═══════════════════════════════════════════════
-- SAVE / LOAD
-- ═══════════════════════════════════════════════
local SAVE_FILE = "AnihaSkinConfig.json"
local function SaveConfig()
    local ok = pcall(function()
        local data = {}
        for w, info in pairs(_G.EquippedData) do
            data[w] = {Skin=info.Skin or "Default", Wrap=info.Wrap or "None", Finisher=info.Finisher or "None"}
        end
        writefile(SAVE_FILE, game:GetService("HttpService"):JSONEncode(data))
    end)
    return ok
end
local function LoadConfig()
    local ok, res = pcall(function()
        if isfile(SAVE_FILE) then return game:GetService("HttpService"):JSONDecode(readfile(SAVE_FILE)) end
        return nil
    end)
    if ok and res then
        for w, info in pairs(res) do
            if _G.EquippedData[w] then
                _G.EquippedData[w].Skin     = info.Skin     or "Default"
                _G.EquippedData[w].Wrap     = info.Wrap     or "None"
                _G.EquippedData[w].Finisher = info.Finisher or "None"
            end
        end
        return true
    end
    return false
end
LoadConfig()
print("[+] Aniha Skin Changer v5.0 loading...")

-- ═══════════════════════════════════════════════
-- PERFORMANCE FUNCTIONS
-- ═══════════════════════════════════════════════
local function ApplyLowGraphics(on)
    pcall(function() settings().Rendering.QualityLevel = on and Enum.QualityLevel.Level01 or Enum.QualityLevel.Automatic end)
end
local function ApplyNoShadows(on)
    pcall(function()
        Lighting.GlobalShadows = not on
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then v.CastShadow = not on end
        end
    end)
end
local function ApplyNoParticles(on)
    pcall(function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then v.Enabled = not on end
        end
    end)
end
local function ApplyLowMesh(on)
    pcall(function()
        settings().Rendering.MeshPartDetailLevel = on and Enum.MeshPartDetailLevel.Level01 or Enum.MeshPartDetailLevel.Automatic
    end)
end

-- ═══════════════════════════════════════════════
-- DAMAGE COLOR  (persistent hook — won't reset)
-- ═══════════════════════════════════════════════
local function ApplyDamageColor(color)
    _G.PerfSettings.DamageColor = color
    -- disconnect old hooks first
    if _G.DamageColorConn  then _G.DamageColorConn:Disconnect()  end
    if _G.DamageColorConn2 then _G.DamageColorConn2:Disconnect() end
    pcall(function()
        local function tagLabel(v)
            if not v:IsA("TextLabel") then return end
            -- hook every future text change on this label
            if not v:GetAttribute("AnihaHooked") then
                v:SetAttribute("AnihaHooked", true)
                v:GetPropertyChangedSignal("Text"):Connect(function()
                    local tt = v.Text or ""
                    if tt:match("^%-?%d") then v.TextColor3 = _G.PerfSettings.DamageColor end
                end)
            end
            local t = v.Text or ""
            if t:match("^%-?%d") then v.TextColor3 = color end
        end
        for _, v in pairs(player.PlayerGui:GetDescendants()) do tagLabel(v) end
        _G.DamageColorConn = player.PlayerGui.DescendantAdded:Connect(function(v)
            task.defer(function() tagLabel(v) end)
        end)
        -- Also hook workspace damage numbers if they live there
        _G.DamageColorConn2 = workspace.DescendantAdded:Connect(function(v)
            task.defer(function() tagLabel(v) end)
        end)
    end)
end

-- ═══════════════════════════════════════════════
-- OUTLINE  (persistent hook — won't reset to red)
-- ═══════════════════════════════════════════════
local function ApplyOutlineSettings()
    if _G.OutlineConn  then _G.OutlineConn:Disconnect()  end
    if _G.OutlineConn2 then _G.OutlineConn2:Disconnect() end
    pcall(function()
        local function patchOutline(v)
            if v:IsA("SelectionBox") then
                v.Visible = _G.OutlineSettings.Enabled
                if _G.OutlineSettings.Enabled then
                    v.Color3          = _G.OutlineSettings.Color
                    v.LineThickness   = 0.05
                    v.SurfaceTransparency = 0.85
                    v.SurfaceColor3   = _G.OutlineSettings.Color
                end
                -- Keep overriding any game resets
                if not v:GetAttribute("AnihaOutlineHooked") then
                    v:SetAttribute("AnihaOutlineHooked", true)
                    v:GetPropertyChangedSignal("Color3"):Connect(function()
                        if _G.OutlineSettings.Enabled then
                            v.Color3        = _G.OutlineSettings.Color
                            v.SurfaceColor3 = _G.OutlineSettings.Color
                        end
                    end)
                end
            elseif v:IsA("Highlight") then
                v.Enabled = _G.OutlineSettings.Enabled
                if _G.OutlineSettings.Enabled then
                    v.OutlineColor = _G.OutlineSettings.Color
                end
                if not v:GetAttribute("AnihaOutlineHooked") then
                    v:SetAttribute("AnihaOutlineHooked", true)
                    v:GetPropertyChangedSignal("OutlineColor"):Connect(function()
                        if _G.OutlineSettings.Enabled then
                            v.OutlineColor = _G.OutlineSettings.Color
                        end
                    end)
                end
            end
        end
        for _, v in pairs(workspace:GetDescendants()) do patchOutline(v) end
        for _, v in pairs(player.PlayerGui:GetDescendants()) do patchOutline(v) end
        _G.OutlineConn  = workspace.DescendantAdded:Connect(function(v) task.defer(function() patchOutline(v) end) end)
        _G.OutlineConn2 = player.PlayerGui.DescendantAdded:Connect(function(v) task.defer(function() patchOutline(v) end) end)
    end)
end

-- ═══════════════════════════════════════════════
-- MUZZLE FLASH & VISIBLE BULLETS
-- ═══════════════════════════════════════════════
local function ApplyHideMuzzle(on)
    _G.HideMuzzle = on
    if _G.MuzzleConn then _G.MuzzleConn:Disconnect() end
    local function patchMuzzle(v)
        local n = v.Name:lower()
        if n:find("muzzle") or n:find("flash") or n:find("fire") or n:find("spark") then
            if v:IsA("ParticleEmitter") or v:IsA("PointLight") or v:IsA("SpotLight") or v:IsA("Beam") then
                if not v:GetAttribute("AnihaOrigEnabled") then
                    v:SetAttribute("AnihaOrigEnabled", v.Enabled)
                end
                v.Enabled = not on
            end
        end
    end
    pcall(function()
        local cam = workspace.CurrentCamera
        if cam then for _,v in pairs(cam:GetDescendants()) do patchMuzzle(v) end end
        local char = player.Character
        if char then for _,v in pairs(char:GetDescendants()) do patchMuzzle(v) end end
        _G.MuzzleConn = workspace.DescendantAdded:Connect(function(v)
            if _G.HideMuzzle then task.defer(function() patchMuzzle(v) end) end
        end)
    end)
end

local function ApplyHideBullets(on)
    _G.HideBullets = on
    if _G.BulletConn then _G.BulletConn:Disconnect() end
    local function patchBullet(v)
        local n = v.Name:lower()
        if n:find("bullet") or n:find("proj") or n:find("pellet") or n:find("ball") or n:find("tracer") or n:find("ray") then
            if v:IsA("BasePart") or v:IsA("MeshPart") or v:IsA("Trail") or v:IsA("Beam") then
                if v:IsA("Trail") or v:IsA("Beam") then
                    v.Enabled = not on
                else
                    v.LocalTransparencyModifier = on and 1 or 0
                end
            end
        end
    end
    pcall(function()
        for _,v in pairs(workspace:GetDescendants()) do patchBullet(v) end
        _G.BulletConn = workspace.DescendantAdded:Connect(function(v)
            if _G.HideBullets then task.defer(function() patchBullet(v) end) end
        end)
    end)
end

-- ═══════════════════════════════════════════════
-- HIDE RELOAD UI
-- ═══════════════════════════════════════════════
local function ApplyHideReload(on)
    _G.HideReload = on
    if _G.ReloadConn then _G.ReloadConn:Disconnect() end
    local function patchReload(v)
        local n = (v.Name or ""):lower()
        if n:find("reload") or n:find("ammo") or n:find("magazine") or n:find("chamber") then
            if v:IsA("Frame") or v:IsA("ImageLabel") or v:IsA("TextLabel") or v:IsA("ScreenGui") or v:IsA("BillboardGui") then
                v.Visible = not on
            end
        end
    end
    pcall(function()
        for _,v in pairs(player.PlayerGui:GetDescendants()) do patchReload(v) end
        _G.ReloadConn = player.PlayerGui.DescendantAdded:Connect(function(v)
            if _G.HideReload then task.defer(function() patchReload(v) end) end
        end)
    end)
end

-- ═══════════════════════════════════════════════
-- WEAPON VISIBILITY
-- ═══════════════════════════════════════════════
_G.WeaponHidden = false
local function ApplyHideWeapon(on)
    _G.WeaponHidden = on
    pcall(function()
        local cam = workspace.CurrentCamera
        if cam then
            for _,v in pairs(cam:GetDescendants()) do
                if (v:IsA("BasePart") or v:IsA("MeshPart")) then
                    v.LocalTransparencyModifier = on and 1 or 0
                end
            end
        end
        local char = player.Character
        if char then
            for _,tool in pairs(char:GetChildren()) do
                if tool:IsA("Tool") then
                    for _,part in pairs(tool:GetDescendants()) do
                        if part:IsA("BasePart") or part:IsA("MeshPart") then
                            part.LocalTransparencyModifier = on and 1 or 0
                        end
                    end
                end
            end
        end
    end)
end

-- ═══════════════════════════════════════════════
-- HIDE ARMS (viewmodel arms only)
-- ═══════════════════════════════════════════════
_G.ArmsHidden = false
local function ApplyHideArms(on)
    _G.ArmsHidden = on
    pcall(function()
        local cam = workspace.CurrentCamera
        if cam then
            for _,v in pairs(cam:GetDescendants()) do
                if v:IsA("BasePart") or v:IsA("MeshPart") then
                    local n = v.Name:lower()
                    if n:find("arm") or n:find("hand") or n:find("wrist") or n:find("lower") or n:find("upper") then
                        v.LocalTransparencyModifier = on and 1 or 0
                    end
                end
            end
        end
    end)
end

-- Heartbeat loop to keep hide states
RunService.Heartbeat:Connect(function()
    pcall(function()
        local char = player.Character
        local cam  = workspace.CurrentCamera
        if _G.WeaponHidden then
            if cam then
                for _,v in pairs(cam:GetDescendants()) do
                    if v:IsA("BasePart") or v:IsA("MeshPart") then v.LocalTransparencyModifier = 1 end
                end
            end
            if char then
                for _,tool in pairs(char:GetChildren()) do
                    if tool:IsA("Tool") then
                        for _,p in pairs(tool:GetDescendants()) do
                            if p:IsA("BasePart") or p:IsA("MeshPart") then p.LocalTransparencyModifier = 1 end
                        end
                    end
                end
            end
        elseif _G.ArmsHidden then
            if cam then
                for _,v in pairs(cam:GetDescendants()) do
                    if v:IsA("BasePart") or v:IsA("MeshPart") then
                        local n = v.Name:lower()
                        if n:find("arm") or n:find("hand") or n:find("wrist") or n:find("lower") or n:find("upper") then
                            v.LocalTransparencyModifier = 1
                        end
                    end
                end
            end
        end
    end)
end)

-- ═══════════════════════════════════════════════
-- HIDE NAMES
-- ═══════════════════════════════════════════════
local function ApplyHideNames(on)
    _G.HideNames = on
    if _G.HideNamesConn then _G.HideNamesConn:Disconnect() end
    local function patchChar(char)
        if not char then return end
        for _,v in pairs(char:GetDescendants()) do
            if v:IsA("BillboardGui") then v.Enabled = not on end
        end
    end
    pcall(function()
        for _,plr in pairs(Players:GetPlayers()) do
            if plr ~= player then patchChar(plr.Character) end
            plr.CharacterAdded:Connect(function(c) if _G.HideNames then patchChar(c) end end)
        end
        Players.PlayerAdded:Connect(function(plr)
            plr.CharacterAdded:Connect(function(c) if _G.HideNames then patchChar(c) end end)
        end)
        -- suppress Roblox overhead via StarterGui flag
        pcall(function() StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true) end)
    end)
end

-- ═══════════════════════════════════════════════
-- HIDE CHAT  (hides window but / still works)
-- ═══════════════════════════════════════════════
local chatHidden = false
local chatFrame  = nil   -- cached reference to chat frame

local function FindChatFrame()
    -- TextChatService new UI
    local pg = player.PlayerGui
    for _,v in pairs(pg:GetChildren()) do
        if v.Name == "TextChatGui" or v.Name == "Chat" or v.Name == "BubbleChat" or v.Name == "BubbleNotifications" then
            return v
        end
    end
    return nil
end

local function ApplyHideChat(on)
    _G.HideChat = on
    chatHidden  = on
    pcall(function()
        if not chatFrame then chatFrame = FindChatFrame() end
        if chatFrame then
            -- Hide only the display, NOT the input — we re-enable when user types /
            -- The safest approach: hide the whole frame but intercept / key
            -- Actually: just hide the message display children but keep input box alive
            for _,v in pairs(chatFrame:GetDescendants()) do
                local n = (v.Name or ""):lower()
                -- keep input-related frames visible; hide message feed
                local isInput = n:find("input") or n:find("box") or n:find("entry") or n:find("type") or n:find("field")
                if not isInput then
                    if v:IsA("Frame") or v:IsA("ScrollingFrame") or v:IsA("TextLabel") or v:IsA("ImageLabel") then
                        if v.ClassName == "TextBox" then -- always keep textboxes
                        else
                            v.Visible = not on
                        end
                    end
                end
            end
        end
        -- CoreGui approach as fallback
        if on then
            pcall(function() StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false) end)
        else
            pcall(function() StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true) end)
        end
    end)
end

-- Intercept / key: open chat input even while hidden
UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end
    if input.KeyCode == Enum.KeyCode.Slash and chatHidden then
        -- Re-show chat temporarily, focus the input box
        pcall(function()
            if not chatFrame then chatFrame = FindChatFrame() end
            -- Try TextChatService focus
            local tcs = game:GetService("TextChatService")
            if tcs and tcs.ChatVersion == Enum.ChatVersion.TextChatService then
                local channel = tcs:FindFirstChild("TextChannels")
                if channel then
                    local ch = channel:FindFirstChild("RBXGeneral") or channel:GetChildren()[1]
                    if ch and ch:IsA("TextChannel") then
                        -- focus default chat
                    end
                end
            end
            -- show the frame just for typing
            if chatFrame then chatFrame.Visible = true end
            task.delay(0.1, function()
                -- find and focus any TextBox in the chat
                if chatFrame then
                    for _,v in pairs(chatFrame:GetDescendants()) do
                        if v:IsA("TextBox") then
                            v:CaptureFocus()
                            v.FocusLost:Wait()
                            task.wait(0.05)
                            if chatHidden and chatFrame then
                                chatFrame.Visible = false
                                ApplyHideChat(true)
                            end
                            break
                        end
                    end
                end
            end)
        end)
    end
end)

-- ═══════════════════════════════════════════════
-- UNLOCK ALL SKINS VISUALLY
-- ═══════════════════════════════════════════════
local function PatchUnlockAll(CosmeticLibrary)
    pcall(function()
        if CosmeticLibrary.IsOwned then CosmeticLibrary.IsOwned = function() return true end end
        if CosmeticLibrary.HasSkin  then CosmeticLibrary.HasSkin  = function() return true end end
        if CosmeticLibrary.OwnedSkins then
            for wp, skins in pairs(SkinLists) do
                for _, sk in ipairs(skins) do
                    if not table.find(CosmeticLibrary.OwnedSkins, sk) then
                        table.insert(CosmeticLibrary.OwnedSkins, sk)
                    end
                end
            end
        end
        if CosmeticLibrary.Cosmetics then
            for _, data in pairs(CosmeticLibrary.Cosmetics) do
                if type(data) == "table" then
                    data.Locked  = false
                    data.Owned   = true
                    data.IsOwned = true
                end
            end
        end
    end)
end

-- ═══════════════════════════════════════════════
-- REVOLVER SKIN FIX
-- ═══════════════════════════════════════════════
local function FixRevolverSkin(CL)
    pcall(function()
        local sel = _G.EquippedData["Revolver"] and _G.EquippedData["Revolver"].Skin
        if sel and sel ~= "Default" then
            task.delay(0.5, function()
                pcall(function() CL.Equip("Revolver","Skin","Default") end)
                task.delay(0.2, function()
                    pcall(function() CL.Equip("Revolver","Skin",sel) end)
                end)
            end)
        end
    end)
end

-- ═══════════════════════════════════════════════
-- AIM ASSIST  v2 — upper-torso targeting, velocity
-- prediction, raw-aim-safe, bindable toggle key
-- ═══════════════════════════════════════════════

-- Tracks previous target positions for velocity prediction
local _aimPrevPos  = {}   -- [player] = Vector2 last screen pos
local _aimPrevTime = {}   -- [player] = tick()

-- How far ABOVE the HumanoidRootPart we aim (head level ≈ +2.5)
local AIM_VERTICAL_OFFSET = 1.5  -- studs above HRP center (upper chest)

-- Hold-to-aim state
local aimHoldActive = false

local aimAssistConn = nil
local function SetAimAssist(on)
    _G.AimAssist.Enabled = on
    if aimAssistConn then aimAssistConn:Disconnect() aimAssistConn = nil end
    if not on then return end

    aimAssistConn = RunService.RenderStepped:Connect(function()
        pcall(function()
            -- Respect hold mode: only run if hold key is held
            if _G.AimAssist.HoldMode and not aimHoldActive then return end
            if not _G.AimAssist.Enabled then return end

            local cam      = workspace.CurrentCamera
            local range    = _G.AimAssist.Range
            local strength = _G.AimAssist.Strength  -- 0.0–1.0
            local mx, my   = mouse.X, mouse.Y
            local vp       = cam.ViewportSize
            local now      = tick()

            local bestDist   = range
            local bestTarget = nil
            local bestPlr    = nil

            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= player and plr.Character then
                    local char = plr.Character
                    local hrp  = char:FindFirstChild("HumanoidRootPart")
                    local hum  = char:FindFirstChildOfClass("Humanoid")
                    -- Skip dead players
                    if hrp and hum and hum.Health > 0 then
                        -- Aim at upper chest / neck area, not legs
                        local aimPos = hrp.Position + Vector3.new(0, AIM_VERTICAL_OFFSET, 0)
                        local sPos, vis = cam:WorldToViewportPoint(aimPos)
                        if vis then
                            local dx = sPos.X - mx
                            local dy = sPos.Y - my
                            local dist = math.sqrt(dx*dx + dy*dy)
                            if dist < bestDist then
                                bestDist   = dist
                                bestTarget = Vector2.new(sPos.X, sPos.Y)
                                bestPlr    = plr
                            end
                        end
                    end
                end
            end

            if bestTarget and bestPlr then
                -- Velocity prediction: estimate where the target will be next frame
                local predictedTarget = bestTarget
                local prev  = _aimPrevPos[bestPlr]
                local prevT = _aimPrevTime[bestPlr]
                if prev and prevT then
                    local dt = now - prevT
                    if dt > 0 and dt < 0.2 then
                        -- screen-space velocity (px/s)
                        local vx = (bestTarget.X - prev.X) / dt
                        local vy = (bestTarget.Y - prev.Y) / dt
                        -- predict 1 frame ahead (~16ms)
                        local lookahead = 0.016
                        predictedTarget = Vector2.new(
                            bestTarget.X + vx * lookahead,
                            bestTarget.Y + vy * lookahead
                        )
                    end
                end
                _aimPrevPos[bestPlr]  = bestTarget
                _aimPrevTime[bestPlr] = now

                -- Compute desired move delta toward predicted upper-chest position
                local dx = predictedTarget.X - mx
                local dy = predictedTarget.Y - my
                local dist = math.sqrt(dx*dx + dy*dy)
                if dist < 0.5 then return end  -- already on target, don't jitter

                -- Scale: closer = less pull (natural feel), farther = stronger pull
                -- Uses a smooth curve so it feels like a real magnet, not a snap
                -- strength is 0–1, we scale to a useful pixels-per-frame nudge
                local maxNudge   = strength * 4.5         -- max pixels to move per frame
                local falloff    = math.min(1, dist / range) -- 0 when on top, 1 at edge
                local nudge      = maxNudge * falloff

                -- Only nudge if it moves us TOWARD the target (complements raw aim)
                local relX = dx / dist
                local relY = dy / dist
                local moveX = relX * nudge
                local moveY = relY * nudge

                -- Safety: don't overshoot
                if math.abs(moveX) > math.abs(dx) then moveX = dx end
                if math.abs(moveY) > math.abs(dy) then moveY = dy end

                -- Clamp to viewport
                local newX = mx + moveX
                local newY = my + moveY
                if newX < 0 or newX > vp.X or newY < 0 or newY > vp.Y then return end

                pcall(function()
                    local rel = mousemoverel or mouse_moverel
                    if rel then rel(moveX, moveY) end
                end)
            end
        end)
    end)
end

-- ── Bindable toggle key handler ───────────────
-- Reads _G.AimAssist.BindKey at runtime so GUI changes take effect immediately
local function HandleAimKey(input, processed)
    if processed then return end
    local bk = _G.AimAssist.BindKey
    if bk and input.KeyCode == bk then
        if _G.AimAssist.HoldMode then
            -- hold mode: activate while key held
            aimHoldActive = true
        else
            -- toggle mode
            _G.AimAssist.Enabled = not _G.AimAssist.Enabled
            SetAimAssist(_G.AimAssist.Enabled)
            -- sync GUI toggle visual if it exists
            if _G.AimAssist._SyncUI then _G.AimAssist._SyncUI(_G.AimAssist.Enabled) end
        end
    end
end
local function HandleAimKeyUp(input)
    if _G.AimAssist.HoldMode and _G.AimAssist.BindKey and input.KeyCode == _G.AimAssist.BindKey then
        aimHoldActive = false
    end
end
UserInputService.InputBegan:Connect(HandleAimKey)
UserInputService.InputEnded:Connect(HandleAimKeyUp)

-- ═══════════════════════════════════════════════
-- ROBUST REQUIRE
-- ═══════════════════════════════════════════════
local function robust_require(module)
    local mName = tostring(module)
    local setidentity = setthreadidentity or set_thread_identity or (syn and syn.set_thread_identity) or (getgenv and getgenv().set_thread_identity)
    local getidentity = getthreadidentity or get_thread_identity or (syn and syn.get_thread_identity) or (getgenv and getgenv().get_thread_identity)
    if shared[mName] or _G[mName] then return shared[mName] or _G[mName] end
    if getrenv and (getrenv()._G[mName] or getrenv().shared[mName]) then return getrenv()._G[mName] or getrenv().shared[mName] end
    local old_id
    pcall(function() if getidentity and setidentity then old_id = getidentity() setidentity(2) end end)
    local ok, res = pcall(require, module)
    if not ok and getgenv and getgenv().require then ok, res = pcall(getgenv().require, module) end
    pcall(function() if setidentity and old_id then setidentity(old_id) end end)
    if ok then return res end
    local getupvalues = debug.getupvalues or getupvalues
    for _, api in pairs({getgc, getregistry, debug.getregistry}) do
        if type(api) == "function" then
            local s, objs = pcall(api, true)
            if s and type(objs) == "table" then
                for _, v in pairs(objs) do
                    if type(v) == "table" then
                        if mName:find("CosmeticLibrary") and (v.Cosmetics or rawget(v,"Cosmetics")) and (type(v.Equip)=="function" or type(v.GetSkins)=="function") then return v end
                        if mName:find("ItemLibrary")     and (v.ViewModels or rawget(v,"ViewModels")) then return v end
                        if mName:find("ClientViewModel") and (v.new or rawget(v,"new")) and (v.GetWrap or rawget(v,"GetWrap")) then return v end
                        if mName:find("ReplicatedClass") and type(v.ToEnum)=="function" then return v end
                    elseif type(v) == "function" and getupvalues then
                        for _, upv in pairs(getupvalues(v)) do
                            if type(upv)=="table" then
                                if mName:find("CosmeticLibrary") and upv.Cosmetics and upv.Equip then return upv end
                                if mName:find("ItemLibrary")     and upv.ViewModels then return upv end
                            end
                        end
                    end
                end
            end
        end
    end
    warn("[!] Failed: "..mName)
    return nil
end

-- ═══════════════════════════════════════════════════════
-- MAIN TASK (requires modules then builds GUI)
-- ═══════════════════════════════════════════════════════
task.spawn(function()
    task.wait(1.5)
    local CosmeticLibrary, ItemLibrary, ReplicatedClass, ClientViewModel
    CosmeticLibrary = robust_require(ReplicatedStorage:WaitForChild("Modules",20):WaitForChild("CosmeticLibrary",20))
    ItemLibrary     = robust_require(ReplicatedStorage.Modules:WaitForChild("ItemLibrary",20))
    ReplicatedClass = robust_require(ReplicatedStorage.Modules:WaitForChild("ReplicatedClass",20))
    local Modules   = player.PlayerScripts:WaitForChild("Modules",15)
    robust_require(Modules:WaitForChild("ClientReplicatedClasses",15):WaitForChild("ClientFighter",15):WaitForChild("ClientItem",15))
    ClientViewModel = robust_require(Modules.ClientReplicatedClasses.ClientFighter.ClientItem:WaitForChild("ClientViewModel",15))

    if not CosmeticLibrary or not ItemLibrary or not ClientViewModel or not ReplicatedClass then
        warn("[!] Aniha: Core modules missing.") return
    end

    PatchUnlockAll(CosmeticLibrary)
    FixRevolverSkin(CosmeticLibrary)

    local function getCosmeticData(name, cType)
        local base = CosmeticLibrary.Cosmetics[name]
        if not base then return nil end
        local data = table.clone(base)
        data.Name    = name  data.Type = cType
        data.Locked  = false data.Owned = true data.IsOwned = true
        if name == "AKEY-47"       then data.IsMythical = true data.BundlePath = "Bundles" end
        if name:find("Gingerbread") then data.BundlePath = "Festive Skin Case" end
        if name == "Evil Trident"  then data.DisplayName = "Evil Trident" end
        return data
    end

    -- Patch GetWrap
    local oldGetWrap = ClientViewModel.GetWrap
    ClientViewModel.GetWrap = function(self)
        local ok, result = pcall(function()
            local wn = self.ClientItem and self.ClientItem.Name
            if wn and _G.EquippedData[wn] then
                local w = _G.EquippedData[wn].Wrap
                if w and w ~= "None" then return getCosmeticData(w,"Wrap") end
            end
        end)
        if ok and result then return result end
        return oldGetWrap(self)
    end

    -- Patch new (skin injection + finisher per weapon)
    local oldNew = ClientViewModel.new
    ClientViewModel.new = function(replicatedData, clientItem)
        pcall(function()
            if not clientItem then return end
            local wn = clientItem.Name
            if not wn or not _G.EquippedData[wn] then return end
            local cf = rawget(clientItem,"ClientFighter") or (pcall(function() return clientItem.ClientFighter end) and clientItem.ClientFighter)
            if not cf or cf.Player ~= player then return end
            -- Skin
            local sel = _G.EquippedData[wn].Skin
            if sel and sel ~= "Default" then
                local cos = getCosmeticData(sel,"Skin")
                if cos then
                    local dk = ReplicatedClass:ToEnum("Data")
                    local sk = ReplicatedClass:ToEnum("Skin")
                    local nk = ReplicatedClass:ToEnum("Name")
                    replicatedData[dk] = replicatedData[dk] or {}
                    replicatedData[dk][sk] = cos
                    replicatedData[dk][nk] = sel
                end
            end
            -- Finisher (per weapon)
            local fin = _G.EquippedData[wn].Finisher
            if fin and fin ~= "None" then
                pcall(function()
                    local finCos = getCosmeticData(fin,"Finisher")
                    if finCos then
                        local dk  = ReplicatedClass:ToEnum("Data")
                        local fk  = ReplicatedClass:ToEnum("Finisher")
                        replicatedData[dk] = replicatedData[dk] or {}
                        replicatedData[dk][fk] = finCos
                        -- Also try direct equip
                        CosmeticLibrary.Equip(wn,"Finisher",fin)
                    end
                end)
            end
        end)
        local vm = oldNew(replicatedData, clientItem)
        task.delay(0.1, function() pcall(function() if vm and vm._UpdateWrap then vm:_UpdateWrap() end end) end)
        pcall(function()
            if clientItem and clientItem.Name == "Revolver" then
                task.delay(0.3, function() FixRevolverSkin(CosmeticLibrary) end)
            end
        end)
        return vm
    end

    local function ApplyAllSkins()
        for w, info in pairs(_G.EquippedData) do
            if info.Skin ~= "Default"   then pcall(function() CosmeticLibrary.Equip(w,"Skin",info.Skin) end) end
            if info.Finisher ~= "None"  then pcall(function() CosmeticLibrary.Equip(w,"Finisher",info.Finisher) end) end
        end
    end

    local function GetThumb(name)
        local r = ""
        pcall(function()
            if ItemLibrary and ItemLibrary.ViewModels and ItemLibrary.ViewModels[name] then
                local d = ItemLibrary.ViewModels[name]
                r = d.ImageHighResolution or d.Image or d.Thumbnail or "" return
            end
            if CosmeticLibrary and CosmeticLibrary.Skins then
                for _, tbl in pairs(CosmeticLibrary.Skins) do
                    if tbl[name] then local d = tbl[name] r = d.ImageHighResolution or d.Image or d.Thumbnail or "" return end
                end
            end
        end)
        return r
    end

    -- ════════════════════════════════════════════
    -- COLORS
    -- ════════════════════════════════════════════
    local C = {
        BG     = Color3.fromRGB(10, 10, 14),
        PANEL  = Color3.fromRGB(16, 16, 22),
        CARD   = Color3.fromRGB(24, 24, 32),
        SEL    = Color3.fromRGB(50, 100, 210),
        EQUIP  = Color3.fromRGB(38, 155, 85),
        RED    = Color3.fromRGB(220, 50, 50),
        BLUE   = Color3.fromRGB(55, 100, 215),
        GOLD   = Color3.fromRGB(220, 170, 30),
        TEXT   = Color3.fromRGB(225, 225, 232),
        DIM    = Color3.fromRGB(110, 110, 128),
        SEP    = Color3.fromRGB(35, 35, 50),
        TOG_ON = Color3.fromRGB(38, 175, 90),
        TOG_OFF= Color3.fromRGB(38, 38, 54),
        PURPLE = Color3.fromRGB(130, 60, 220),
        CYAN   = Color3.fromRGB(30, 190, 220),
        ORANGE = Color3.fromRGB(220, 120, 30),
    }

    local function Rnd(p,r) local c=Instance.new("UICorner",p) c.CornerRadius=UDim.new(0,r or 6) end
    local function Str(p,c,t) local s=Instance.new("UIStroke",p) s.Color=c s.Thickness=t return s end
    local function Pad(p,t,b,l,r) local u=Instance.new("UIPadding",p) u.PaddingTop=UDim.new(0,t) u.PaddingBottom=UDim.new(0,b) u.PaddingLeft=UDim.new(0,l) u.PaddingRight=UDim.new(0,r) end

    -- ════════════════════════════════════════════
    -- SCREEN GUI
    -- ════════════════════════════════════════════
    local SG = Instance.new("ScreenGui", player.PlayerGui)
    SG.ResetOnSpawn = false  SG.Name = "AnihaSkinChanger"
    SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Main = Instance.new("Frame", SG)
    Main.Size = UDim2.new(0,1060,0,740)
    Main.Position = UDim2.new(0.5,-530,0.5,-370)
    Main.BackgroundColor3 = C.BG  Main.BorderSizePixel = 0
    Rnd(Main,12)  Str(Main,Color3.fromRGB(50,50,70),1.5)
    Instance.new("UIGradient",Main).Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,Color3.fromRGB(14,12,22)),
        ColorSequenceKeypoint.new(1,Color3.fromRGB(10,10,14)),
    })

    -- TITLE
    local TB = Instance.new("Frame",Main)
    TB.Size=UDim2.new(1,0,0,50) TB.BackgroundColor3=Color3.fromRGB(15,10,22) TB.BorderSizePixel=0 TB.ZIndex=5
    local TBG = Instance.new("UIGradient",TB)
    TBG.Color = ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(160,30,30)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(18,12,30)),ColorSequenceKeypoint.new(1,Color3.fromRGB(15,10,22))})
    TBG.Rotation = 90
    local TL = Instance.new("TextLabel",TB)
    TL.Size=UDim2.new(1,-150,1,0) TL.Position=UDim2.new(0,18,0,0) TL.BackgroundTransparency=1
    TL.Text="✦  ANIHA SKIN CHANGER  v5.1" TL.TextColor3=Color3.new(1,1,1)
    TL.Font=Enum.Font.GothamBlack TL.TextSize=18 TL.TextXAlignment=Enum.TextXAlignment.Left TL.ZIndex=5
    local TLSub = Instance.new("TextLabel",TB)
    TLSub.Size=UDim2.new(0,200,1,0) TLSub.Position=UDim2.new(1,-210,0,0) TLSub.BackgroundTransparency=1
    TLSub.Text="[ K ] Toggle  •  [ / ] Chat" TLSub.TextColor3=Color3.fromRGB(180,100,100)
    TLSub.Font=Enum.Font.GothamBold TLSub.TextSize=12 TLSub.TextXAlignment=Enum.TextXAlignment.Right TLSub.ZIndex=5

    -- ACCENT LINE
    local AL = Instance.new("Frame",Main)
    AL.Size=UDim2.new(1,0,0,2) AL.Position=UDim2.new(0,0,0,50) AL.BorderSizePixel=0
    Instance.new("UIGradient",AL).Color=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(220,40,40)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(160,60,220)),ColorSequenceKeypoint.new(1,Color3.fromRGB(30,120,220))})

    -- TAB BAR
    local TabBar = Instance.new("Frame",Main)
    TabBar.Size=UDim2.new(1,0,0,42) TabBar.Position=UDim2.new(0,0,0,52)
    TabBar.BackgroundColor3=Color3.fromRGB(13,13,18) TabBar.BorderSizePixel=0
    local TabLL=Instance.new("UIListLayout",TabBar) TabLL.FillDirection=Enum.FillDirection.Horizontal
    TabLL.Padding=UDim.new(0,4) TabLL.VerticalAlignment=Enum.VerticalAlignment.Center
    Pad(TabBar,5,5,10,10)

    local tabs = {}
    local function MakeTabBtn(icon,lbl,key)
        local b=Instance.new("TextButton",TabBar)
        b.Size=UDim2.new(0,140,1,0) b.BackgroundColor3=C.CARD
        b.Text=icon.."  "..lbl b.TextColor3=C.DIM
        b.Font=Enum.Font.GothamBold b.TextSize=12
        b.BorderSizePixel=0 b.AutoButtonColor=false
        Rnd(b,6) tabs[key]=b return b
    end
    local SkinsTab    = MakeTabBtn("🎨","Skins",      "Skins")
    local WrapsTab    = MakeTabBtn("🎁","Wraps",       "Wraps")
    local PerfTab     = MakeTabBtn("⚡","Performance",  "Performance")
    local FinTab      = MakeTabBtn("💀","Kill Finishers","Finishers")
    local AimTab      = MakeTabBtn("🎯","Aim Assist",   "AimAssist")

    local function SetTab(name)
        _G.ActiveTab=name
        for k,b in pairs(tabs) do
            if k==name then b.BackgroundColor3=C.RED b.TextColor3=Color3.new(1,1,1)
            else             b.BackgroundColor3=C.CARD b.TextColor3=C.DIM end
        end
    end
    SetTab("Skins")

    -- TOOLBAR
    local Toolbar=Instance.new("Frame",Main)
    Toolbar.Size=UDim2.new(1,0,0,44) Toolbar.Position=UDim2.new(0,0,1,-44)
    Toolbar.BackgroundColor3=Color3.fromRGB(13,13,18) Toolbar.BorderSizePixel=0
    local StatusLbl=Instance.new("TextLabel",Toolbar)
    StatusLbl.Size=UDim2.new(1,-312,1,0) StatusLbl.Position=UDim2.new(0,14,0,0)
    StatusLbl.BackgroundTransparency=1 StatusLbl.Text="Ready  •  v5.0"
    StatusLbl.TextColor3=C.DIM StatusLbl.Font=Enum.Font.Gotham StatusLbl.TextSize=12
    StatusLbl.TextXAlignment=Enum.TextXAlignment.Left

    local function TBtn(txt,xOff,color)
        local b=Instance.new("TextButton",Toolbar)
        b.Size=UDim2.new(0,142,0,30) b.Position=UDim2.new(1,xOff,0.5,-15)
        b.BackgroundColor3=color b.Text=txt b.TextColor3=Color3.new(1,1,1)
        b.Font=Enum.Font.GothamBold b.TextSize=13 b.BorderSizePixel=0 b.AutoButtonColor=false
        Rnd(b,6) return b
    end
    local SaveBtn=TBtn("💾  Save Config",-300,Color3.fromRGB(35,110,52))
    local LoadBtn=TBtn("📂  Load Config",-150,Color3.fromRGB(42,80,160))

    local function Flash(msg,color)
        StatusLbl.Text=msg StatusLbl.TextColor3=color or Color3.fromRGB(90,215,110)
        task.delay(3,function() StatusLbl.Text="Ready  •  v5.0" StatusLbl.TextColor3=C.DIM end)
    end
    SaveBtn.MouseButton1Click:Connect(function() if SaveConfig() then Flash("✅ Saved!",Color3.fromRGB(90,215,110)) else Flash("❌ Failed!",C.RED) end end)
    LoadBtn.MouseButton1Click:Connect(function() if LoadConfig() then Flash("✅ Loaded!",Color3.fromRGB(90,180,255)) ApplyAllSkins() else Flash("❌ No config!",C.RED) end end)

    -- CONTENT BOUNDS
    local CY     = 50+2+42
    local CH     = 740-CY-44
    local MARGIN = 8

    -- LEFT PANEL
    local LeftPanel=Instance.new("Frame",Main)
    LeftPanel.Size=UDim2.new(0,262,0,CH-MARGIN*2)
    LeftPanel.Position=UDim2.new(0,MARGIN,0,CY+MARGIN)
    LeftPanel.BackgroundColor3=C.PANEL LeftPanel.BorderSizePixel=0
    Rnd(LeftPanel,8) Str(LeftPanel,C.SEP,1)

    local SearchBox=Instance.new("TextBox",LeftPanel)
    SearchBox.Size=UDim2.new(1,-16,0,34) SearchBox.Position=UDim2.new(0,8,0,8)
    SearchBox.BackgroundColor3=C.CARD SearchBox.PlaceholderText="🔍  Search weapon..."
    SearchBox.PlaceholderColor3=C.DIM SearchBox.Text=""
    SearchBox.TextColor3=C.TEXT SearchBox.Font=Enum.Font.Gotham SearchBox.TextSize=13
    SearchBox.BorderSizePixel=0 SearchBox.ClearTextOnFocus=false
    Rnd(SearchBox,6) Str(SearchBox,C.SEP,1) Pad(SearchBox,0,0,8,8)

    local WScroll=Instance.new("ScrollingFrame",LeftPanel)
    WScroll.Size=UDim2.new(1,-16,1,-52) WScroll.Position=UDim2.new(0,8,0,50)
    WScroll.BackgroundTransparency=1 WScroll.ScrollBarThickness=3
    WScroll.ScrollBarImageColor3=C.RED WScroll.BorderSizePixel=0
    local WLayout=Instance.new("UIListLayout",WScroll)
    WLayout.Padding=UDim.new(0,4) WLayout.SortOrder=Enum.SortOrder.Name

    -- RIGHT PANEL
    local RightPanel=Instance.new("Frame",Main)
    RightPanel.Size=UDim2.new(1,-(262+MARGIN*3),0,CH-MARGIN*2)
    RightPanel.Position=UDim2.new(0,262+MARGIN*2,0,CY+MARGIN)
    RightPanel.BackgroundColor3=C.PANEL RightPanel.BorderSizePixel=0
    Rnd(RightPanel,8) Str(RightPanel,C.SEP,1)

    local SelLbl=Instance.new("TextLabel",RightPanel)
    SelLbl.Size=UDim2.new(1,-16,0,36) SelLbl.Position=UDim2.new(0,12,0,6)
    SelLbl.BackgroundTransparency=1 SelLbl.Text="Select a weapon from the left"
    SelLbl.TextColor3=C.TEXT SelLbl.Font=Enum.Font.GothamBold SelLbl.TextSize=17
    SelLbl.TextXAlignment=Enum.TextXAlignment.Left

    local Sep=Instance.new("Frame",RightPanel)
    Sep.Size=UDim2.new(1,-16,0,1) Sep.Position=UDim2.new(0,8,0,44)
    Sep.BackgroundColor3=C.SEP Sep.BorderSizePixel=0

    -- SKIN GRID
    local SkinScroll=Instance.new("ScrollingFrame",RightPanel)
    SkinScroll.Size=UDim2.new(1,-16,1,-54) SkinScroll.Position=UDim2.new(0,8,0,50)
    SkinScroll.BackgroundTransparency=1 SkinScroll.ScrollBarThickness=3
    SkinScroll.ScrollBarImageColor3=C.RED SkinScroll.BorderSizePixel=0 SkinScroll.Visible=true
    local SkinGrid=Instance.new("UIGridLayout",SkinScroll)
    SkinGrid.CellSize=UDim2.new(0,126,0,150) SkinGrid.CellPadding=UDim2.new(0,8,0,8)

    -- WRAP GRID
    local WrapScroll=Instance.new("ScrollingFrame",RightPanel)
    WrapScroll.Size=UDim2.new(1,-16,1,-54) WrapScroll.Position=UDim2.new(0,8,0,50)
    WrapScroll.BackgroundTransparency=1 WrapScroll.ScrollBarThickness=3
    WrapScroll.ScrollBarImageColor3=C.BLUE WrapScroll.BorderSizePixel=0 WrapScroll.Visible=false
    local WrapGrid=Instance.new("UIGridLayout",WrapScroll)
    WrapGrid.CellSize=UDim2.new(0,175,0,38) WrapGrid.CellPadding=UDim2.new(0,8,0,6)
    WrapGrid.SortOrder=Enum.SortOrder.LayoutOrder

    -- ════════════════════════════════════════════
    -- PERF PANEL
    -- ════════════════════════════════════════════
    local PerfScroll=Instance.new("ScrollingFrame",RightPanel)
    PerfScroll.Size=UDim2.new(1,-16,1,-54) PerfScroll.Position=UDim2.new(0,8,0,50)
    PerfScroll.BackgroundTransparency=1 PerfScroll.ScrollBarThickness=3
    PerfScroll.ScrollBarImageColor3=C.RED PerfScroll.BorderSizePixel=0 PerfScroll.Visible=false
    local PerfLL=Instance.new("UIListLayout",PerfScroll)
    PerfLL.Padding=UDim.new(0,8) PerfLL.SortOrder=Enum.SortOrder.LayoutOrder
    PerfLL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        PerfScroll.CanvasSize=UDim2.new(0,0,0,PerfLL.AbsoluteContentSize.Y+20)
    end)

    -- ════════════════════════════════════════════
    -- FINISHER PANEL  (per weapon — shows after selecting weapon from left)
    -- ════════════════════════════════════════════
    local FinScroll=Instance.new("ScrollingFrame",RightPanel)
    FinScroll.Size=UDim2.new(1,-16,1,-54) FinScroll.Position=UDim2.new(0,8,0,50)
    FinScroll.BackgroundTransparency=1 FinScroll.ScrollBarThickness=3
    FinScroll.ScrollBarImageColor3=C.RED FinScroll.BorderSizePixel=0 FinScroll.Visible=false
    local FinGrid=Instance.new("UIGridLayout",FinScroll)
    FinGrid.CellSize=UDim2.new(0,175,0,58) FinGrid.CellPadding=UDim2.new(0,8,0,8)
    FinGrid.SortOrder=Enum.SortOrder.LayoutOrder

    local function PopulateFinishers(wp)
        for _,c in pairs(FinScroll:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
        -- "None" first
        local function makeFinBtn(fin, order)
            local fb=Instance.new("TextButton")
            fb.Size=UDim2.new(0,175,0,58) fb.BorderSizePixel=0
            fb.AutoButtonColor=false fb.LayoutOrder=order fb.Text=""
            fb.BackgroundColor3 = (_G.EquippedData[wp] and _G.EquippedData[wp].Finisher==fin) and Color3.fromRGB(90,30,30) or C.CARD
            fb.Parent=FinScroll
            Rnd(fb,7) Str(fb,C.SEP,1)
            local icon=Instance.new("TextLabel",fb)
            icon.Size=UDim2.new(0,30,1,0) icon.Position=UDim2.new(0,6,0,0)
            icon.BackgroundTransparency=1 icon.TextSize=16 icon.Font=Enum.Font.GothamBold
            icon.Text = fin=="None" and "🚫" or "💀"
            local lbl=Instance.new("TextLabel",fb)
            lbl.Size=UDim2.new(1,-40,1,0) lbl.Position=UDim2.new(0,36,0,0)
            lbl.BackgroundTransparency=1 lbl.Text=fin
            lbl.TextColor3=C.TEXT lbl.Font=Enum.Font.GothamSemibold lbl.TextSize=12
            lbl.TextWrapped=true lbl.TextXAlignment=Enum.TextXAlignment.Left
            -- owned badge
            local bd=Instance.new("TextLabel",fb)
            bd.Size=UDim2.new(0,52,0,14) bd.Position=UDim2.new(1,-56,0,4)
            bd.BackgroundColor3=C.EQUIP bd.TextColor3=Color3.new(1,1,1)
            bd.Font=Enum.Font.GothamBold bd.TextSize=8 bd.Text="✓ OWNED"
            bd.BorderSizePixel=0 Rnd(bd,4)
            if fin=="None" then bd.BackgroundColor3=C.DIM bd.Text="NONE" end
            fb.MouseButton1Click:Connect(function()
                for _,c2 in pairs(FinScroll:GetChildren()) do if c2:IsA("TextButton") then c2.BackgroundColor3=C.CARD end end
                fb.BackgroundColor3=Color3.fromRGB(90,30,30)
                _G.EquippedData[wp].Finisher=fin
                if fin~="None" then pcall(function() CosmeticLibrary.Equip(wp,"Finisher",fin) end) end
                SelLbl.Text="💀  "..wp.."  —  Finisher: "..fin
                Flash("💀 "..wp.." finisher: "..fin, C.RED)
                SaveConfig()
            end)
        end
        makeFinBtn("None",0)
        for i,fin in ipairs(FinisherList) do makeFinBtn(fin,i) end
        FinScroll.CanvasSize=UDim2.new(0,0,0,FinGrid.AbsoluteContentSize.Y+12)
    end

    -- ════════════════════════════════════════════
    -- AIM ASSIST PANEL
    -- ════════════════════════════════════════════
    local AimScroll=Instance.new("ScrollingFrame",RightPanel)
    AimScroll.Size=UDim2.new(1,-16,1,-54) AimScroll.Position=UDim2.new(0,8,0,50)
    AimScroll.BackgroundTransparency=1 AimScroll.ScrollBarThickness=3
    AimScroll.ScrollBarImageColor3=C.ORANGE AimScroll.BorderSizePixel=0 AimScroll.Visible=false
    AimScroll.CanvasSize=UDim2.new(0,0,0,800)
    local AimLL=Instance.new("UIListLayout",AimScroll)
    AimLL.Padding=UDim.new(0,10) AimLL.SortOrder=Enum.SortOrder.LayoutOrder
    AimLL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        AimScroll.CanvasSize=UDim2.new(0,0,0,AimLL.AbsoluteContentSize.Y+20)
    end)

    -- Helper: section header
    local function AimHeader(txt,order,col)
        local f=Instance.new("Frame",AimScroll)
        f.Size=UDim2.new(1,-8,0,30) f.BackgroundColor3=Color3.fromRGB(22,16,10)
        f.BorderSizePixel=0 f.LayoutOrder=order Rnd(f,6)
        local ln=Instance.new("Frame",f) ln.Size=UDim2.new(0,3,0.7,0) ln.Position=UDim2.new(0,0,0.15,0)
        ln.BackgroundColor3=col or C.ORANGE ln.BorderSizePixel=0 Rnd(ln,2)
        local lb=Instance.new("TextLabel",f) lb.Size=UDim2.new(1,-14,1,0) lb.Position=UDim2.new(0,12,0,0)
        lb.BackgroundTransparency=1 lb.Text=txt lb.TextColor3=col or C.ORANGE
        lb.Font=Enum.Font.GothamBlack lb.TextSize=12 lb.TextXAlignment=Enum.TextXAlignment.Left
    end

    -- Helper: toggle row
    local function AimToggle(parent,label,desc,order,cb,accent)
        local row=Instance.new("Frame",parent)
        row.Size=UDim2.new(1,-8,0,62) row.BackgroundColor3=C.CARD
        row.BorderSizePixel=0 row.LayoutOrder=order Rnd(row,8) Str(row,C.SEP,1)
        local lb=Instance.new("TextLabel",row) lb.Size=UDim2.new(1,-82,0,26) lb.Position=UDim2.new(0,14,0,8)
        lb.BackgroundTransparency=1 lb.Text=label lb.TextColor3=C.TEXT
        lb.Font=Enum.Font.GothamBold lb.TextSize=13 lb.TextXAlignment=Enum.TextXAlignment.Left
        local sb=Instance.new("TextLabel",row) sb.Size=UDim2.new(1,-82,0,18) sb.Position=UDim2.new(0,14,0,36)
        sb.BackgroundTransparency=1 sb.Text=desc sb.TextColor3=C.DIM
        sb.Font=Enum.Font.Gotham sb.TextSize=11 sb.TextXAlignment=Enum.TextXAlignment.Left
        local bg=Instance.new("Frame",row) bg.Size=UDim2.new(0,52,0,26) bg.Position=UDim2.new(1,-64,0.5,-13)
        bg.BackgroundColor3=C.TOG_OFF bg.BorderSizePixel=0 Rnd(bg,13)
        local kn=Instance.new("Frame",bg) kn.Size=UDim2.new(0,20,0,20) kn.Position=UDim2.new(0,3,0.5,-10)
        kn.BackgroundColor3=Color3.new(1,1,1) kn.BorderSizePixel=0 Rnd(kn,10)
        local state=false
        local clk=Instance.new("TextButton",row) clk.Size=UDim2.new(1,0,1,0) clk.BackgroundTransparency=1 clk.Text="" clk.ZIndex=2
        clk.MouseButton1Click:Connect(function()
            state=not state
            bg.BackgroundColor3=state and (accent or C.TOG_ON) or C.TOG_OFF
            kn.Position=state and UDim2.new(0,29,0.5,-10) or UDim2.new(0,3,0.5,-10)
            cb(state)
        end)
        return function(s) state=s bg.BackgroundColor3=state and (accent or C.TOG_ON) or C.TOG_OFF kn.Position=state and UDim2.new(0,29,0.5,-10) or UDim2.new(0,3,0.5,-10) end
    end

    -- Helper: slider
    local function AimSlider(label,desc,order,minV,maxV,initV,cb)
        local row=Instance.new("Frame",AimScroll)
        row.Size=UDim2.new(1,-8,0,80) row.BackgroundColor3=C.CARD
        row.BorderSizePixel=0 row.LayoutOrder=order Rnd(row,8) Str(row,C.SEP,1)
        local lb=Instance.new("TextLabel",row) lb.Size=UDim2.new(1,-100,0,22) lb.Position=UDim2.new(0,14,0,6)
        lb.BackgroundTransparency=1 lb.Text=label lb.TextColor3=C.TEXT
        lb.Font=Enum.Font.GothamBold lb.TextSize=13 lb.TextXAlignment=Enum.TextXAlignment.Left
        local vl=Instance.new("TextLabel",row) vl.Size=UDim2.new(0,80,0,22) vl.Position=UDim2.new(1,-90,0,6)
        vl.BackgroundTransparency=1 vl.Text=tostring(initV) vl.TextColor3=C.ORANGE
        vl.Font=Enum.Font.GothamBold vl.TextSize=13 vl.TextXAlignment=Enum.TextXAlignment.Right
        local sb2=Instance.new("TextLabel",row) sb2.Size=UDim2.new(1,-24,0,16) sb2.Position=UDim2.new(0,12,0,30)
        sb2.BackgroundTransparency=1 sb2.Text=desc sb2.TextColor3=C.DIM
        sb2.Font=Enum.Font.Gotham sb2.TextSize=11 sb2.TextXAlignment=Enum.TextXAlignment.Left
        -- track
        local track=Instance.new("Frame",row) track.Size=UDim2.new(1,-28,0,8) track.Position=UDim2.new(0,14,0,54)
        track.BackgroundColor3=C.CARD track.BorderSizePixel=0 Rnd(track,4) Str(track,C.SEP,1)
        local fill=Instance.new("Frame",track) fill.Size=UDim2.new((initV-minV)/(maxV-minV),0,1,0)
        fill.BackgroundColor3=C.ORANGE fill.BorderSizePixel=0 Rnd(fill,4)
        local knob2=Instance.new("Frame",track) knob2.Size=UDim2.new(0,16,0,16) knob2.AnchorPoint=Vector2.new(0.5,0.5)
        knob2.Position=UDim2.new((initV-minV)/(maxV-minV),0,0.5,0)
        knob2.BackgroundColor3=Color3.new(1,1,1) knob2.BorderSizePixel=0 Rnd(knob2,8)
        local dragging2=false
        local clk2=Instance.new("TextButton",row) clk2.Size=UDim2.new(1,-28,0,28) clk2.Position=UDim2.new(0,14,0,42)
        clk2.BackgroundTransparency=1 clk2.Text="" clk2.ZIndex=3
        clk2.MouseButton1Down:Connect(function() dragging2=true end)
        clk2.MouseButton1Up:Connect(function() dragging2=false end)
        UserInputService.InputChanged:Connect(function(inp)
            if dragging2 and inp.UserInputType==Enum.UserInputType.MouseMovement then
                local abs=track.AbsolutePosition local sz=track.AbsoluteSize
                local rel=math.clamp((inp.Position.X-abs.X)/sz.X,0,1)
                local val=math.floor(minV+(maxV-minV)*rel+0.5)
                fill.Size=UDim2.new(rel,0,1,0)
                knob2.Position=UDim2.new(rel,0,0.5,0)
                vl.Text=tostring(val)
                cb(val)
            end
        end)
        UserInputService.InputEnded:Connect(function(inp)
            if inp.UserInputType==Enum.UserInputType.MouseButton1 then dragging2=false end
        end)
    end

    -- ──────────────────────────────────────────────────
    -- BUILD AIM ASSIST TAB
    -- ──────────────────────────────────────────────────
    AimHeader("🎯  AIM ASSIST  —  Upper-chest targeting",1,C.ORANGE)

    -- ── MAIN ENABLE TOGGLE + BIND KEY ROW ────────────
    local aimMainRow=Instance.new("Frame",AimScroll)
    aimMainRow.Size=UDim2.new(1,-8,0,68) aimMainRow.BackgroundColor3=C.CARD
    aimMainRow.BorderSizePixel=0 aimMainRow.LayoutOrder=2 Rnd(aimMainRow,8) Str(aimMainRow,C.SEP,1)

    -- Label
    local aTL=Instance.new("TextLabel",aimMainRow)
    aTL.Size=UDim2.new(0.55,-10,0,26) aTL.Position=UDim2.new(0,14,0,6)
    aTL.BackgroundTransparency=1 aTL.Text="Enable Aim Assist"
    aTL.TextColor3=C.TEXT aTL.Font=Enum.Font.GothamBold aTL.TextSize=13
    aTL.TextXAlignment=Enum.TextXAlignment.Left
    local aTSub=Instance.new("TextLabel",aimMainRow)
    aTSub.Size=UDim2.new(0.55,-10,0,20) aTSub.Position=UDim2.new(0,14,0,34)
    aTSub.BackgroundTransparency=1 aTSub.Text="Guides crosshair to upper chest — complements your aim"
    aTSub.TextColor3=C.DIM aTSub.Font=Enum.Font.Gotham aTSub.TextSize=10
    aTSub.TextXAlignment=Enum.TextXAlignment.Left

    -- Toggle switch (right side)
    local aTBg=Instance.new("Frame",aimMainRow) aTBg.Size=UDim2.new(0,52,0,26)
    aTBg.Position=UDim2.new(1,-64,0.5,-13) aTBg.BackgroundColor3=C.TOG_OFF
    aTBg.BorderSizePixel=0 Rnd(aTBg,13)
    local aTKn=Instance.new("Frame",aTBg) aTKn.Size=UDim2.new(0,20,0,20)
    aTKn.Position=UDim2.new(0,3,0.5,-10) aTKn.BackgroundColor3=Color3.new(1,1,1)
    aTKn.BorderSizePixel=0 Rnd(aTKn,10)
    local aTBtn=Instance.new("TextButton",aimMainRow)
    aTBtn.Size=UDim2.new(1,0,1,0) aTBtn.BackgroundTransparency=1 aTBtn.Text="" aTBtn.ZIndex=3

    -- Sync function so keybind can update this visual too
    local function SyncAimToggleUI(on)
        aTBg.BackgroundColor3=on and C.ORANGE or C.TOG_OFF
        aTKn.Position=on and UDim2.new(0,29,0.5,-10) or UDim2.new(0,3,0.5,-10)
    end
    _G.AimAssist._SyncUI = SyncAimToggleUI

    aTBtn.MouseButton1Click:Connect(function()
        _G.AimAssist.Enabled=not _G.AimAssist.Enabled
        SyncAimToggleUI(_G.AimAssist.Enabled)
        SetAimAssist(_G.AimAssist.Enabled)
        Flash(_G.AimAssist.Enabled and "🎯 Aim Assist ON" or "🎯 Aim Assist OFF", C.ORANGE)
    end)

    -- ── BIND KEY ROW ─────────────────────────────────
    AimHeader("⌨️  KEYBIND  &  MODE",3,C.CYAN)

    local bindRow=Instance.new("Frame",AimScroll)
    bindRow.Size=UDim2.new(1,-8,0,72) bindRow.BackgroundColor3=C.CARD
    bindRow.BorderSizePixel=0 bindRow.LayoutOrder=4 Rnd(bindRow,8) Str(bindRow,C.SEP,1)

    local bindLbl=Instance.new("TextLabel",bindRow)
    bindLbl.Size=UDim2.new(0.55,0,0,26) bindLbl.Position=UDim2.new(0,14,0,6)
    bindLbl.BackgroundTransparency=1 bindLbl.Text="Toggle / Hold Key"
    bindLbl.TextColor3=C.TEXT bindLbl.Font=Enum.Font.GothamBold bindLbl.TextSize=13
    bindLbl.TextXAlignment=Enum.TextXAlignment.Left
    local bindSub=Instance.new("TextLabel",bindRow)
    bindSub.Size=UDim2.new(0.55,0,0,18) bindSub.Position=UDim2.new(0,14,0,34)
    bindSub.BackgroundTransparency=1 bindSub.Text="Press the button then press any key to bind"
    bindSub.TextColor3=C.DIM bindSub.Font=Enum.Font.Gotham bindSub.TextSize=10
    bindSub.TextXAlignment=Enum.TextXAlignment.Left

    -- Bind button (shows current key)
    local bindBtn=Instance.new("TextButton",bindRow)
    bindBtn.Size=UDim2.new(0,110,0,32) bindBtn.Position=UDim2.new(1,-120,0,8)
    bindBtn.BackgroundColor3=Color3.fromRGB(38,38,58) bindBtn.BorderSizePixel=0
    bindBtn.Font=Enum.Font.GothamBold bindBtn.TextSize=13 bindBtn.TextColor3=C.CYAN
    bindBtn.Text="[ "..tostring(_G.AimAssist.BindKey):gsub("Enum.KeyCode.","").." ]"
    Rnd(bindBtn,6) Str(bindBtn,C.CYAN,1.5)

    local awaitingBind=false
    bindBtn.MouseButton1Click:Connect(function()
        if awaitingBind then return end
        awaitingBind=true
        bindBtn.Text="Press a key..."
        bindBtn.TextColor3=C.ORANGE
        Str(bindBtn,C.ORANGE,1.5)
    end)
    UserInputService.InputBegan:Connect(function(inp,proc)
        if awaitingBind and not proc and inp.UserInputType==Enum.UserInputType.Keyboard then
            awaitingBind=false
            _G.AimAssist.BindKey=inp.KeyCode
            local keyName=tostring(inp.KeyCode):gsub("Enum.KeyCode.","")
            bindBtn.Text="[ "..keyName.." ]"
            bindBtn.TextColor3=C.CYAN
            Str(bindBtn,C.CYAN,1.5)
            Flash("🎯 Aim key bound to: "..keyName, C.CYAN)
        end
    end)

    -- Hold mode sub-row
    local holdSub=Instance.new("TextLabel",bindRow)
    holdSub.Size=UDim2.new(0.55,0,0,16) holdSub.Position=UDim2.new(0,14,0,52)
    holdSub.BackgroundTransparency=1 holdSub.TextColor3=C.DIM
    holdSub.Font=Enum.Font.Gotham holdSub.TextSize=10
    holdSub.TextXAlignment=Enum.TextXAlignment.Left
    holdSub.Text="Mode:  Toggle"

    -- Hold mode toggle (small button beside bind button)
    local holdBtn=Instance.new("TextButton",bindRow)
    holdBtn.Size=UDim2.new(0,110,0,24) holdBtn.Position=UDim2.new(1,-120,0,44)
    holdBtn.BackgroundColor3=C.CARD holdBtn.BorderSizePixel=0
    holdBtn.Font=Enum.Font.GothamBold holdBtn.TextSize=11 holdBtn.TextColor3=C.DIM
    holdBtn.Text="Toggle Mode" holdBtn.AutoButtonColor=false
    Rnd(holdBtn,5) Str(holdBtn,C.SEP,1)
    holdBtn.MouseButton1Click:Connect(function()
        _G.AimAssist.HoldMode=not _G.AimAssist.HoldMode
        if _G.AimAssist.HoldMode then
            holdBtn.Text="Hold Mode" holdBtn.TextColor3=C.ORANGE
            holdBtn.BackgroundColor3=Color3.fromRGB(38,22,10)
            holdSub.Text="Mode:  Hold key to activate"
            Str(holdBtn,C.ORANGE,1)
        else
            holdBtn.Text="Toggle Mode" holdBtn.TextColor3=C.DIM
            holdBtn.BackgroundColor3=C.CARD
            holdSub.Text="Mode:  Toggle on/off"
            Str(holdBtn,C.SEP,1)
        end
    end)

    -- ── STRENGTH SLIDER ───────────────────────────────
    AimHeader("⚙️  TUNING",5,C.ORANGE)

    AimSlider("Aim Assist Strength","Higher = stronger pull per frame. Default feels natural at 4–6.",6,1,10,4,function(v)
        -- Map 1–10 → 0.05–0.85 (strong but not instant lock-on)
        _G.AimAssist.Strength = 0.05 + (v-1)*(0.80/9)
    end)

    -- ── RANGE SLIDER ─────────────────────────────────
    AimSlider("Detection Radius (px)","How close enemy must be to crosshair to get pulled. 70–110 is ideal.",7,20,200,85,function(v)
        _G.AimAssist.Range = v
    end)

    -- ── INFO CARD ─────────────────────────────────────
    AimHeader("ℹ️  HOW IT WORKS",8,C.DIM)
    local infoCard=Instance.new("Frame",AimScroll)
    infoCard.Size=UDim2.new(1,-8,0,108) infoCard.BackgroundColor3=C.CARD
    infoCard.BorderSizePixel=0 infoCard.LayoutOrder=9 Rnd(infoCard,8) Str(infoCard,C.SEP,1)
    local infoTxt=Instance.new("TextLabel",infoCard)
    infoTxt.Size=UDim2.new(1,-20,1,-10) infoTxt.Position=UDim2.new(0,10,0,5)
    infoTxt.BackgroundTransparency=1 infoTxt.TextColor3=C.DIM infoTxt.TextWrapped=true
    infoTxt.Font=Enum.Font.Gotham infoTxt.TextSize=11 infoTxt.TextXAlignment=Enum.TextXAlignment.Left
    infoTxt.Text="• Targets upper chest/torso — never drags you down to legs\n• Velocity prediction: anticipates moving targets 1 frame ahead\n• Raw-aim-safe: nudge scales with distance so if your crosshair is already close it barely moves\n• Toggle Mode: press bind key once to turn on/off\n• Hold Mode: aim assist only active while you hold the key\n• Requires executor with mousemoverel() support (Synapse, KRNL, Fluxus, etc.)"

    -- ════════════════════════════════════════════
    -- PERF TAB CONTENTS
    -- ════════════════════════════════════════════
    local function PHeader(txt,order,col)
        local f=Instance.new("Frame",PerfScroll) f.Size=UDim2.new(1,-8,0,30)
        f.BackgroundColor3=Color3.fromRGB(22,14,14) f.BorderSizePixel=0 f.LayoutOrder=order Rnd(f,6)
        local ln=Instance.new("Frame",f) ln.Size=UDim2.new(0,3,0.7,0) ln.Position=UDim2.new(0,0,0.15,0)
        ln.BackgroundColor3=col or C.RED ln.BorderSizePixel=0 Rnd(ln,2)
        local lb=Instance.new("TextLabel",f) lb.Size=UDim2.new(1,-14,1,0) lb.Position=UDim2.new(0,12,0,0)
        lb.BackgroundTransparency=1 lb.Text=txt lb.TextColor3=col or C.RED
        lb.Font=Enum.Font.GothamBlack lb.TextSize=12 lb.TextXAlignment=Enum.TextXAlignment.Left
    end

    local function PToggle(label,desc,order,callback,accent)
        local row=Instance.new("Frame",PerfScroll) row.Size=UDim2.new(1,-8,0,62)
        row.BackgroundColor3=C.CARD row.BorderSizePixel=0 row.LayoutOrder=order Rnd(row,8) Str(row,C.SEP,1)
        local lb=Instance.new("TextLabel",row) lb.Size=UDim2.new(1,-82,0,26) lb.Position=UDim2.new(0,14,0,8)
        lb.BackgroundTransparency=1 lb.Text=label lb.TextColor3=C.TEXT
        lb.Font=Enum.Font.GothamBold lb.TextSize=13 lb.TextXAlignment=Enum.TextXAlignment.Left
        local sb=Instance.new("TextLabel",row) sb.Size=UDim2.new(1,-82,0,18) sb.Position=UDim2.new(0,14,0,36)
        sb.BackgroundTransparency=1 sb.Text=desc sb.TextColor3=C.DIM
        sb.Font=Enum.Font.Gotham sb.TextSize=11 sb.TextXAlignment=Enum.TextXAlignment.Left
        local bg=Instance.new("Frame",row) bg.Size=UDim2.new(0,52,0,26) bg.Position=UDim2.new(1,-64,0.5,-13)
        bg.BackgroundColor3=C.TOG_OFF bg.BorderSizePixel=0 Rnd(bg,13)
        local kn=Instance.new("Frame",bg) kn.Size=UDim2.new(0,20,0,20) kn.Position=UDim2.new(0,3,0.5,-10)
        kn.BackgroundColor3=Color3.new(1,1,1) kn.BorderSizePixel=0 Rnd(kn,10)
        local state=false
        local clk=Instance.new("TextButton",row) clk.Size=UDim2.new(1,0,1,0) clk.BackgroundTransparency=1 clk.Text="" clk.ZIndex=2
        clk.MouseButton1Click:Connect(function()
            state=not state
            bg.BackgroundColor3=state and (accent or C.TOG_ON) or C.TOG_OFF
            kn.Position=state and UDim2.new(0,29,0.5,-10) or UDim2.new(0,3,0.5,-10)
            callback(state)
        end)
    end

    -- GRAPHICS
    PHeader("🔧  GRAPHICS OPTIMIZATIONS",1,C.RED)
    PToggle("Low Graphics Quality","Set render quality to minimum Level01",2,ApplyLowGraphics)
    PToggle("Disable Shadows","Turn off all dynamic & cast shadows",3,ApplyNoShadows)
    PToggle("Disable Particles","Remove particles, trails and beam effects",4,ApplyNoParticles)
    PToggle("Low Mesh Detail","Reduce mesh part detail level for FPS",5,ApplyLowMesh)

    -- VISIBILITY
    PHeader("👁  VISIBILITY OPTIONS",9,C.CYAN)
    PToggle("Hide Weapon (Full)","Makes your entire weapon invisible",10,ApplyHideWeapon,C.CYAN)
    PToggle("Hide Arms Only","Hides viewmodel arms, keeps weapon visible",11,ApplyHideArms,C.CYAN)
    PToggle("Hide Muzzle Flash","Removes muzzle flash & fire particles",12,ApplyHideMuzzle,C.CYAN)
    PToggle("Hide Visible Bullets","Removes bullet/projectile trails and models",13,ApplyHideBullets,C.CYAN)
    PToggle("Hide Reload Indicator","Hides the reload bar and ammo UI symbols",14,ApplyHideReload,C.CYAN)
    PToggle("Hide Player Names","Removes overhead name tags on all players",15,ApplyHideNames,C.CYAN)
    PToggle("Hide Chat Window","Hides chat display  (type / to still chat)",16,ApplyHideChat,C.CYAN)

    -- HIT OUTLINE
    PHeader("🎯  HIT OUTLINE",19,C.PURPLE)
    -- toggle
    local outlineRow=Instance.new("Frame",PerfScroll) outlineRow.Size=UDim2.new(1,-8,0,62)
    outlineRow.BackgroundColor3=C.CARD outlineRow.BorderSizePixel=0 outlineRow.LayoutOrder=20 Rnd(outlineRow,8) Str(outlineRow,C.SEP,1)
    local oLb=Instance.new("TextLabel",outlineRow) oLb.Size=UDim2.new(1,-82,0,26) oLb.Position=UDim2.new(0,14,0,8)
    oLb.BackgroundTransparency=1 oLb.Text="Enable Hit Outline" oLb.TextColor3=C.TEXT
    oLb.Font=Enum.Font.GothamBold oLb.TextSize=13 oLb.TextXAlignment=Enum.TextXAlignment.Left
    local oSb=Instance.new("TextLabel",outlineRow) oSb.Size=UDim2.new(1,-82,0,18) oSb.Position=UDim2.new(0,14,0,36)
    oSb.BackgroundTransparency=1 oSb.Text="Show/hide the outline when hitting enemies"
    oSb.TextColor3=C.DIM oSb.Font=Enum.Font.Gotham oSb.TextSize=11 oSb.TextXAlignment=Enum.TextXAlignment.Left
    local oBg=Instance.new("Frame",outlineRow) oBg.Size=UDim2.new(0,52,0,26) oBg.Position=UDim2.new(1,-64,0.5,-13)
    oBg.BackgroundColor3=C.PURPLE oBg.BorderSizePixel=0 Rnd(oBg,13) -- ON by default
    local oKn=Instance.new("Frame",oBg) oKn.Size=UDim2.new(0,20,0,20) oKn.Position=UDim2.new(0,29,0.5,-10)
    oKn.BackgroundColor3=Color3.new(1,1,1) oKn.BorderSizePixel=0 Rnd(oKn,10)
    local oBtn=Instance.new("TextButton",outlineRow) oBtn.Size=UDim2.new(1,0,1,0) oBtn.BackgroundTransparency=1 oBtn.Text="" oBtn.ZIndex=2
    local outlineOn=true
    oBtn.MouseButton1Click:Connect(function()
        outlineOn=not outlineOn
        _G.OutlineSettings.Enabled=outlineOn
        oBg.BackgroundColor3=outlineOn and C.PURPLE or C.TOG_OFF
        oKn.Position=outlineOn and UDim2.new(0,29,0.5,-10) or UDim2.new(0,3,0.5,-10)
        ApplyOutlineSettings()
        Flash(outlineOn and "🎯 Outline ON" or "🎯 Outline OFF",C.PURPLE)
    end)

    -- Outline color picker
    local oclLbl=Instance.new("TextLabel",PerfScroll) oclLbl.Size=UDim2.new(1,-8,0,20)
    oclLbl.BackgroundTransparency=1 oclLbl.Text="  Outline Color" oclLbl.TextColor3=C.PURPLE
    oclLbl.Font=Enum.Font.GothamBold oclLbl.TextSize=11 oclLbl.TextXAlignment=Enum.TextXAlignment.Left oclLbl.LayoutOrder=21
    local oclContainer=Instance.new("Frame",PerfScroll) oclContainer.Size=UDim2.new(1,-8,0,118)
    oclContainer.BackgroundColor3=C.CARD oclContainer.BorderSizePixel=0 oclContainer.LayoutOrder=22
    Rnd(oclContainer,7) Str(oclContainer,C.SEP,1) Pad(oclContainer,8,8,8,8)
    local oclGrid=Instance.new("UIGridLayout",oclContainer) oclGrid.CellSize=UDim2.new(0,88,0,34)
    oclGrid.CellPadding=UDim2.new(0,6,0,6) oclGrid.SortOrder=Enum.SortOrder.LayoutOrder
    local colorOpts2={
        {n="Red",c=Color3.fromRGB(230,55,55)},{n="Orange",c=Color3.fromRGB(240,130,30)},
        {n="Yellow",c=Color3.fromRGB(240,215,35)},{n="Lime",c=Color3.fromRGB(55,215,75)},
        {n="Cyan",c=Color3.fromRGB(45,205,225)},{n="Blue",c=Color3.fromRGB(55,115,250)},
        {n="Purple",c=Color3.fromRGB(170,55,250)},{n="Pink",c=Color3.fromRGB(250,75,175)},
        {n="White",c=Color3.fromRGB(238,238,238)},{n="Gold",c=Color3.fromRGB(248,195,35)},
        {n="Mint",c=Color3.fromRGB(55,210,160)},{n="Coral",c=Color3.fromRGB(250,100,85)},
    }
    local activeOclStroke=nil
    for i,opt in ipairs(colorOpts2) do
        local cb=Instance.new("TextButton",oclContainer)
        cb.BackgroundColor3=opt.c cb.Text=opt.n cb.TextColor3=Color3.new(1,1,1)
        cb.Font=Enum.Font.GothamBold cb.TextSize=12 cb.BorderSizePixel=0 cb.LayoutOrder=i cb.AutoButtonColor=false
        Rnd(cb,5)
        local stroke=Str(cb,Color3.new(1,1,1),0)
        cb.MouseButton1Click:Connect(function()
            if activeOclStroke then activeOclStroke.Thickness=0 end
            stroke.Thickness=2 activeOclStroke=stroke
            _G.OutlineSettings.Color=opt.c
            ApplyOutlineSettings()
            Flash("🎯 Outline: "..opt.n,opt.c)
        end)
    end

    -- DAMAGE COLOR
    PHeader("🎨  DAMAGE NUMBER COLOR",29,C.GOLD)
    local dmgContainer=Instance.new("Frame",PerfScroll) dmgContainer.Size=UDim2.new(1,-8,0,118)
    dmgContainer.BackgroundColor3=C.CARD dmgContainer.BorderSizePixel=0 dmgContainer.LayoutOrder=30
    Rnd(dmgContainer,7) Str(dmgContainer,C.SEP,1) Pad(dmgContainer,8,8,8,8)
    local dmgGrid=Instance.new("UIGridLayout",dmgContainer) dmgGrid.CellSize=UDim2.new(0,88,0,34)
    dmgGrid.CellPadding=UDim2.new(0,6,0,6) dmgGrid.SortOrder=Enum.SortOrder.LayoutOrder
    local colorOpts={
        {n="Red",c=Color3.fromRGB(230,55,55)},{n="Orange",c=Color3.fromRGB(240,130,30)},
        {n="Yellow",c=Color3.fromRGB(240,215,35)},{n="Lime",c=Color3.fromRGB(55,215,75)},
        {n="Cyan",c=Color3.fromRGB(45,205,225)},{n="Blue",c=Color3.fromRGB(55,115,250)},
        {n="Purple",c=Color3.fromRGB(170,55,250)},{n="Pink",c=Color3.fromRGB(250,75,175)},
        {n="White",c=Color3.fromRGB(238,238,238)},{n="Gold",c=Color3.fromRGB(248,195,35)},
        {n="Mint",c=Color3.fromRGB(55,210,160)},{n="Coral",c=Color3.fromRGB(250,100,85)},
    }
    local activeDmgStroke=nil
    for i,opt in ipairs(colorOpts) do
        local cb=Instance.new("TextButton",dmgContainer)
        cb.BackgroundColor3=opt.c cb.Text=opt.n cb.TextColor3=Color3.new(1,1,1)
        cb.Font=Enum.Font.GothamBold cb.TextSize=12 cb.BorderSizePixel=0 cb.LayoutOrder=i cb.AutoButtonColor=false
        Rnd(cb,5)
        local stroke=Str(cb,Color3.new(1,1,1),0)
        -- Default Red selected visual
        if opt.n=="Red" then stroke.Thickness=2 activeDmgStroke=stroke end
        cb.MouseButton1Click:Connect(function()
            if activeDmgStroke then activeDmgStroke.Thickness=0 end
            stroke.Thickness=2 activeDmgStroke=stroke
            ApplyDamageColor(opt.c)
            Flash("🎨 Damage color: "..opt.n,opt.c)
        end)
    end
    -- Apply default red on load
    ApplyDamageColor(Color3.fromRGB(230,55,55))

    -- ════════════════════════════════════════════
    -- WEAPON LIST BUILDER
    -- ════════════════════════════════════════════
    local currentWeapon=nil
    local wBtns={}

    local function PopulateSkins(wp)
        for _,c in pairs(SkinScroll:GetChildren()) do if c:IsA("ImageButton") then c:Destroy() end end
        for _,skin in ipairs(SkinLists[wp]) do
            local sb=Instance.new("ImageButton")
            sb.BackgroundColor3=(_G.EquippedData[wp] and _G.EquippedData[wp].Skin==skin) and C.EQUIP or C.CARD
            sb.Image=GetThumb(skin) sb.BorderSizePixel=0 sb.AutoButtonColor=false sb.Parent=SkinScroll
            Rnd(sb,6) Str(sb,C.SEP,1)
            local ownBd=Instance.new("TextLabel",sb) ownBd.Size=UDim2.new(0,52,0,14) ownBd.Position=UDim2.new(0,4,0,4)
            ownBd.BackgroundColor3=C.EQUIP ownBd.TextColor3=Color3.new(1,1,1)
            ownBd.Font=Enum.Font.GothamBold ownBd.TextSize=8 ownBd.Text="✓ OWNED" ownBd.BorderSizePixel=0 Rnd(ownBd,3)
            local lbl=Instance.new("TextLabel",sb) lbl.Size=UDim2.new(1,0,0,32) lbl.Position=UDim2.new(0,0,1,-32)
            lbl.BackgroundColor3=Color3.new(0,0,0) lbl.BackgroundTransparency=0.25 lbl.Text=skin
            lbl.TextColor3=C.TEXT lbl.Font=Enum.Font.GothamSemibold lbl.TextScaled=true lbl.BorderSizePixel=0
            sb.MouseButton1Click:Connect(function()
                for _,c2 in pairs(SkinScroll:GetChildren()) do if c2:IsA("ImageButton") then c2.BackgroundColor3=C.CARD end end
                sb.BackgroundColor3=C.EQUIP
                _G.EquippedData[wp].Skin=skin
                pcall(function() CosmeticLibrary.Equip(wp,"Skin",skin) end)
                SelLbl.Text="✅  "..wp.."  —  "..skin
                if wp=="Revolver" then task.delay(0.3,function() FixRevolverSkin(CosmeticLibrary) end) end
            end)
        end
        SkinScroll.CanvasSize=UDim2.new(0,0,0,SkinGrid.AbsoluteContentSize.Y+12)
    end

    local function PopulateWraps(wp)
        for _,c in pairs(WrapScroll:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
        for i,wrap in ipairs(WrapList) do
            local wb=Instance.new("TextButton")
            wb.BackgroundColor3=(_G.EquippedData[wp] and _G.EquippedData[wp].Wrap==wrap) and C.EQUIP or C.CARD
            wb.Text=wrap wb.TextColor3=C.TEXT wb.Font=Enum.Font.GothamSemibold wb.TextSize=13
            wb.BorderSizePixel=0 wb.AutoButtonColor=false wb.LayoutOrder=i wb.Parent=WrapScroll
            Rnd(wb,5) Str(wb,C.SEP,1)
            if wrap=="None" or wrap=="Dark" then Str(wb,Color3.fromRGB(180,180,200),1) end
            wb.MouseButton1Click:Connect(function()
                for _,c2 in pairs(WrapScroll:GetChildren()) do if c2:IsA("TextButton") then c2.BackgroundColor3=C.CARD end end
                wb.BackgroundColor3=C.EQUIP
                _G.EquippedData[wp].Wrap=wrap
                pcall(function() CosmeticLibrary.Equip(wp,"Wrap",wrap) end)
                SelLbl.Text="✅  "..wp.."  —  "..wrap.." (wrap)"
            end)
        end
        WrapScroll.CanvasSize=UDim2.new(0,0,0,WrapGrid.AbsoluteContentSize.Y+12)
    end

    -- ════════════════════════════════════════════
    -- REFRESH RIGHT PANEL
    -- ════════════════════════════════════════════
    local function RefreshRight()
        local tab=_G.ActiveTab
        local fullWidth = tab=="Performance" or tab=="AimAssist"
        LeftPanel.Visible = not fullWidth and tab~="Finishers"
        -- Finisher tab DOES show left panel (weapon selection needed)
        if tab=="Finishers" then LeftPanel.Visible=true end

        SkinScroll.Visible=false WrapScroll.Visible=false
        PerfScroll.Visible=false FinScroll.Visible=false AimScroll.Visible=false

        if fullWidth then
            RightPanel.Size=UDim2.new(1,-MARGIN*2,0,CH-MARGIN*2)
            RightPanel.Position=UDim2.new(0,MARGIN,0,CY+MARGIN)
            if tab=="Performance" then PerfScroll.Visible=true SelLbl.Text="⚡  Performance & Visuals" end
            if tab=="AimAssist"   then AimScroll.Visible=true  SelLbl.Text="🎯  Aim Assist" end
            return
        end

        RightPanel.Size=UDim2.new(1,-(262+MARGIN*3),0,CH-MARGIN*2)
        RightPanel.Position=UDim2.new(0,262+MARGIN*2,0,CY+MARGIN)

        if not currentWeapon then
            SelLbl.Text=tab=="Finishers" and "💀  Select a weapon to assign finisher" or "Select a weapon from the left"
            return
        end

        if tab=="Skins" then
            SkinScroll.Visible=true PopulateSkins(currentWeapon)
            SelLbl.Text=currentWeapon.."  —  Choose a Skin"
        elseif tab=="Wraps" then
            WrapScroll.Visible=true PopulateWraps(currentWeapon)
            SelLbl.Text=currentWeapon.."  —  Choose a Wrap"
        elseif tab=="Finishers" then
            FinScroll.Visible=true PopulateFinishers(currentWeapon)
            local cur=_G.EquippedData[currentWeapon] and _G.EquippedData[currentWeapon].Finisher or "None"
            SelLbl.Text="💀  "..currentWeapon.."  —  Finisher: "..cur
        end
    end

    SkinsTab.MouseButton1Click:Connect(function() SetTab("Skins")       RefreshRight() end)
    WrapsTab.MouseButton1Click:Connect(function() SetTab("Wraps")       RefreshRight() end)
    PerfTab.MouseButton1Click:Connect(function()  SetTab("Performance") RefreshRight() end)
    FinTab.MouseButton1Click:Connect(function()   SetTab("Finishers")   RefreshRight() end)
    AimTab.MouseButton1Click:Connect(function()   SetTab("AimAssist")   RefreshRight() end)

    for wp in pairs(SkinLists) do
        local btn=Instance.new("TextButton")
        btn.Size=UDim2.new(1,-4,0,46) btn.BackgroundColor3=C.CARD btn.Text=""
        btn.BorderSizePixel=0 btn.AutoButtonColor=false btn.Parent=WScroll
        Rnd(btn,6) Str(btn,C.SEP,1) wBtns[wp]=btn

        local wlbl=Instance.new("TextLabel",btn) wlbl.Size=UDim2.new(1,-64,1,0) wlbl.Position=UDim2.new(0,10,0,0)
        wlbl.BackgroundTransparency=1 wlbl.Text=wp wlbl.TextColor3=C.TEXT
        wlbl.Font=Enum.Font.GothamSemibold wlbl.TextSize=13 wlbl.TextXAlignment=Enum.TextXAlignment.Left wlbl.TextWrapped=true

        local sBadge=Instance.new("TextLabel",btn) sBadge.Size=UDim2.new(0,52,0,15) sBadge.Position=UDim2.new(1,-58,0,3)
        sBadge.BackgroundColor3=C.RED sBadge.TextColor3=Color3.new(1,1,1) sBadge.Font=Enum.Font.GothamBold
        sBadge.TextSize=9 sBadge.BorderSizePixel=0 sBadge.Visible=false Rnd(sBadge,4)
        local wBadge=Instance.new("TextLabel",btn) wBadge.Size=UDim2.new(0,52,0,15) wBadge.Position=UDim2.new(1,-58,0,19)
        wBadge.BackgroundColor3=C.BLUE wBadge.TextColor3=Color3.new(1,1,1) wBadge.Font=Enum.Font.GothamBold
        wBadge.TextSize=9 wBadge.BorderSizePixel=0 wBadge.Visible=false Rnd(wBadge,4)
        local fBadge=Instance.new("TextLabel",btn) fBadge.Size=UDim2.new(0,52,0,15) fBadge.Position=UDim2.new(1,-58,0,29)
        fBadge.BackgroundColor3=Color3.fromRGB(140,30,30) fBadge.TextColor3=Color3.new(1,1,1) fBadge.Font=Enum.Font.GothamBold
        fBadge.TextSize=9 fBadge.BorderSizePixel=0 fBadge.Visible=false Rnd(fBadge,4)

        local function RefreshBadges()
            local d=_G.EquippedData[wp]
            local s=d and d.Skin or "Default"
            local w=d and d.Wrap or "None"
            local f=d and d.Finisher or "None"
            sBadge.Visible=s~="Default" if sBadge.Visible then sBadge.Text=s:sub(1,7) end
            wBadge.Visible=w~="None"    if wBadge.Visible then wBadge.Text=w:sub(1,7) end
            fBadge.Visible=f~="None"    if fBadge.Visible then fBadge.Text="💀"..f:sub(1,4) end
        end
        RefreshBadges()
        btn.MouseButton1Click:Connect(function()
            currentWeapon=wp
            for _,b in pairs(wBtns) do b.BackgroundColor3=C.CARD end
            btn.BackgroundColor3=C.SEL
            RefreshRight() RefreshBadges()
        end)
    end
    WScroll.CanvasSize=UDim2.new(0,0,0,WLayout.AbsoluteContentSize.Y+8)

    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local t=SearchBox.Text:lower()
        for wp,b in pairs(wBtns) do b.Visible=t=="" or wp:lower():find(t,1,true) end
    end)

    -- DRAG
    do
        local dragging,dStart,sPos
        TB.Active=true
        TB.InputBegan:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=true dStart=i.Position sPos=Main.Position end
        end)
        TB.InputEnded:Connect(function(i)
            if i.UserInputType==Enum.UserInputType.MouseButton1 then dragging=false end
        end)
        UserInputService.InputChanged:Connect(function(i)
            if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then
                local d=i.Position-dStart
                Main.Position=UDim2.new(sPos.X.Scale,sPos.X.Offset+d.X,sPos.Y.Scale,sPos.Y.Offset+d.Y)
            end
        end)
    end

    -- TOGGLE KEY
    UserInputService.InputBegan:Connect(function(i,g)
        if not g and i.KeyCode==Enum.KeyCode.K then
            Main.Visible=not Main.Visible
            if not Main.Visible then pcall(function() SearchBox:ReleaseFocus() end) end
        end
    end)

    -- Initial damage color
    task.delay(2, function() ApplyDamageColor(Color3.fromRGB(230,55,55)) end)
    -- Initial outline hook
    task.delay(2, function() ApplyOutlineSettings() end)

    print("[+] Aniha Skin Changer v5.0 ready! Press K to toggle.")
end)
