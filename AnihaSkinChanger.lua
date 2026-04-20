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
print("[+] Aniha Skin Changer v3.0 starting...")
_G.AnihaVersion = "3.0"

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

    local function getCosmeticData(name, cType)
        local base = CosmeticLibrary.Cosmetics[name]
        if not base then return nil end
        local data = table.clone(base)
        data.Name = name data.Type = cType
        if name == "AKEY-47" then data.IsMythical = true data.BundlePath = "Bundles"
        elseif name:find("Gingerbread") then data.BundlePath = "Festive Skin Case"
        elseif name == "Evil Trident" then data.DisplayName = "Evil Trident" end
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
        BG       = Color3.fromRGB(14, 14, 18),
        PANEL    = Color3.fromRGB(20, 20, 26),
        CARD     = Color3.fromRGB(28, 28, 36),
        SEL      = Color3.fromRGB(50, 100, 210),
        EQUIP    = Color3.fromRGB(38, 155, 85),
        RED      = Color3.fromRGB(230, 55, 55),
        BLUE     = Color3.fromRGB(55, 100, 215),
        TEXT     = Color3.fromRGB(225, 225, 232),
        DIM      = Color3.fromRGB(110, 110, 128),
        SEP      = Color3.fromRGB(35, 35, 46),
        TOG_ON   = Color3.fromRGB(38, 175, 90),
        TOG_OFF  = Color3.fromRGB(38, 38, 50),
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
    Main.Size = UDim2.new(0, 990, 0, 690)
    Main.Position = UDim2.new(0.5, -495, 0.5, -345)
    Main.BackgroundColor3 = C.BG
    Main.BorderSizePixel = 0
    Main.Active = false
    Rnd(Main, 10)
    Str(Main, Color3.fromRGB(45,45,60), 1)

    -- TITLE BAR
    local TB = Instance.new("Frame", Main)
    TB.Size = UDim2.new(1, 0, 0, 46)
    TB.BackgroundColor3 = C.PANEL
    TB.BorderSizePixel = 0
    TB.ZIndex = 5
    local TL = Instance.new("TextLabel", TB)
    TL.Size = UDim2.new(1, 0, 1, 0)
    TL.BackgroundTransparency = 1
    TL.Text = "✦  ANIHA SKIN CHANGER  •  [ K ] Toggle"
    TL.TextColor3 = C.RED
    TL.Font = Enum.Font.GothamBlack
    TL.TextSize = 19
    TL.ZIndex = 5

    -- TAB BAR
    local TabBar = Instance.new("Frame", Main)
    TabBar.Size = UDim2.new(1, 0, 0, 38)
    TabBar.Position = UDim2.new(0, 0, 0, 46)
    TabBar.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
    TabBar.BorderSizePixel = 0

    local TabLL = Instance.new("UIListLayout", TabBar)
    TabLL.FillDirection = Enum.FillDirection.Horizontal
    TabLL.Padding = UDim.new(0, 5)
    TabLL.VerticalAlignment = Enum.VerticalAlignment.Center
    Pad(TabBar, 4, 4, 10, 10)

    local tabs = {}
    local function MakeTabBtn(icon, lbl, key)
        local b = Instance.new("TextButton", TabBar)
        b.Size = UDim2.new(0, 152, 1, 0)
        b.BackgroundColor3 = C.CARD
        b.Text = icon .. "  " .. lbl
        b.TextColor3 = C.DIM
        b.Font = Enum.Font.GothamBold
        b.TextSize = 13
        b.BorderSizePixel = 0
        b.AutoButtonColor = false
        Rnd(b, 5)
        tabs[key] = b
        return b
    end
    local SkinsTabBtn  = MakeTabBtn("🎨", "Skins",       "Skins")
    local WrapsTabBtn  = MakeTabBtn("🎁", "Wraps",       "Wraps")
    local PerfTabBtn   = MakeTabBtn("⚡", "Performance", "Performance")

    local function SetTab(name)
        _G.ActiveTab = name
        for k, b in pairs(tabs) do
            if k == name then b.BackgroundColor3 = C.RED b.TextColor3 = Color3.new(1,1,1)
            else b.BackgroundColor3 = C.CARD b.TextColor3 = C.DIM end
        end
    end
    SetTab("Skins")

    -- TOOLBAR
    local Toolbar = Instance.new("Frame", Main)
    Toolbar.Size = UDim2.new(1, 0, 0, 42)
    Toolbar.Position = UDim2.new(0, 0, 1, -42)
    Toolbar.BackgroundColor3 = Color3.fromRGB(16, 16, 22)
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
        b.Size = UDim2.new(0, 142, 0, 28)
        b.Position = UDim2.new(1, xOff, 0.5, -14)
        b.BackgroundColor3 = color
        b.Text = txt
        b.TextColor3 = Color3.new(1,1,1)
        b.Font = Enum.Font.GothamBold
        b.TextSize = 13
        b.BorderSizePixel = 0
        b.AutoButtonColor = false
        Rnd(b, 5)
        return b
    end
    local SaveBtn = TBtn("💾  Save Config", -298, Color3.fromRGB(38,115,55))
    local LoadBtn = TBtn("📂  Load Config", -148, Color3.fromRGB(45,85,165))

    local function Flash(msg, color)
        StatusLbl.Text = msg StatusLbl.TextColor3 = color or Color3.fromRGB(90,215,110)
        task.delay(3, function() StatusLbl.Text = "Ready  •  AnihaSkinConfig.json" StatusLbl.TextColor3 = C.DIM end)
    end
    SaveBtn.MouseButton1Click:Connect(function() if SaveConfig() then Flash("✅ Saved!",Color3.fromRGB(90,215,110)) else Flash("❌ Failed!",Color3.fromRGB(215,70,70)) end end)
    LoadBtn.MouseButton1Click:Connect(function() if LoadConfig() then Flash("✅ Loaded!",Color3.fromRGB(90,180,255)) ApplyAllSkins() else Flash("❌ No config!",Color3.fromRGB(215,70,70)) end end)

    -- CONTENT BOUNDS
    local CY = 46 + 38  -- below title + tabs
    local CH = 690 - CY - 42 -- minus toolbar
    local MARGIN = 8

    -- LEFT PANEL (weapon list) – hidden on Perf tab
    local LeftPanel = Instance.new("Frame", Main)
    LeftPanel.Size = UDim2.new(0, 262, 0, CH - MARGIN*2)
    LeftPanel.Position = UDim2.new(0, MARGIN, 0, CY + MARGIN)
    LeftPanel.BackgroundColor3 = C.PANEL
    LeftPanel.BorderSizePixel = 0
    Rnd(LeftPanel, 8)

    local SearchBox = Instance.new("TextBox", LeftPanel)
    SearchBox.Size = UDim2.new(1, -16, 0, 32)
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
    Rnd(SearchBox, 5)
    Pad(SearchBox, 0, 0, 8, 8)

    local WScroll = Instance.new("ScrollingFrame", LeftPanel)
    WScroll.Size = UDim2.new(1, -16, 1, -50)
    WScroll.Position = UDim2.new(0, 8, 0, 48)
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

    -- PERF PANEL (full-width when active)
    local PerfScroll = Instance.new("ScrollingFrame", RightPanel)
    PerfScroll.Size = UDim2.new(1, -16, 1, -54)
    PerfScroll.Position = UDim2.new(0, 8, 0, 50)
    PerfScroll.BackgroundTransparency = 1
    PerfScroll.ScrollBarThickness = 3
    PerfScroll.ScrollBarImageColor3 = C.RED
    PerfScroll.BorderSizePixel = 0
    PerfScroll.Visible = false
    PerfScroll.CanvasSize = UDim2.new(0,0,0,700)

    local PerfLL = Instance.new("UIListLayout", PerfScroll)
    PerfLL.Padding = UDim.new(0, 8)
    PerfLL.SortOrder = Enum.SortOrder.LayoutOrder

    -- ═══════════════════════════════════════════════
    -- BUILD PERF TAB
    -- ═══════════════════════════════════════════════
    local function PHeader(txt, order)
        local f = Instance.new("TextLabel", PerfScroll)
        f.Size = UDim2.new(1, -8, 0, 22)
        f.BackgroundTransparency = 1
        f.Text = txt
        f.TextColor3 = C.RED
        f.Font = Enum.Font.GothamBlack
        f.TextSize = 12
        f.TextXAlignment = Enum.TextXAlignment.Left
        f.LayoutOrder = order
    end

    local function PToggle(label, desc, order, callback)
        local row = Instance.new("Frame", PerfScroll)
        row.Size = UDim2.new(1, -8, 0, 58)
        row.BackgroundColor3 = C.CARD
        row.BorderSizePixel = 0
        row.LayoutOrder = order
        Rnd(row, 7)

        local lbl = Instance.new("TextLabel", row)
        lbl.Size = UDim2.new(1, -78, 0, 24)
        lbl.Position = UDim2.new(0, 12, 0, 7)
        lbl.BackgroundTransparency = 1
        lbl.Text = label
        lbl.TextColor3 = C.TEXT
        lbl.Font = Enum.Font.GothamBold
        lbl.TextSize = 13
        lbl.TextXAlignment = Enum.TextXAlignment.Left

        local sub = Instance.new("TextLabel", row)
        sub.Size = UDim2.new(1, -78, 0, 18)
        sub.Position = UDim2.new(0, 12, 0, 32)
        sub.BackgroundTransparency = 1
        sub.Text = desc
        sub.TextColor3 = C.DIM
        sub.Font = Enum.Font.Gotham
        sub.TextSize = 11
        sub.TextXAlignment = Enum.TextXAlignment.Left

        local togBg = Instance.new("Frame", row)
        togBg.Size = UDim2.new(0, 48, 0, 24)
        togBg.Position = UDim2.new(1, -60, 0.5, -12)
        togBg.BackgroundColor3 = C.TOG_OFF
        togBg.BorderSizePixel = 0
        Rnd(togBg, 12)

        local knob = Instance.new("Frame", togBg)
        knob.Size = UDim2.new(0, 18, 0, 18)
        knob.Position = UDim2.new(0, 3, 0.5, -9)
        knob.BackgroundColor3 = Color3.new(1,1,1)
        knob.BorderSizePixel = 0
        Rnd(knob, 9)

        local state = false
        local clk = Instance.new("TextButton", row)
        clk.Size = UDim2.new(1,0,1,0) clk.BackgroundTransparency=1 clk.Text="" clk.ZIndex=2
        clk.MouseButton1Click:Connect(function()
            state = not state
            togBg.BackgroundColor3 = state and C.TOG_ON or C.TOG_OFF
            knob.Position = state and UDim2.new(0, 27, 0.5, -9) or UDim2.new(0, 3, 0.5, -9)
            callback(state)
        end)
    end

    PHeader("🔧  GRAPHICS OPTIMIZATIONS", 1)
    PToggle("Low Graphics Quality",  "Set render quality to minimum Level01",      2, ApplyLowGraphics)
    PToggle("Disable Shadows",       "Turn off all dynamic & cast shadows",         3, ApplyNoShadows)
    PToggle("Disable Particles",     "Remove particles, trails and beam effects",   4, ApplyNoParticles)
    PToggle("Low Mesh Detail",       "Reduce mesh part detail level for FPS gains", 5, ApplyLowMesh)

    PHeader("🎨  DAMAGE NUMBER COLOR", 10)

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
    colorContainer.Size = UDim2.new(1, -8, 0, 118)
    colorContainer.BackgroundColor3 = C.CARD
    colorContainer.BorderSizePixel = 0
    colorContainer.LayoutOrder = 11
    Rnd(colorContainer, 7)
    Pad(colorContainer, 8, 8, 8, 8)

    local colorGrid2 = Instance.new("UIGridLayout", colorContainer)
    colorGrid2.CellSize = UDim2.new(0, 88, 0, 34)
    colorGrid2.CellPadding = UDim2.new(0, 6, 0, 6)
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
            Flash("🎨 Damage color set: " .. opt.n, opt.c)
        end)
    end

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
            local lbl = Instance.new("TextLabel", sb)
            lbl.Size = UDim2.new(1, 0, 0, 32)
            lbl.Position = UDim2.new(0, 0, 1, -32)
            lbl.BackgroundColor3 = Color3.new(0,0,0)
            lbl.BackgroundTransparency = 0.3
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
        -- toggle left panel visibility and resize right panel
        LeftPanel.Visible = not isPerfTab
        if isPerfTab then
            RightPanel.Size = UDim2.new(1, -MARGIN*2, 0, CH - MARGIN*2)
            RightPanel.Position = UDim2.new(0, MARGIN, 0, CY + MARGIN)
            SkinScroll.Visible = false
            WrapScroll.Visible = false
            PerfScroll.Visible = true
            SelLbl.Text = "⚡  Performance & Visuals"
            return
        end
        RightPanel.Size = UDim2.new(1, -(262+MARGIN*3), 0, CH - MARGIN*2)
        RightPanel.Position = UDim2.new(0, 262+MARGIN*2, 0, CY + MARGIN)
        PerfScroll.Visible = false

        if not currentWeapon then
            SkinScroll.Visible = false WrapScroll.Visible = false
            SelLbl.Text = "Select a weapon from the left" return
        end
        if _G.ActiveTab == "Skins" then
            SkinScroll.Visible = true WrapScroll.Visible = false
            PopulateSkins(currentWeapon)
            SelLbl.Text = currentWeapon .. "  —  Choose a Skin"
        else
            SkinScroll.Visible = false WrapScroll.Visible = true
            PopulateWraps(currentWeapon)
            SelLbl.Text = currentWeapon .. "  —  Choose a Wrap"
        end
    end

    SkinsTabBtn.MouseButton1Click:Connect(function() SetTab("Skins") RefreshRight() end)
    WrapsTabBtn.MouseButton1Click:Connect(function() SetTab("Wraps") RefreshRight() end)
    PerfTabBtn.MouseButton1Click:Connect(function() SetTab("Performance") RefreshRight() end)

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

    print("[+] Aniha Skin Changer v3.0 ready. Press K to toggle.")
end)
