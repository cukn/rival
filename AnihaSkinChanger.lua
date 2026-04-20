local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local player = Players.LocalPlayer

-- ═══════════════════════════════════════════════
-- SKIN LISTS
-- ═══════════════════════════════════════════════
local SkinLists = {
    ["Assault Rifle"] = {"Default", "AK-47", "AUG", "Tommy Gun", "Boneclaw Rifle", "Gingerbread AUG", "AKEY-47", "100K Visits", "10 Billion Visits", "Phoenix Rifle"},
    ["Bow"] = {"Default", "Compound Bow", "Raven Bow", "Dream Bow", "Bat Bow", "Frostbite Bow", "Beloved Bow", "Balloon Bow", "Glorious Bow", "Key Bow", "Arch Bow"},
    ["Burst Rifle"] = {"Default", "Electro Burst", "Aqua Burst", "FAMAS", "Spectral Burst", "Pine Burst"},
    ["Crossbow"] = {"Default", "Pixel Crossbow", "Harpoon Crossbow", "Violin Crossbow", "Crossbone", "Frostbite Crossbow", "Arch Crossbow", "Glorious Crossbow"},
    ["Distortion"] = {"Default", "Plasma Distortion", "Magma Distortion", "Cyber Distortion", "Expirement D15", "Sleighstortion"},
    ["Energy Rifle"] = {"Default", "Hacker Rifle", "Hydro Rifle", "Void Rifle", "Soul Rifle", "New Years Energy Rifle"},
    ["Flamethrower"] = {"Default", "Pixel Flamethrower", "Lamethrower", "Glitterthrower", "Jack O' Thrower", "Snowblower", "Keythrower", "Rainbowthrower"},
    ["Grenade Launcher"] = {"Default", "Swashbuckler", "Uranium Launcher", "Gearnade Launcher", "Skull Grenade Launcher", "Snowball Launcher"},
    ["Gunblade"] = {"Default", "Hyper Gunblade", "Crude Gunblade", "Gunsaw", "Boneblade", "Elf's Gunblade"},
    ["Minigun"] = {"Default", "Lasergun 3000", "Pixel Minigun", "Fighter Jet", "Pumpkin Minigun", "Wrapped Minigun"},
    ["Paintball Gun"] = {"Default", "Slime Gun", "Boba Gun", "Ketchup Gun", "Brain Gun", "Snowball Gun"},
    ["RPG"] = {"Default", "Nuke Launcher", "Spaceship Launcher", "Squid Launcher", "Pumpkin Launcher", "Firework Launcher"},
    ["Shotgun"] = {"Default", "Balloon Shotgun", "Hyper Shotgun", "Cactus Shotgun", "Broomstick", "Wrapped Shotgun"},
    ["Sniper"] = {"Default", "Pixel Sniper", "Hyper Sniper", "Event Horizon", "Eyething Sniper", "Gingerbread Sniper", "Keyper", "Glorious Sniper"},
    ["Daggers"] = {"Default", "Aces", "Paper Planes", "Shurikens", "Bat Daggers", "Cookies", "Crystal Daggers", "Keynais"},
    ["Energy Pistols"] = {"Default", "Void Pistols", "Hydro Pistols", "Soul Pistols", "New Years Energy Pistols"},
    ["Exogun"] = {"Default", "Singularity", "Raygun", "Repulsor", "Exogourd", "Midnight Festive Exogun"},
    ["Flare Gun"] = {"Default", "Firework Gun", "Dynamite Gun", "Banana Flare", "Vexed Flare Gun", "Wrapped Flare Gun"},
    ["Handgun"] = {"Default", "Blaster", "Hand Gun", "Gumball Handgun", "Pumpkin Handgun", "Gingerbread Handgun"},
    ["Revolver"] = {"Default", "Desert Eagle", "Sheriff", "Peppergun", "Boneclaw Revolver", "Peppermint Sheriff"},
    ["Shorty"] = {"Default", "Not So Shorty", "Lovely Shorty", "Balloon Shorty", "Demon Shorty", "Wrapped Shorty"},
    ["Slingshot"] = {"Default", "Stick", "Goal Post", "Harp", "Boneshot", "Reindeer Slingshot", "Lucky Horseshoe"},
    ["Spray"] = {"Default", "Lovely Spray", "Nail Gun", "Bottle Spray", "Boneclaw Spray", "Pine Spray", "Key Spray"},
    ["Uzi"] = {"Default", "Water Uzi", "Electro Uzi", "Money Gun", "Demon Uzi", "Pine Uzi"},
    ["Warper"] = {"Default", "Glitter Warper", "Arcane Warper", "Hotel Bell", "Experiment W4", "Frost Warper"},
    ["Battle Axe"] = {"Default", "The Shred", "Ban Axe", "Cerulean Axe", "Mimic Axe", "Nordic Axe"},
    ["Chainsaw"] = {"Default", "Blobsaw", "Handsaws", "Mega Drill", "Buzzsaw", "Festive Buzzsaw"},
    ["Fists"] = {"Default", "Fist", "Boxing Gloves", "Fists of Hurt", "Brass Knuckles", "Festive Fists", "Glorious Fists", "Pumpkin Claws"},
    ["Katana"] = {"Default", "Saber", "Lightning Bolt", "Stellar Katana", "Evil Trident", "New Years Katana", "Keytana", "Arch Katana", "Crystal Katana", "Pixel Katana", "Glorious Katana"},
    ["Knife"] = {"Default", "Chancla", "Karambit", "Balisong", "Machete", "Candy Cane", "Keylisong", "Keyrambit", "Caladbolg"},
    ["Riot Shield"] = {"Default", "Door", "Energy Shield", "Masterpiece", "Tombstone Shield", "Sled"},
    ["Scythe"] = {"Default", "Scythe of Death", "Anchor", "Sakura Scythe", "Bat Scythe", "Cryo Scythe", "Crystal Scythe", "Keythe", "Bug Net", "Arch Scythe"},
    ["Trowel"] = {"Default", "Plastic Shovel", "Garden Shovel", "Paintbrush", "Pumpkin Carver", "Snow Shovel"},
    ["Flashbang"] = {"Default", "Disco Ball", "Camera", "Lightbulb", "Skullbang", "Shining Star"},
    ["Freeze Ray"] = {"Default", "Temporal Ray", "Bubble Ray", "Gum Ray", "Spider Ray", "Wrapped Freeze Ray"},
    ["Grenade"] = {"Default", "Whoopee Cushion", "Water Balloon", "Dynamite", "Soul Grenade", "Jingle Grenade"},
    ["Jump Pad"] = {"Default", "Trampoline", "Bounce House", "Shady Chicken Sandwich", "Spider Web", "Jolly Man"},
    ["Medkit"] = {"Default", "Sandwich", "Laptop", "Medkitty", "Bucket of Candy", "Milk & Cookies", "Box of Chocolates", "Briefcase"},
    ["Molotov"] = {"Default", "Coffee", "Torch", "Lava Lamp", "Vexed Candle", "Hot Coals", "Arch Molotov"},
    ["Satchel"] = {"Default", "Advanced Satchel", "Notebook Satchel", "Bag O' Money", "Potion Satchel", "Suspicious Gift"},
    ["Smoke Grenade"] = {"Default", "Emoji Cloud", "Balance", "Hourglass", "Eyeball", "Snowglobe"},
    ["Subspace Tripmine"] = {"Default", "Don't Press", "Spring", "DIY Tripmine", "Trick or Treat", "Dev In the Box", "Pot O Keys"},
    ["War Horn"] = {"Default", "Trumpet", "Megaphone", "Air Horn", "Boneclaw Horn", "Mammoth Horn"},
    ["Warpstone"] = {"Default", "Cyber Warpstone", "Teleport Disc", "Electropunk Warpstone", "Warpbone", "Warpstar"},
    ["Permafrost"] = {"Default", "Snowman Permafrost", "Ice Permafrost", "Glorious Permafrost"},
}

-- ═══════════════════════════════════════════════
-- KILL FINISHER LIST
-- ═══════════════════════════════════════════════
local FinisherList = {
    "Balloons", "Beacon", "BONK!", "Boogie", "Broom Ride", "Chark Attack",
    "Clapped", "Crushed", "Darkheart", "Disco Fever", "Dynamite",
    "Electrocuted", "Explode", "Freeze", "Gone Fishing", "Haunted",
    "Into The Void", "Jingle", "Key Drop", "Launched", "Merry Christmas",
    "Obliterated", "Party Time", "Pixel Death", "Pumpkin Bomb", "Recalled",
    "Rocket Launch", "Shattered", "Spaghettified", "Stomped",
    "Summoned", "Teleported", "Tombstone", "Vortex", "Wrapped Up",
}

-- Sorted wrap list: None + Dark pinned first, rest alphabetical
local WrapList = {
    "None", "Dark",
    ".exe wrap", "A5", "Black Damascus", "Black Dark Wrap", "Black Glass", "Black Opal Wrap",
    "Blush Wrapping", "Brain", "Cardinal", "Carpet Wrap", "Cheese", "Circuit", "Clouds",
    "Community Wrap", "Cross Wrap", "Crystalliz", "Damascus", "Danger", "Dawn",
    "Diamond", "Digital Camo", "Frosted", "Gingerbread", "Glass", "Gold", "Groove",
    "Hesper", "Hollow Wrap", "Hologram Arena", "Honeycomb Wrap", "Hyperdrive",
    "Ladybug", "Lovely Leopard", "Maganite", "Mainframe Wrap", "Meat Wrap",
    "Mesh", "Midas Touch", "Moonstone", "Nauseite", "Neon Lights", "Nova",
    "Ocean Camo", "OranGG", "PB&J Wrap", "Patriot", "Pink Lemonade",
    "Pixel Camo", "Reptile", "Rift Wrap", "Sensite", "Slime Wrap", "Spectral",
    "Starblaze", "Starfall", "Street Camo", "Sunset", "Supernova", "Termination",
    "Urban Camo", "Water", "Watermelon", "Woven",
}

-- ═══════════════════════════════════════════════
-- PERFORMANCE STATE
-- ═══════════════════════════════════════════════
_G.PerfSettings = _G.PerfSettings or {
    DamageColor = Color3.fromRGB(255, 50, 50),
}

-- ═══════════════════════════════════════════════
-- SAVE / LOAD CONFIG
-- ═══════════════════════════════════════════════
local SAVE_FILE = "AnihaSkinConfig.json"

local function SaveConfig()
    local ok = pcall(function()
        local data = {}
        for w, info in pairs(_G.EquippedData) do
            data[w] = {Skin = info.Skin or "Default", Wrap = info.Wrap or "None"}
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
                _G.EquippedData[w].Skin = info.Skin or "Default"
                _G.EquippedData[w].Wrap = info.Wrap or "None"
            end
        end
        return true
    end
    return false
end

-- ═══════════════════════════════════════════════
-- GLOBAL STATE
-- ═══════════════════════════════════════════════
_G.ActiveTab = "Skins"
_G.Telemetry = {}
_G.EquippedData = _G.EquippedData or {}
for w in pairs(SkinLists) do
    if not _G.EquippedData[w] then _G.EquippedData[w] = {Skin = "Default", Wrap = "None"} end
end
LoadConfig()
print("[+] Aniha Skin Changer v4.0 starting...")
_G.AnihaVersion = "4.0"

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

local function ApplyDamageColor(color)
    _G.PerfSettings.DamageColor = color
    pcall(function()
        local function tag(v)
            if v:IsA("TextLabel") then
                local t = v.Text or ""
                if t:match("^%-?%d") then v.TextColor3 = color end
                v:GetPropertyChangedSignal("Text"):Connect(function()
                    local tt = v.Text or ""
                    if tt:match("^%-?%d") then v.TextColor3 = _G.PerfSettings.DamageColor end
                end)
            end
        end
        for _, v in pairs(player.PlayerGui:GetDescendants()) do tag(v) end
        if _G.DamageColorConn then _G.DamageColorConn:Disconnect() end
        _G.DamageColorConn = player.PlayerGui.DescendantAdded:Connect(function(v)
            task.defer(function() tag(v) end)
        end)
    end)
end

-- ═══════════════════════════════════════════════
-- HIDE NAMES & CHAT
-- ═══════════════════════════════════════════════
local function ApplyHideNames(on)
    pcall(function()
        -- Hide overhead name billboards
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= player then
                local char = plr.Character
                if char then
                    for _, v in pairs(char:GetDescendants()) do
                        if v:IsA("BillboardGui") then v.Enabled = not on end
                        if v:IsA("TextLabel") and v.Parent:IsA("BillboardGui") then v.Visible = not on end
                    end
                end
            end
        end
        -- Also hide via PlayerGui overhead labels if present
        local pg = player.PlayerGui
        for _, v in pairs(pg:GetDescendants()) do
            if v.Name == "NameGui" or v.Name == "HealthGui" or v.Name == "PlayerLabel" then
                v.Enabled = not on
            end
        end
    end)
end

local function ApplyHideChat(on)
    pcall(function()
        local pg = player.PlayerGui
        -- Hide the main chat window (BubbleChat / TextChatGui)
        for _, v in pairs(pg:GetChildren()) do
            if v.Name == "BubbleNotifications" or v.Name == "Chat" or v.Name == "TextChatGui" then
                v.Enabled = not on
            end
        end
    end)
end

-- ═══════════════════════════════════════════════
-- WEAPON VISIBILITY (hide viewmodel)
-- ═══════════════════════════════════════════════
_G.WeaponHidden = _G.WeaponHidden or false
local function ApplyHideWeapon(on)
    _G.WeaponHidden = on
    pcall(function()
        -- Try to find the local viewmodel camera container
        local cam = workspace.CurrentCamera
        if cam then
            for _, v in pairs(cam:GetDescendants()) do
                if v:IsA("BasePart") or v:IsA("MeshPart") or v:IsA("SpecialMesh") then
                    v.LocalTransparencyModifier = on and 1 or 0
                end
            end
        end
        -- Also scan workspace for the local character's equipped tool model
        local char = player.Character
        if char then
            for _, tool in pairs(char:GetChildren()) do
                if tool:IsA("Tool") then
                    for _, part in pairs(tool:GetDescendants()) do
                        if part:IsA("BasePart") or part:IsA("MeshPart") then
                            part.LocalTransparencyModifier = on and 1 or 0
                        end
                    end
                end
            end
        end
    end)
end

-- Keep weapon hidden state in sync when weapon changes
RunService.Heartbeat:Connect(function()
    if not _G.WeaponHidden then return end
    pcall(function()
        local char = player.Character
        if char then
            for _, tool in pairs(char:GetChildren()) do
                if tool:IsA("Tool") then
                    for _, part in pairs(tool:GetDescendants()) do
                        if part:IsA("BasePart") or part:IsA("MeshPart") then
                            part.LocalTransparencyModifier = 1
                        end
                    end
                end
            end
        end
        local cam = workspace.CurrentCamera
        if cam then
            for _, v in pairs(cam:GetDescendants()) do
                if v:IsA("BasePart") or v:IsA("MeshPart") then
                    v.LocalTransparencyModifier = 1
                end
            end
        end
    end)
end)

-- ═══════════════════════════════════════════════
-- HIT OUTLINE
-- ═══════════════════════════════════════════════
_G.OutlineSettings = _G.OutlineSettings or {
    Enabled = true,
    Color = Color3.fromRGB(255, 80, 80),
}

local function ApplyOutlineSettings()
    pcall(function()
        -- Scan for SelectionBox or highlight objects used for hit outlines in PlayerGui/workspace
        local function patchOutline(v)
            if v:IsA("SelectionBox") then
                v.Visible = _G.OutlineSettings.Enabled
                if _G.OutlineSettings.Enabled then
                    v.Color3 = _G.OutlineSettings.Color
                    v.LineThickness = 0.05
                    v.SurfaceTransparency = 0.85
                    v.SurfaceColor3 = _G.OutlineSettings.Color
                end
            elseif v:IsA("Highlight") then
                v.Enabled = _G.OutlineSettings.Enabled
                if _G.OutlineSettings.Enabled then
                    v.OutlineColor = _G.OutlineSettings.Color
                end
            end
        end
        for _, v in pairs(workspace:GetDescendants()) do patchOutline(v) end
        for _, v in pairs(player.PlayerGui:GetDescendants()) do patchOutline(v) end
        if _G.OutlineConn then _G.OutlineConn:Disconnect() end
        _G.OutlineConn = workspace.DescendantAdded:Connect(function(v)
            task.defer(function() patchOutline(v) end)
        end)
    end)
end

-- ═══════════════════════════════════════════════
-- UNLOCK ALL SKINS VISUALLY
-- (patches CosmeticLibrary.IsOwned / HasSkin if present)
-- ═══════════════════════════════════════════════
local function PatchUnlockAll(CosmeticLibrary)
    pcall(function()
        if CosmeticLibrary.IsOwned then
            CosmeticLibrary.IsOwned = function() return true end
        end
        if CosmeticLibrary.HasSkin then
            CosmeticLibrary.HasSkin = function() return true end
        end
        if CosmeticLibrary.OwnedSkins then
            -- inject all skins into owned list
            for wp, skins in pairs(SkinLists) do
                for _, sk in ipairs(skins) do
                    if not table.find(CosmeticLibrary.OwnedSkins, sk) then
                        table.insert(CosmeticLibrary.OwnedSkins, sk)
                    end
                end
            end
        end
        -- Patch any Locked flags in cosmetics table
        if CosmeticLibrary.Cosmetics then
            for _, data in pairs(CosmeticLibrary.Cosmetics) do
                if type(data) == "table" then
                    data.Locked = false
                    data.Owned = true
                    data.IsOwned = true
                end
            end
        end
    end)
end

-- ═══════════════════════════════════════════════
-- REVOLVER SKIN FIX
-- Forces the skin to reload properly on a delay
-- ═══════════════════════════════════════════════
local function FixRevolverSkin(CosmeticLibrary)
    pcall(function()
        local sel = _G.EquippedData["Revolver"] and _G.EquippedData["Revolver"].Skin
        if sel and sel ~= "Default" then
            task.delay(0.5, function()
                pcall(function() CosmeticLibrary.Equip("Revolver","Skin","Default") end)
                task.delay(0.2, function()
                    pcall(function() CosmeticLibrary.Equip("Revolver","Skin",sel) end)
                end)
            end)
        end
    end)
end

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
                        if mName:find("ItemLibrary") and (v.ViewModels or rawget(v,"ViewModels")) then return v end
                        if mName:find("ClientViewModel") and (v.new or rawget(v,"new")) and (v.GetWrap or rawget(v,"GetWrap")) then return v end
                        if mName:find("ReplicatedClass") and type(v.ToEnum)=="function" then return v end
                    elseif type(v) == "function" and getupvalues then
                        for _, upv in pairs(getupvalues(v)) do
                            if type(upv)=="table" then
                                if mName:find("CosmeticLibrary") and upv.Cosmetics and upv.Equip then return upv end
                                if mName:find("ItemLibrary") and upv.ViewModels then return upv end
                            end
                        end
                    end
                end
            end
        end
    end
    warn("[!] Failed: " .. mName)
    return nil
end

task.spawn(function()
    task.wait(1.5)
    CosmeticLibrary = robust_require(ReplicatedStorage:WaitForChild("Modules",20):WaitForChild("CosmeticLibrary",20))
    ItemLibrary     = robust_require(ReplicatedStorage.Modules:WaitForChild("ItemLibrary",20))
    ReplicatedClass = robust_require(ReplicatedStorage.Modules:WaitForChild("ReplicatedClass",20))
    local Modules   = player.PlayerScripts:WaitForChild("Modules",15)
    robust_require(Modules:WaitForChild("ClientReplicatedClasses",15):WaitForChild("ClientFighter",15):WaitForChild("ClientItem",15))
    ClientViewModel = robust_require(Modules.ClientReplicatedClasses.ClientFighter.ClientItem:WaitForChild("ClientViewModel",15))

    if not CosmeticLibrary or not ItemLibrary or not ClientViewModel or not ReplicatedClass then
        warn("[!] Aniha: Core modules missing.") return
    end

    -- Patch unlock all skins visually
    PatchUnlockAll(CosmeticLibrary)

    -- Fix revolver skin on load
    FixRevolverSkin(CosmeticLibrary)

    local function getCosmeticData(name, cType)
        local base = CosmeticLibrary.Cosmetics[name]
        if not base then return nil end
        local data = table.clone(base)
        data.Name = name data.Type = cType
        data.Locked = false
        data.Owned = true
        data.IsOwned = true
        if name == "AKEY-47" then data.IsMythical = true data.BundlePath = "Bundles"
        elseif name:find("Gingerbread") then data.BundlePath = "Festive Skin Case"
        elseif name == "Evil Trident" then data.DisplayName = "Evil Trident" end
        -- Revolver fix: ensure correct item name matching
        if name == "Revolver" or name == "Desert Eagle" or name == "Sheriff" or name == "Peppergun" or name == "Boneclaw Revolver" or name == "Peppermint Sheriff" then
            data._RevolverFix = true
            data.ItemName = "Revolver"
        end
        return data
    end

    local oldGetWrap = ClientViewModel.GetWrap
    ClientViewModel.GetWrap = function(self)
        local ok, result = pcall(function()
            local wn = self.ClientItem and self.ClientItem.Name
            if wn and _G.EquippedData[wn] then
                local w = _G.EquippedData[wn].Wrap
                if w and w ~= "None" then return getCosmeticData(w, "Wrap") end
            end
        end)
        if ok and result then return result end
        return oldGetWrap(self)
    end

    local oldNew = ClientViewModel.new
    ClientViewModel.new = function(replicatedData, clientItem)
        pcall(function()
            if not clientItem then return end
            local wn = clientItem.Name
            if not wn or not _G.EquippedData[wn] then return end
            local cf = rawget(clientItem,"ClientFighter") or (pcall(function() return clientItem.ClientFighter end) and clientItem.ClientFighter)
            if not cf or cf.Player ~= player then return end
            local sel = _G.EquippedData[wn].Skin
            if not sel or sel == "Default" then return end
            local cos = getCosmeticData(sel, "Skin")
            if not cos then return end
            local dk = ReplicatedClass:ToEnum("Data")
            local sk = ReplicatedClass:ToEnum("Skin")
            local nk = ReplicatedClass:ToEnum("Name")
            replicatedData[dk] = replicatedData[dk] or {}
            replicatedData[dk][sk] = cos
            replicatedData[dk][nk] = sel
        end)
        local vm = oldNew(replicatedData, clientItem)
        task.delay(0.1, function() pcall(function() if vm and vm._UpdateWrap then vm:_UpdateWrap() end end) end)
        -- Revolver: extra delay re-equip to fix display bug
        pcall(function()
            if clientItem and clientItem.Name == "Revolver" then
                task.delay(0.3, function() FixRevolverSkin(CosmeticLibrary) end)
            end
        end)
        return vm
    end

    local function ApplyAllSkins()
        for w, info in pairs(_G.EquippedData) do
            if info.Skin ~= "Default" then pcall(function() CosmeticLibrary.Equip(w,"Skin",info.Skin) end) end
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

    -- ═══════════════════════════════════════════════
    -- COLOR CONSTANTS
    -- ═══════════════════════════════════════════════
    local C = {
        BG       = Color3.fromRGB(10, 10, 14),
        PANEL    = Color3.fromRGB(16, 16, 22),
        CARD     = Color3.fromRGB(24, 24, 32),
        CARD2    = Color3.fromRGB(30, 30, 42),
        SEL      = Color3.fromRGB(50, 100, 210),
        EQUIP    = Color3.fromRGB(38, 155, 85),
        RED      = Color3.fromRGB(220, 50, 50),
        RED2     = Color3.fromRGB(180, 35, 35),
        BLUE     = Color3.fromRGB(55, 100, 215),
        GOLD     = Color3.fromRGB(220, 170, 30),
        TEXT     = Color3.fromRGB(225, 225, 232),
        DIM      = Color3.fromRGB(110, 110, 128),
        SEP      = Color3.fromRGB(35, 35, 50),
        TOG_ON   = Color3.fromRGB(38, 175, 90),
        TOG_OFF  = Color3.fromRGB(38, 38, 54),
        PURPLE   = Color3.fromRGB(130, 60, 220),
        CYAN     = Color3.fromRGB(30, 190, 220),
    }

    local function Rnd(p, r) local c = Instance.new("UICorner",p) c.CornerRadius = UDim.new(0,r or 6) end
    local function Str(p, c, t) local s = Instance.new("UIStroke",p) s.Color = c s.Thickness = t return s end
    local function Pad(p,t,b,l,r) local u = Instance.new("UIPadding",p) u.PaddingTop=UDim.new(0,t) u.PaddingBottom=UDim.new(0,b) u.PaddingLeft=UDim.new(0,l) u.PaddingRight=UDim.new(0,r) end

    -- ═══════════════════════════════════════════════
    -- SCREEN GUI
    -- ═══════════════════════════════════════════════
    local SG = Instance.new("ScreenGui", player.PlayerGui)
    SG.ResetOnSpawn = false
    SG.Name = "AnihaSkinChanger"
    SG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Main = Instance.new("Frame", SG)
    Main.Size = UDim2.new(0, 1020, 0, 720)
    Main.Position = UDim2.new(0.5, -510, 0.5, -360)
    Main.BackgroundColor3 = C.BG
    Main.BorderSizePixel = 0
    Main.Active = false
    Rnd(Main, 12)
    Str(Main, Color3.fromRGB(50,50,70), 1.5)

    -- GRADIENT background accent
    local BGGrad = Instance.new("UIGradient", Main)
    BGGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(14,12,22)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(10,10,14)),
    })
    BGGrad.Rotation = 135

    -- TITLE BAR
    local TB = Instance.new("Frame", Main)
    TB.Size = UDim2.new(1, 0, 0, 50)
    TB.BackgroundColor3 = Color3.fromRGB(15, 10, 22)
    TB.BorderSizePixel = 0
    TB.ZIndex = 5
    Rnd(TB, 0)

    local TBGrad = Instance.new("UIGradient", TB)
    TBGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(160,30,30)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(18,12,30)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(15,10,22)),
    })
    TBGrad.Rotation = 90

    local TL = Instance.new("TextLabel", TB)
    TL.Size = UDim2.new(1, -150, 1, 0)
    TL.Position = UDim2.new(0, 18, 0, 0)
    TL.BackgroundTransparency = 1
    TL.Text = "✦  ANIHA SKIN CHANGER  v4.0"
    TL.TextColor3 = Color3.new(1,1,1)
    TL.Font = Enum.Font.GothamBlack
    TL.TextSize = 18
    TL.TextXAlignment = Enum.TextXAlignment.Left
    TL.ZIndex = 5

    local TLSub = Instance.new("TextLabel", TB)
    TLSub.Size = UDim2.new(0, 200, 1, 0)
    TLSub.Position = UDim2.new(1, -210, 0, 0)
    TLSub.BackgroundTransparency = 1
    TLSub.Text = "[ K ]  Toggle"
    TLSub.TextColor3 = Color3.fromRGB(180, 100, 100)
    TLSub.Font = Enum.Font.GothamBold
    TLSub.TextSize = 13
    TLSub.TextXAlignment = Enum.TextXAlignment.Right
    TLSub.ZIndex = 5

    -- ACCENT LINE under title
    local AccentLine = Instance.new("Frame", Main)
    AccentLine.Size = UDim2.new(1, 0, 0, 2)
    AccentLine.Position = UDim2.new(0, 0, 0, 50)
    AccentLine.BorderSizePixel = 0
    local AL_Grad = Instance.new("UIGradient", AccentLine)
    AL_Grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(220,40,40)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(160,60,220)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(30,120,220)),
    })

    -- TAB BAR
    local TabBar = Instance.new("Frame", Main)
    TabBar.Size = UDim2.new(1, 0, 0, 42)
    TabBar.Position = UDim2.new(0, 0, 0, 52)
    TabBar.BackgroundColor3 = Color3.fromRGB(13, 13, 18)
    TabBar.BorderSizePixel = 0

    local TabLL = Instance.new("UIListLayout", TabBar)
    TabLL.FillDirection = Enum.FillDirection.Horizontal
    TabLL.Padding = UDim.new(0, 5)
    TabLL.VerticalAlignment = Enum.VerticalAlignment.Center
    Pad(TabBar, 5, 5, 12, 12)

    local tabs = {}
    local function MakeTabBtn(icon, lbl, key)
        local b = Instance.new("TextButton", TabBar)
        b.Size = UDim2.new(0, 148, 1, 0)
        b.BackgroundColor3 = C.CARD
        b.Text = icon .. "  " .. lbl
        b.TextColor3 = C.DIM
        b.Font = Enum.Font.GothamBold
        b.TextSize = 13
        b.BorderSizePixel = 0
        b.AutoButtonColor = false
        Rnd(b, 6)
        tabs[key] = b
        return b
    end
    local SkinsTabBtn    = MakeTabBtn("🎨", "Skins",         "Skins")
    local WrapsTabBtn    = MakeTabBtn("🎁", "Wraps",         "Wraps")
    local PerfTabBtn     = MakeTabBtn("⚡", "Performance",   "Performance")
    local FinisherTabBtn = MakeTabBtn("💀", "Kill Finishers","Finishers")

    local function SetTab(name)
        _G.ActiveTab = name
        for k, b in pairs(tabs) do
            if k == name then
                b.BackgroundColor3 = C.RED b.TextColor3 = Color3.new(1,1,1)
                local s = Str(b, C.RED, 0)
                s.Thickness = 0
            else
                b.BackgroundColor3 = C.CARD b.TextColor3 = C.DIM
            end
        end
    end
    SetTab("Skins")

    -- TOOLBAR
    local Toolbar = Instance.new("Frame", Main)
    Toolbar.Size = UDim2.new(1, 0, 0, 44)
    Toolbar.Position = UDim2.new(0, 0, 1, -44)
    Toolbar.BackgroundColor3 = Color3.fromRGB(13, 13, 18)
    Toolbar.BorderSizePixel = 0

    local StatusLbl = Instance.new("TextLabel", Toolbar)
    StatusLbl.Size = UDim2.new(1, -312, 1, 0)
    StatusLbl.Position = UDim2.new(0, 14, 0, 0)
    StatusLbl.BackgroundTransparency = 1
    StatusLbl.Text = "Ready  •  AnihaSkinConfig.json"
    StatusLbl.TextColor3 = C.DIM
    StatusLbl.Font = Enum.Font.Gotham
    StatusLbl.TextSize = 12
    StatusLbl.TextXAlignment = Enum.TextXAlignment.Left

    local function TBtn(txt, xOff, color)
        local b = Instance.new("TextButton", Toolbar)
        b.Size = UDim2.new(0, 142, 0, 30)
        b.Position = UDim2.new(1, xOff, 0.5, -15)
        b.BackgroundColor3 = color
        b.Text = txt
        b.TextColor3 = Color3.new(1,1,1)
        b.Font = Enum.Font.GothamBold
        b.TextSize = 13
        b.BorderSizePixel = 0
        b.AutoButtonColor = false
        Rnd(b, 6)
        return b
    end
    local SaveBtn = TBtn("💾  Save Config", -300, Color3.fromRGB(35, 110, 52))
    local LoadBtn = TBtn("📂  Load Config", -150, Color3.fromRGB(42, 80, 160))

    local function Flash(msg, color)
        StatusLbl.Text = msg StatusLbl.TextColor3 = color or Color3.fromRGB(90,215,110)
        task.delay(3, function() StatusLbl.Text = "Ready  •  AnihaSkinConfig.json" StatusLbl.TextColor3 = C.DIM end)
    end
    SaveBtn.MouseButton1Click:Connect(function() if SaveConfig() then Flash("✅ Saved!",Color3.fromRGB(90,215,110)) else Flash("❌ Failed!",Color3.fromRGB(215,70,70)) end end)
    LoadBtn.MouseButton1Click:Connect(function() if LoadConfig() then Flash("✅ Loaded!",Color3.fromRGB(90,180,255)) ApplyAllSkins() else Flash("❌ No config!",Color3.fromRGB(215,70,70)) end end)

    -- CONTENT BOUNDS
    local CY = 50 + 2 + 42  -- below title + line + tabs
    local CH = 720 - CY - 44 -- minus toolbar
    local MARGIN = 8

    -- LEFT PANEL (weapon list) – hidden on Perf/Finisher tab
    local LeftPanel = Instance.new("Frame", Main)
    LeftPanel.Size = UDim2.new(0, 262, 0, CH - MARGIN*2)
    LeftPanel.Position = UDim2.new(0, MARGIN, 0, CY + MARGIN)
    LeftPanel.BackgroundColor3 = C.PANEL
    LeftPanel.BorderSizePixel = 0
    Rnd(LeftPanel, 8)
    Str(LeftPanel, C.SEP, 1)

    local SearchBox = Instance.new("TextBox", LeftPanel)
    SearchBox.Size = UDim2.new(1, -16, 0, 34)
    SearchBox.Position = UDim2.new(0, 8, 0, 8)
    SearchBox.BackgroundColor3 = C.CARD
    SearchBox.PlaceholderText = "🔍  Search weapon..."
    SearchBox.PlaceholderColor3 = C.DIM
    SearchBox.Text = ""
    SearchBox.TextColor3 = C.TEXT
    SearchBox.Font = Enum.Font.Gotham
    SearchBox.TextSize = 13
    SearchBox.BorderSizePixel = 0
    SearchBox.ClearTextOnFocus = false
    Rnd(SearchBox, 6)
    Pad(SearchBox, 0, 0, 8, 8)
    Str(SearchBox, C.SEP, 1)

    local WScroll = Instance.new("ScrollingFrame", LeftPanel)
    WScroll.Size = UDim2.new(1, -16, 1, -52)
    WScroll.Position = UDim2.new(0, 8, 0, 50)
    WScroll.BackgroundTransparency = 1
    WScroll.ScrollBarThickness = 3
    WScroll.ScrollBarImageColor3 = C.RED
    WScroll.BorderSizePixel = 0
    WScroll.CanvasSize = UDim2.new(0,0,0,0)

    local WLayout = Instance.new("UIListLayout", WScroll)
    WLayout.Padding = UDim.new(0, 4)
    WLayout.SortOrder = Enum.SortOrder.Name

    -- RIGHT PANEL
    local RightPanel = Instance.new("Frame", Main)
    RightPanel.Size = UDim2.new(1, -(262+MARGIN*3), 0, CH - MARGIN*2)
    RightPanel.Position = UDim2.new(0, 262+MARGIN*2, 0, CY + MARGIN)
    RightPanel.BackgroundColor3 = C.PANEL
    RightPanel.BorderSizePixel = 0
    Rnd(RightPanel, 8)
    Str(RightPanel, C.SEP, 1)

    local SelLbl = Instance.new("TextLabel", RightPanel)
    SelLbl.Size = UDim2.new(1, -16, 0, 36)
    SelLbl.Position = UDim2.new(0, 12, 0, 6)
    SelLbl.BackgroundTransparency = 1
    SelLbl.Text = "Select a weapon from the left"
    SelLbl.TextColor3 = C.TEXT
    SelLbl.Font = Enum.Font.GothamBold
    SelLbl.TextSize = 17
    SelLbl.TextXAlignment = Enum.TextXAlignment.Left

    local Sep = Instance.new("Frame", RightPanel)
    Sep.Size = UDim2.new(1, -16, 0, 1)
    Sep.Position = UDim2.new(0, 8, 0, 44)
    Sep.BackgroundColor3 = C.SEP
    Sep.BorderSizePixel = 0

    -- SKIN GRID
    local SkinScroll = Instance.new("ScrollingFrame", RightPanel)
    SkinScroll.Size = UDim2.new(1, -16, 1, -54)
    SkinScroll.Position = UDim2.new(0, 8, 0, 50)
    SkinScroll.BackgroundTransparency = 1
    SkinScroll.ScrollBarThickness = 3
    SkinScroll.ScrollBarImageColor3 = C.RED
    SkinScroll.BorderSizePixel = 0
    SkinScroll.Visible = true

    local SkinGrid = Instance.new("UIGridLayout", SkinScroll)
    SkinGrid.CellSize = UDim2.new(0, 126, 0, 150)
    SkinGrid.CellPadding = UDim2.new(0, 8, 0, 8)

    -- WRAP GRID
    local WrapScroll = Instance.new("ScrollingFrame", RightPanel)
    WrapScroll.Size = UDim2.new(1, -16, 1, -54)
    WrapScroll.Position = UDim2.new(0, 8, 0, 50)
    WrapScroll.BackgroundTransparency = 1
    WrapScroll.ScrollBarThickness = 3
    WrapScroll.ScrollBarImageColor3 = C.BLUE
    WrapScroll.BorderSizePixel = 0
    WrapScroll.Visible = false

    local WrapGrid = Instance.new("UIGridLayout", WrapScroll)
    WrapGrid.CellSize = UDim2.new(0, 175, 0, 38)
    WrapGrid.CellPadding = UDim2.new(0, 8, 0, 6)
    WrapGrid.SortOrder = Enum.SortOrder.LayoutOrder

    -- ═══════════════════════════════════════════════
    -- PERF PANEL (full-width)
    -- ═══════════════════════════════════════════════
    local PerfScroll = Instance.new("ScrollingFrame", RightPanel)
    PerfScroll.Size = UDim2.new(1, -16, 1, -54)
    PerfScroll.Position = UDim2.new(0, 8, 0, 50)
    PerfScroll.BackgroundTransparency = 1
    PerfScroll.ScrollBarThickness = 3
    PerfScroll.ScrollBarImageColor3 = C.RED
    PerfScroll.BorderSizePixel = 0
    PerfScroll.Visible = false
    PerfScroll.CanvasSize = UDim2.new(0,0,0,900)

    local PerfLL = Instance.new("UIListLayout", PerfScroll)
    PerfLL.Padding = UDim.new(0, 8)
    PerfLL.SortOrder = Enum.SortOrder.LayoutOrder

    -- ═══════════════════════════════════════════════
    -- FINISHER PANEL
    -- ═══════════════════════════════════════════════
    local FinisherScroll = Instance.new("ScrollingFrame", RightPanel)
    FinisherScroll.Size = UDim2.new(1, -16, 1, -54)
    FinisherScroll.Position = UDim2.new(0, 8, 0, 50)
    FinisherScroll.BackgroundTransparency = 1
    FinisherScroll.ScrollBarThickness = 3
    FinisherScroll.ScrollBarImageColor3 = C.RED
    FinisherScroll.BorderSizePixel = 0
    FinisherScroll.Visible = false
    FinisherScroll.CanvasSize = UDim2.new(0,0,0,0)

    local FinisherGrid = Instance.new("UIGridLayout", FinisherScroll)
    FinisherGrid.CellSize = UDim2.new(0, 175, 0, 54)
    FinisherGrid.CellPadding = UDim2.new(0, 8, 0, 8)
    FinisherGrid.SortOrder = Enum.SortOrder.LayoutOrder

    -- Populate finishers
    local equippedFinisher = "None"
    local finisherBtns = {}

    -- "None" button first
    local noneFinBtn = Instance.new("TextButton")
    noneFinBtn.Size = UDim2.new(0,175,0,54)
    noneFinBtn.BackgroundColor3 = C.EQUIP
    noneFinBtn.Text = "🚫  None"
    noneFinBtn.TextColor3 = C.TEXT
    noneFinBtn.Font = Enum.Font.GothamBold
    noneFinBtn.TextSize = 13
    noneFinBtn.BorderSizePixel = 0
    noneFinBtn.LayoutOrder = 0
    noneFinBtn.AutoButtonColor = false
    noneFinBtn.Parent = FinisherScroll
    Rnd(noneFinBtn, 7)
    Str(noneFinBtn, C.EQUIP, 1.5)
    finisherBtns["None"] = noneFinBtn

    for i, fin in ipairs(FinisherList) do
        local fb = Instance.new("TextButton")
        fb.Size = UDim2.new(0,175,0,54)
        fb.BackgroundColor3 = C.CARD
        fb.BorderSizePixel = 0
        fb.AutoButtonColor = false
        fb.LayoutOrder = i
        fb.Text = ""
        fb.Parent = FinisherScroll
        Rnd(fb, 7)
        Str(fb, C.SEP, 1)
        finisherBtns[fin] = fb

        -- Skull icon
        local icon = Instance.new("TextLabel", fb)
        icon.Size = UDim2.new(0, 30, 1, 0)
        icon.Position = UDim2.new(0, 8, 0, 0)
        icon.BackgroundTransparency = 1
        icon.Text = "💀"
        icon.TextSize = 18
        icon.Font = Enum.Font.GothamBold

        local lbl = Instance.new("TextLabel", fb)
        lbl.Size = UDim2.new(1, -44, 1, 0)
        lbl.Position = UDim2.new(0, 40, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = fin
        lbl.TextColor3 = C.TEXT
        lbl.Font = Enum.Font.GothamSemibold
        lbl.TextSize = 12
        lbl.TextWrapped = true
        lbl.TextXAlignment = Enum.TextXAlignment.Left

        -- Unlocked badge
        local badge = Instance.new("TextLabel", fb)
        badge.Size = UDim2.new(0, 52, 0, 14)
        badge.Position = UDim2.new(1, -58, 0, 4)
        badge.BackgroundColor3 = C.EQUIP
        badge.TextColor3 = Color3.new(1,1,1)
        badge.Font = Enum.Font.GothamBold
        badge.TextSize = 8
        badge.Text = "OWNED"
        badge.BorderSizePixel = 0
        Rnd(badge, 4)

        fb.MouseButton1Click:Connect(function()
            for _, b in pairs(finisherBtns) do
                b.BackgroundColor3 = C.CARD
                pcall(function() Str(b, C.SEP, 1) end)
            end
            fb.BackgroundColor3 = Color3.fromRGB(90,30,30)
            equippedFinisher = fin
            pcall(function() CosmeticLibrary.Equip("Finisher", "Finisher", fin) end)
            SelLbl.Text = "💀  Equipped: " .. fin
            Flash("💀 Finisher: " .. fin, C.RED)
        end)
    end

    noneFinBtn.MouseButton1Click:Connect(function()
        for _, b in pairs(finisherBtns) do b.BackgroundColor3 = C.CARD end
        noneFinBtn.BackgroundColor3 = C.EQUIP
        equippedFinisher = "None"
        pcall(function() CosmeticLibrary.Equip("Finisher","Finisher","None") end)
        SelLbl.Text = "💀  Kill Finishers  —  None"
    end)

    FinisherScroll.CanvasSize = UDim2.new(0,0,0,FinisherGrid.AbsoluteContentSize.Y+12)

    -- ═══════════════════════════════════════════════
    -- BUILD PERF TAB (redesigned)
    -- ═══════════════════════════════════════════════
    local function PHeader(txt, order, col)
        local f = Instance.new("Frame", PerfScroll)
        f.Size = UDim2.new(1, -8, 0, 30)
        f.BackgroundColor3 = col and Color3.fromRGB(
            math.floor(col.R*255*0.15), math.floor(col.G*255*0.15), math.floor(col.B*255*0.15)
        ) or Color3.fromRGB(30, 15, 15)
        f.BorderSizePixel = 0
        f.LayoutOrder = order
        Rnd(f, 6)

        local line = Instance.new("Frame", f)
        line.Size = UDim2.new(0, 3, 0.7, 0)
        line.Position = UDim2.new(0, 0, 0.15, 0)
        line.BackgroundColor3 = col or C.RED
        line.BorderSizePixel = 0
        Rnd(line, 2)

        local lbl = Instance.new("TextLabel", f)
        lbl.Size = UDim2.new(1, -16, 1, 0)
        lbl.Position = UDim2.new(0, 12, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = txt
        lbl.TextColor3 = col or C.RED
        lbl.Font = Enum.Font.GothamBlack
        lbl.TextSize = 12
        lbl.TextXAlignment = Enum.TextXAlignment.Left
    end

    local function PToggle(label, desc, order, callback, accent)
        local row = Instance.new("Frame", PerfScroll)
        row.Size = UDim2.new(1, -8, 0, 62)
        row.BackgroundColor3 = C.CARD
        row.BorderSizePixel = 0
        row.LayoutOrder = order
        Rnd(row, 8)
        Str(row, C.SEP, 1)

        local lbl = Instance.new("TextLabel", row)
        lbl.Size = UDim2.new(1, -82, 0, 26)
        lbl.Position = UDim2.new(0, 14, 0, 8)
        lbl.BackgroundTransparency = 1
        lbl.Text = label
        lbl.TextColor3 = C.TEXT
        lbl.Font = Enum.Font.GothamBold
        lbl.TextSize = 13
        lbl.TextXAlignment = Enum.TextXAlignment.Left

        local sub = Instance.new("TextLabel", row)
        sub.Size = UDim2.new(1, -82, 0, 18)
        sub.Position = UDim2.new(0, 14, 0, 36)
        sub.BackgroundTransparency = 1
        sub.Text = desc
        sub.TextColor3 = C.DIM
        sub.Font = Enum.Font.Gotham
        sub.TextSize = 11
        sub.TextXAlignment = Enum.TextXAlignment.Left

        local togBg = Instance.new("Frame", row)
        togBg.Size = UDim2.new(0, 52, 0, 26)
        togBg.Position = UDim2.new(1, -64, 0.5, -13)
        togBg.BackgroundColor3 = C.TOG_OFF
        togBg.BorderSizePixel = 0
        Rnd(togBg, 13)

        local knob = Instance.new("Frame", togBg)
        knob.Size = UDim2.new(0, 20, 0, 20)
        knob.Position = UDim2.new(0, 3, 0.5, -10)
        knob.BackgroundColor3 = Color3.new(1,1,1)
        knob.BorderSizePixel = 0
        Rnd(knob, 10)

        local state = false
        local clk = Instance.new("TextButton", row)
        clk.Size = UDim2.new(1,0,1,0) clk.BackgroundTransparency=1 clk.Text="" clk.ZIndex=2
        clk.MouseButton1Click:Connect(function()
            state = not state
            togBg.BackgroundColor3 = state and (accent or C.TOG_ON) or C.TOG_OFF
            knob.Position = state and UDim2.new(0, 29, 0.5, -10) or UDim2.new(0, 3, 0.5, -10)
            callback(state)
        end)
        return function(s)
            state = s
            togBg.BackgroundColor3 = state and (accent or C.TOG_ON) or C.TOG_OFF
            knob.Position = state and UDim2.new(0, 29, 0.5, -10) or UDim2.new(0, 3, 0.5, -10)
        end
    end

    -- GRAPHICS SECTION
    PHeader("🔧  GRAPHICS OPTIMIZATIONS", 1, C.RED)
    PToggle("Low Graphics Quality",  "Set render quality to minimum Level01",      2, ApplyLowGraphics)
    PToggle("Disable Shadows",       "Turn off all dynamic & cast shadows",         3, ApplyNoShadows)
    PToggle("Disable Particles",     "Remove particles, trails and beam effects",   4, ApplyNoParticles)
    PToggle("Low Mesh Detail",       "Reduce mesh part detail level for FPS gains", 5, ApplyLowMesh)

    -- VISIBILITY SECTION
    PHeader("👁  VISIBILITY OPTIONS", 9, C.CYAN)
    PToggle("Hide Weapon (Invisible)", "Makes your held weapon fully invisible (FPS boost)", 10, ApplyHideWeapon, C.CYAN)
    PToggle("Hide Player Names",       "Removes overhead name tags on all players",          11, ApplyHideNames, C.CYAN)
    PToggle("Hide Chat",               "Hides the chat window entirely",                     12, ApplyHideChat,  C.CYAN)

    -- HIT OUTLINE SECTION
    PHeader("🎯  HIT OUTLINE SETTINGS", 19, C.PURPLE)

    local outlineTogRow = Instance.new("Frame", PerfScroll)
    outlineTogRow.Size = UDim2.new(1, -8, 0, 62)
    outlineTogRow.BackgroundColor3 = C.CARD
    outlineTogRow.BorderSizePixel = 0
    outlineTogRow.LayoutOrder = 20
    Rnd(outlineTogRow, 8)
    Str(outlineTogRow, C.SEP, 1)

    local otLbl = Instance.new("TextLabel", outlineTogRow)
    otLbl.Size = UDim2.new(1,-82,0,26)
    otLbl.Position = UDim2.new(0,14,0,8)
    otLbl.BackgroundTransparency = 1
    otLbl.Text = "Enable Hit Outline"
    otLbl.TextColor3 = C.TEXT
    otLbl.Font = Enum.Font.GothamBold
    otLbl.TextSize = 13
    otLbl.TextXAlignment = Enum.TextXAlignment.Left

    local otSub = Instance.new("TextLabel", outlineTogRow)
    otSub.Size = UDim2.new(1,-82,0,18)
    otSub.Position = UDim2.new(0,14,0,36)
    otSub.BackgroundTransparency = 1
    otSub.Text = "Show/hide the red outline when you hit enemies"
    otSub.TextColor3 = C.DIM
    otSub.Font = Enum.Font.Gotham
    otSub.TextSize = 11
    otSub.TextXAlignment = Enum.TextXAlignment.Left

    local outlineTog = Instance.new("Frame", outlineTogRow)
    outlineTog.Size = UDim2.new(0,52,0,26)
    outlineTog.Position = UDim2.new(1,-64,0.5,-13)
    outlineTog.BackgroundColor3 = C.TOG_ON -- ON by default
    outlineTog.BorderSizePixel = 0
    Rnd(outlineTog, 13)

    local outlineKnob = Instance.new("Frame", outlineTog)
    outlineKnob.Size = UDim2.new(0,20,0,20)
    outlineKnob.Position = UDim2.new(0,29,0.5,-10)
    outlineKnob.BackgroundColor3 = Color3.new(1,1,1)
    outlineKnob.BorderSizePixel = 0
    Rnd(outlineKnob, 10)

    local outlineTogBtn = Instance.new("TextButton", outlineTogRow)
    outlineTogBtn.Size = UDim2.new(1,0,1,0)
    outlineTogBtn.BackgroundTransparency = 1
    outlineTogBtn.Text = ""
    outlineTogBtn.ZIndex = 2
    local outlineOn = true
    outlineTogBtn.MouseButton1Click:Connect(function()
        outlineOn = not outlineOn
        _G.OutlineSettings.Enabled = outlineOn
        outlineTog.BackgroundColor3 = outlineOn and C.PURPLE or C.TOG_OFF
        outlineKnob.Position = outlineOn and UDim2.new(0,29,0.5,-10) or UDim2.new(0,3,0.5,-10)
        ApplyOutlineSettings()
        Flash(outlineOn and "🎯 Outline ON" or "🎯 Outline OFF", C.PURPLE)
    end)

    -- Outline color picker
    local outlineColorLbl = Instance.new("TextLabel", PerfScroll)
    outlineColorLbl.Size = UDim2.new(1,-8,0,22)
    outlineColorLbl.BackgroundTransparency = 1
    outlineColorLbl.Text = "  Outline Color"
    outlineColorLbl.TextColor3 = C.PURPLE
    outlineColorLbl.Font = Enum.Font.GothamBold
    outlineColorLbl.TextSize = 11
    outlineColorLbl.TextXAlignment = Enum.TextXAlignment.Left
    outlineColorLbl.LayoutOrder = 21

    local outlineColorOpts = {
        {n="Red",    c=Color3.fromRGB(230,55,55)},
        {n="Orange", c=Color3.fromRGB(240,130,30)},
        {n="Yellow", c=Color3.fromRGB(240,215,35)},
        {n="Lime",   c=Color3.fromRGB(55,215,75)},
        {n="Cyan",   c=Color3.fromRGB(45,205,225)},
        {n="Blue",   c=Color3.fromRGB(55,115,250)},
        {n="Purple", c=Color3.fromRGB(170,55,250)},
        {n="Pink",   c=Color3.fromRGB(250,75,175)},
        {n="White",  c=Color3.fromRGB(238,238,238)},
        {n="Gold",   c=Color3.fromRGB(248,195,35)},
        {n="Mint",   c=Color3.fromRGB(55,210,160)},
        {n="Coral",  c=Color3.fromRGB(250,100,85)},
    }

    local outlineColorContainer = Instance.new("Frame", PerfScroll)
    outlineColorContainer.Size = UDim2.new(1,-8,0,118)
    outlineColorContainer.BackgroundColor3 = C.CARD
    outlineColorContainer.BorderSizePixel = 0
    outlineColorContainer.LayoutOrder = 22
    Rnd(outlineColorContainer, 7)
    Str(outlineColorContainer, C.SEP, 1)
    Pad(outlineColorContainer, 8, 8, 8, 8)

    local outlineColorGrid = Instance.new("UIGridLayout", outlineColorContainer)
    outlineColorGrid.CellSize = UDim2.new(0,88,0,34)
    outlineColorGrid.CellPadding = UDim2.new(0,6,0,6)
    outlineColorGrid.SortOrder = Enum.SortOrder.LayoutOrder

    local activeOutlineStroke = nil
    for i, opt in ipairs(outlineColorOpts) do
        local cb = Instance.new("TextButton", outlineColorContainer)
        cb.BackgroundColor3 = opt.c
        cb.Text = opt.n
        cb.TextColor3 = Color3.new(1,1,1)
        cb.Font = Enum.Font.GothamBold
        cb.TextSize = 12
        cb.BorderSizePixel = 0
        cb.LayoutOrder = i
        cb.AutoButtonColor = false
        Rnd(cb, 5)
        local stroke = Str(cb, Color3.new(1,1,1), 0)
        cb.MouseButton1Click:Connect(function()
            if activeOutlineStroke then activeOutlineStroke.Thickness = 0 end
            stroke.Thickness = 2
            activeOutlineStroke = stroke
            _G.OutlineSettings.Color = opt.c
            ApplyOutlineSettings()
            Flash("🎯 Outline color: " .. opt.n, opt.c)
        end)
    end

    -- DAMAGE COLOR SECTION
    PHeader("🎨  DAMAGE NUMBER COLOR", 29, C.GOLD)

    local colorOpts = {
        {n="Red",    c=Color3.fromRGB(230,55,55)},
        {n="Orange", c=Color3.fromRGB(240,130,30)},
        {n="Yellow", c=Color3.fromRGB(240,215,35)},
        {n="Lime",   c=Color3.fromRGB(55,215,75)},
        {n="Cyan",   c=Color3.fromRGB(45,205,225)},
        {n="Blue",   c=Color3.fromRGB(55,115,250)},
        {n="Purple", c=Color3.fromRGB(170,55,250)},
        {n="Pink",   c=Color3.fromRGB(250,75,175)},
        {n="White",  c=Color3.fromRGB(238,238,238)},
        {n="Gold",   c=Color3.fromRGB(248,195,35)},
        {n="Mint",   c=Color3.fromRGB(55,210,160)},
        {n="Coral",  c=Color3.fromRGB(250,100,85)},
    }

    local colorContainer = Instance.new("Frame", PerfScroll)
    colorContainer.Size = UDim2.new(1,-8,0,118)
    colorContainer.BackgroundColor3 = C.CARD
    colorContainer.BorderSizePixel = 0
    colorContainer.LayoutOrder = 30
    Rnd(colorContainer, 7)
    Str(colorContainer, C.SEP, 1)
    Pad(colorContainer, 8, 8, 8, 8)

    local colorGrid2 = Instance.new("UIGridLayout", colorContainer)
    colorGrid2.CellSize = UDim2.new(0,88,0,34)
    colorGrid2.CellPadding = UDim2.new(0,6,0,6)
    colorGrid2.SortOrder = Enum.SortOrder.LayoutOrder

    local activeColorStroke = nil
    for i, opt in ipairs(colorOpts) do
        local cb = Instance.new("TextButton", colorContainer)
        cb.BackgroundColor3 = opt.c
        cb.Text = opt.n
        cb.TextColor3 = Color3.new(1,1,1)
        cb.Font = Enum.Font.GothamBold
        cb.TextSize = 12
        cb.BorderSizePixel = 0
        cb.LayoutOrder = i
        cb.AutoButtonColor = false
        Rnd(cb, 5)
        local stroke = Str(cb, Color3.new(1,1,1), 0)
        cb.MouseButton1Click:Connect(function()
            if activeColorStroke then activeColorStroke.Thickness = 0 end
            stroke.Thickness = 2
            activeColorStroke = stroke
            ApplyDamageColor(opt.c)
            Flash("🎨 Damage color: " .. opt.n, opt.c)
        end)
    end

    -- Update perf canvas size
    PerfScroll.CanvasSize = UDim2.new(0,0,0,PerfLL.AbsoluteContentSize.Y+20)
    PerfLL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        PerfScroll.CanvasSize = UDim2.new(0,0,0,PerfLL.AbsoluteContentSize.Y+20)
    end)

    -- ═══════════════════════════════════════════════
    -- WEAPON BUTTONS
    -- ═══════════════════════════════════════════════
    local currentWeapon = nil
    local wBtns = {}

    local function PopulateSkins(wp)
        for _, c in pairs(SkinScroll:GetChildren()) do if c:IsA("ImageButton") then c:Destroy() end end
        for _, skin in ipairs(SkinLists[wp]) do
            local sb = Instance.new("ImageButton")
            sb.BackgroundColor3 = (_G.EquippedData[wp] and _G.EquippedData[wp].Skin == skin) and C.EQUIP or C.CARD
            sb.Image = GetThumb(skin)
            sb.BorderSizePixel = 0
            sb.AutoButtonColor = false
            sb.Parent = SkinScroll
            Rnd(sb, 6)
            Str(sb, C.SEP, 1)

            -- UNLOCKED badge (all skins show as owned)
            local ownBadge = Instance.new("TextLabel", sb)
            ownBadge.Size = UDim2.new(0, 52, 0, 14)
            ownBadge.Position = UDim2.new(0, 4, 0, 4)
            ownBadge.BackgroundColor3 = C.EQUIP
            ownBadge.TextColor3 = Color3.new(1,1,1)
            ownBadge.Font = Enum.Font.GothamBold
            ownBadge.TextSize = 8
            ownBadge.Text = "✓ OWNED"
            ownBadge.BorderSizePixel = 0
            Rnd(ownBadge, 3)

            local lbl = Instance.new("TextLabel", sb)
            lbl.Size = UDim2.new(1, 0, 0, 32)
            lbl.Position = UDim2.new(0, 0, 1, -32)
            lbl.BackgroundColor3 = Color3.new(0,0,0)
            lbl.BackgroundTransparency = 0.25
            lbl.Text = skin
            lbl.TextColor3 = C.TEXT
            lbl.Font = Enum.Font.GothamSemibold
            lbl.TextScaled = true
            lbl.BorderSizePixel = 0
            sb.MouseButton1Click:Connect(function()
                for _, c in pairs(SkinScroll:GetChildren()) do if c:IsA("ImageButton") then c.BackgroundColor3 = C.CARD end end
                sb.BackgroundColor3 = C.EQUIP
                _G.EquippedData[wp].Skin = skin
                pcall(function() CosmeticLibrary.Equip(wp,"Skin",skin) end)
                SelLbl.Text = "✅  " .. wp .. "  —  " .. skin
                -- Revolver fix: re-apply after a tiny delay
                if wp == "Revolver" then
                    task.delay(0.3, function() FixRevolverSkin(CosmeticLibrary) end)
                end
            end)
        end
        SkinScroll.CanvasSize = UDim2.new(0,0,0,SkinGrid.AbsoluteContentSize.Y+12)
    end

    local function PopulateWraps(wp)
        for _, c in pairs(WrapScroll:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
        for i, wrap in ipairs(WrapList) do
            local wb = Instance.new("TextButton")
            wb.BackgroundColor3 = (_G.EquippedData[wp] and _G.EquippedData[wp].Wrap == wrap) and C.EQUIP or C.CARD
            wb.Text = wrap
            wb.TextColor3 = C.TEXT
            wb.Font = Enum.Font.GothamSemibold
            wb.TextSize = 13
            wb.BorderSizePixel = 0
            wb.AutoButtonColor = false
            wb.LayoutOrder = i
            wb.Parent = WrapScroll
            Rnd(wb, 5)
            Str(wb, C.SEP, 1)
            -- pin top two with accent
            if wrap == "None" or wrap == "Dark" then
                Str(wb, Color3.fromRGB(180,180,200), 1)
            end
            wb.MouseButton1Click:Connect(function()
                for _, c in pairs(WrapScroll:GetChildren()) do if c:IsA("TextButton") then c.BackgroundColor3 = C.CARD end end
                wb.BackgroundColor3 = C.EQUIP
                _G.EquippedData[wp].Wrap = wrap
                pcall(function() CosmeticLibrary.Equip(wp,"Wrap",wrap) end)
                SelLbl.Text = "✅  " .. wp .. "  —  " .. wrap .. " (wrap)"
            end)
        end
        WrapScroll.CanvasSize = UDim2.new(0,0,0,WrapGrid.AbsoluteContentSize.Y+12)
    end

    local function RefreshRight()
        local isPerfTab = _G.ActiveTab == "Performance"
        local isFinTab  = _G.ActiveTab == "Finishers"
        -- hide/show left panel
        LeftPanel.Visible = not isPerfTab and not isFinTab
        -- reset all scrolls
        SkinScroll.Visible = false
        WrapScroll.Visible = false
        PerfScroll.Visible = false
        FinisherScroll.Visible = false

        if isPerfTab then
            RightPanel.Size = UDim2.new(1, -MARGIN*2, 0, CH - MARGIN*2)
            RightPanel.Position = UDim2.new(0, MARGIN, 0, CY + MARGIN)
            PerfScroll.Visible = true
            SelLbl.Text = "⚡  Performance & Visuals"
            return
        end
        if isFinTab then
            RightPanel.Size = UDim2.new(1, -MARGIN*2, 0, CH - MARGIN*2)
            RightPanel.Position = UDim2.new(0, MARGIN, 0, CY + MARGIN)
            FinisherScroll.Visible = true
            FinisherScroll.CanvasSize = UDim2.new(0,0,0,FinisherGrid.AbsoluteContentSize.Y+12)
            SelLbl.Text = "💀  Kill Finishers  —  All Unlocked"
            return
        end
        RightPanel.Size = UDim2.new(1, -(262+MARGIN*3), 0, CH - MARGIN*2)
        RightPanel.Position = UDim2.new(0, 262+MARGIN*2, 0, CY + MARGIN)

        if not currentWeapon then
            SelLbl.Text = "Select a weapon from the left" return
        end
        if _G.ActiveTab == "Skins" then
            SkinScroll.Visible = true
            PopulateSkins(currentWeapon)
            SelLbl.Text = currentWeapon .. "  —  Choose a Skin"
        else
            WrapScroll.Visible = true
            PopulateWraps(currentWeapon)
            SelLbl.Text = currentWeapon .. "  —  Choose a Wrap"
        end
    end

    SkinsTabBtn.MouseButton1Click:Connect(function()    SetTab("Skins")       RefreshRight() end)
    WrapsTabBtn.MouseButton1Click:Connect(function()    SetTab("Wraps")       RefreshRight() end)
    PerfTabBtn.MouseButton1Click:Connect(function()     SetTab("Performance") RefreshRight() end)
    FinisherTabBtn.MouseButton1Click:Connect(function() SetTab("Finishers")   RefreshRight() end)

    -- Build weapon list
    for wp in pairs(SkinLists) do
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(1, -4, 0, 46)
        btn.BackgroundColor3 = C.CARD
        btn.Text = ""
        btn.BorderSizePixel = 0
        btn.AutoButtonColor = false
        btn.Parent = WScroll
        Rnd(btn, 6)
        Str(btn, C.SEP, 1)
        wBtns[wp] = btn

        local wlbl = Instance.new("TextLabel", btn)
        wlbl.Size = UDim2.new(1, -64, 1, 0)
        wlbl.Position = UDim2.new(0, 10, 0, 0)
        wlbl.BackgroundTransparency = 1
        wlbl.Text = wp
        wlbl.TextColor3 = C.TEXT
        wlbl.Font = Enum.Font.GothamSemibold
        wlbl.TextSize = 13
        wlbl.TextXAlignment = Enum.TextXAlignment.Left
        wlbl.TextWrapped = true

        local sBadge = Instance.new("TextLabel", btn)
        sBadge.Size = UDim2.new(0, 52, 0, 15)
        sBadge.Position = UDim2.new(1, -58, 0, 5)
        sBadge.BackgroundColor3 = C.RED
        sBadge.TextColor3 = Color3.new(1,1,1)
        sBadge.Font = Enum.Font.GothamBold
        sBadge.TextSize = 9
        sBadge.BorderSizePixel = 0
        sBadge.Visible = false
        Rnd(sBadge, 4)

        local wBadge = Instance.new("TextLabel", btn)
        wBadge.Size = UDim2.new(0, 52, 0, 15)
        wBadge.Position = UDim2.new(1, -58, 0, 26)
        wBadge.BackgroundColor3 = C.BLUE
        wBadge.TextColor3 = Color3.new(1,1,1)
        wBadge.Font = Enum.Font.GothamBold
        wBadge.TextSize = 9
        wBadge.BorderSizePixel = 0
        wBadge.Visible = false
        Rnd(wBadge, 4)

        local function RefreshBadges()
            local d = _G.EquippedData[wp]
            local s = d and d.Skin or "Default"
            local w = d and d.Wrap or "None"
            sBadge.Visible = s ~= "Default"
            if sBadge.Visible then sBadge.Text = s:sub(1,7) end
            wBadge.Visible = w ~= "None"
            if wBadge.Visible then wBadge.Text = w:sub(1,7) end
        end
        RefreshBadges()

        btn.MouseButton1Click:Connect(function()
            currentWeapon = wp
            for _, b in pairs(wBtns) do b.BackgroundColor3 = C.CARD end
            btn.BackgroundColor3 = C.SEL
            RefreshRight()
            RefreshBadges()
        end)
    end
    WScroll.CanvasSize = UDim2.new(0,0,0,WLayout.AbsoluteContentSize.Y+8)

    SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local t = SearchBox.Text:lower()
        for wp, b in pairs(wBtns) do
            b.Visible = t == "" or wp:lower():find(t, 1, true)
        end
    end)

    -- DRAG
    do
        local dragging, dStart, sPos
        TB.Active = true
        TB.InputBegan:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging=true dStart=i.Position sPos=Main.Position end
        end)
        TB.InputEnded:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging=false end
        end)
        UserInputService.InputChanged:Connect(function(i)
            if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
                local d = i.Position - dStart
                Main.Position = UDim2.new(sPos.X.Scale, sPos.X.Offset+d.X, sPos.Y.Scale, sPos.Y.Offset+d.Y)
            end
        end)
    end

    -- TOGGLE KEY
    UserInputService.InputBegan:Connect(function(i, g)
        if not g and i.KeyCode == Enum.KeyCode.K then
            Main.Visible = not Main.Visible
            if not Main.Visible then pcall(function() SearchBox:ReleaseFocus() end) end
        end
    end)

    print("[+] Aniha Skin Changer v4.0 ready. Press K to toggle.")
end)
