-- ╔══════════════════════════════════════════════════════╗
-- ║     ANIHA SKIN CHANGER  v6.0  |  Kavo UI Edition    ║
-- ║       Press K to toggle  |  Press / to chat         ║
-- ╚══════════════════════════════════════════════════════╝

local Players           = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService  = game:GetService("UserInputService")
local RunService        = game:GetService("RunService")
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
_G.EquippedData = _G.EquippedData or {}
for w in pairs(SkinLists) do
    if not _G.EquippedData[w] then _G.EquippedData[w] = {Skin="Default", Wrap="None"} end
end
_G.AimAssist = _G.AimAssist or {
    Enabled=false, Strength=4, Range=80,
    HitboxExpand=false, HitboxSize=2.5,
    SilentAimChance=0, TargetMode="Random"
}

-- ═══════════════════════════════════════════════
-- SAVE / LOAD
-- ═══════════════════════════════════════════════
local SAVE_FILE = "AnihaSkinConfig.json"
local function SaveConfig()
    pcall(function()
        local data = {}
        for w, info in pairs(_G.EquippedData) do
            data[w] = {Skin=info.Skin or "Default", Wrap=info.Wrap or "None"}
        end
        writefile(SAVE_FILE, game:GetService("HttpService"):JSONEncode(data))
    end)
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
    end
end
LoadConfig()

-- ═══════════════════════════════════════════════
-- AIM ASSIST
-- ═══════════════════════════════════════════════
local aimAssistConn = nil

local function ApplyHitboxExpand(on, size)
    _G.AimAssist.HitboxExpand = on
    _G.AimAssist.HitboxSize   = size or _G.AimAssist.HitboxSize
    if _G.HitboxConn  then _G.HitboxConn:Disconnect()  _G.HitboxConn=nil  end
    if _G.HitboxConn2 then _G.HitboxConn2:Disconnect() _G.HitboxConn2=nil end

    local function expandChar(char)
        if not char then return end
        task.wait(0.3)
        pcall(function()
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("MeshPart") then
                    local n = part.Name:lower()
                    if n:find("torso") or n:find("root") or n:find("head") then
                        if on then
                            if not part:GetAttribute("AnihaOrigSize") then
                                part:SetAttribute("AnihaOrigSize", part.Size.X..","..part.Size.Y..","..part.Size.Z)
                                part:SetAttribute("AnihaOrigTrans", part.Transparency)
                            end
                            part.Size = part.Size * (_G.AimAssist.HitboxSize or 2.5)
                            part.Transparency = 1
                            part.LocalTransparencyModifier = 1
                        else
                            local origS = part:GetAttribute("AnihaOrigSize")
                            local origT = part:GetAttribute("AnihaOrigTrans")
                            if origS then
                                local s = origS:split(",")
                                if #s==3 then part.Size=Vector3.new(tonumber(s[1]),tonumber(s[2]),tonumber(s[3])) end
                            end
                            if origT then part.Transparency=origT part.LocalTransparencyModifier=0 end
                        end
                    end
                end
            end
        end)
    end

    local function restoreChar(char)
        if not char then return end
        pcall(function()
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("MeshPart") then
                    local origS = part:GetAttribute("AnihaOrigSize")
                    local origT = part:GetAttribute("AnihaOrigTrans")
                    if origS then local s=origS:split(",") if #s==3 then part.Size=Vector3.new(tonumber(s[1]),tonumber(s[2]),tonumber(s[3])) end end
                    if origT then part.Transparency=origT part.LocalTransparencyModifier=0 end
                end
            end
        end)
    end

    pcall(function()
        if on then
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= player then
                    expandChar(plr.Character)
                    _G["HBCharConn_"..plr.UserId] = plr.CharacterAdded:Connect(function(c) expandChar(c) end)
                end
            end
            _G.HitboxConn  = Players.PlayerAdded:Connect(function(plr)
                _G["HBCharConn_"..plr.UserId] = plr.CharacterAdded:Connect(function(c) expandChar(c) end)
            end)
            _G.HitboxConn2 = Players.PlayerRemoving:Connect(function(plr)
                if _G["HBCharConn_"..plr.UserId] then _G["HBCharConn_"..plr.UserId]:Disconnect() end
            end)
        else
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= player then restoreChar(plr.Character) end
                if _G["HBCharConn_"..plr.UserId] then _G["HBCharConn_"..plr.UserId]:Disconnect() end
            end
        end
    end)
end

local function SetAimAssist(on)
    _G.AimAssist.Enabled = on
    if aimAssistConn then aimAssistConn:Disconnect() aimAssistConn = nil end
    if not on then return end

    local smoothX, smoothY = 0, 0
    local lastMX,  lastMY  = 0, 0
    local cachedTargets = {}
    local cacheTimer = 0
    local CACHE_RATE = 0.1

    local function rebuildCache()
        local t = {}
        local mode = _G.AimAssist.TargetMode or "Random"
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= player then
                local char = plr.Character
                if char then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum and hum.Health > 0 then
                        local head  = char:FindFirstChild("Head")
                        local torso = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
                        local snap
                        if mode=="Head" then snap=head
                        elseif mode=="Torso" then snap=torso
                        else snap=(math.random(2)==1 and head or torso) or head or torso end
                        if snap and snap:IsA("BasePart") then
                            local yOff = snap==head and (snap.Size.Y*0.35) or 0.6
                            t[#t+1] = {part=snap, yOff=yOff}
                        end
                    end
                end
            end
        end
        cachedTargets = t
    end

    aimAssistConn = RunService.RenderStepped:Connect(function(dt)
        if not _G.AimAssist.Enabled then return end
        local cam = workspace.CurrentCamera
        if not cam then return end

        cacheTimer = cacheTimer + dt
        if cacheTimer >= CACHE_RATE then cacheTimer=0 rebuildCache() end

        local range    = _G.AimAssist.Range
        local strength = _G.AimAssist.Strength
        local mx, my   = mouse.X, mouse.Y

        local pvx = mx - lastMX
        local pvy = my - lastMY
        lastMX, lastMY = mx, my
        local speedSq     = pvx*pvx + pvy*pvy
        local suppression = math.clamp(speedSq/(18*18), 0, 1)
        local assistScale = 1 - suppression

        local bestDistSq = range*range
        local bestPos = nil

        for i=1,#cachedTargets do
            local entry = cachedTargets[i]
            local part  = entry.part
            if part and part.Parent then
                local ok, sPos, vis = pcall(cam.WorldToViewportPoint, cam, part.Position+Vector3.new(0,entry.yOff,0))
                if ok and vis then
                    local dx=sPos.X-mx local dy=sPos.Y-my
                    local distSq=dx*dx+dy*dy
                    if distSq<bestDistSq then bestDistSq=distSq bestPos=sPos end
                end
            end
        end

        if bestPos then
            local dist      = math.sqrt(bestDistSq)
            local distRatio = 1 - math.clamp(dist/range, 0, 1)
            local falloff   = distRatio*distRatio
            local basePull  = (strength/20)*0.38*falloff*assistScale
            local targetDX  = (bestPos.X-mx)*basePull
            local targetDY  = (bestPos.Y-my)*basePull
            local lerpSpeed = 12*dt
            smoothX = smoothX+(targetDX-smoothX)*lerpSpeed
            smoothY = smoothY+(targetDY-smoothY)*lerpSpeed
            if math.abs(smoothX)>0.1 or math.abs(smoothY)>0.1 then
                pcall(function()
                    if mousemoverel then mousemoverel(smoothX, smoothY)
                    elseif mouse_moverel then mouse_moverel(smoothX, smoothY) end
                end)
            end
        else
            smoothX=smoothX*0.85 smoothY=smoothY*0.85
        end
    end)
end

-- ═══════════════════════════════════════════════
-- SILENT AIM
-- ═══════════════════════════════════════════════
local function getSilentAimTarget()
    local cam = workspace.CurrentCamera
    if not cam then return nil end
    local bestDist = math.huge
    local bestPos  = nil
    local range    = _G.AimAssist.Range

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= player then
            local char = plr.Character
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum and hum.Health > 0 then
                    local head  = char:FindFirstChild("Head")
                    local torso = char:FindFirstChild("UpperTorso") or char:FindFirstChild("Torso")
                    local snap  = head or torso
                    if snap and snap:IsA("BasePart") then
                        local yOff = snap==head and (snap.Size.Y*0.35) or 0.6
                        local ok, sPos, vis = pcall(cam.WorldToViewportPoint, cam, snap.Position+Vector3.new(0,yOff,0))
                        if ok and vis then
                            local dx=sPos.X-mouse.X local dy=sPos.Y-mouse.Y
                            local d=dx*dx+dy*dy
                            if d<bestDist then bestDist=d bestPos=sPos end
                        end
                    end
                end
            end
        end
    end
    return bestPos and math.sqrt(bestDist)<range and bestPos or nil
end

UserInputService.InputBegan:Connect(function(input, _)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        if _G.AimAssist.Enabled and _G.AimAssist.SilentAimChance > 0 then
            if math.random(1,100) <= _G.AimAssist.SilentAimChance then
                local silentPos = getSilentAimTarget()
                if silentPos then
                    pcall(function()
                        local dx=silentPos.X-mouse.X local dy=silentPos.Y-mouse.Y
                        if mousemoverel then mousemoverel(dx,dy)
                        elseif mouse_moverel then mouse_moverel(dx,dy) end
                    end)
                end
            end
        end
    end
end)

-- ═══════════════════════════════════════════════
-- ROBUST REQUIRE
-- ═══════════════════════════════════════════════
local function tryRequire(module)
    local setid = setthreadidentity or set_thread_identity or (syn and syn.set_thread_identity)
    local getid = getthreadidentity or get_thread_identity or (syn and syn.get_thread_identity)
    local oldId
    pcall(function() if getid and setid then oldId=getid() setid(2) end end)
    local ok, res = pcall(require, module)
    pcall(function() if setid and oldId then setid(oldId) end end)
    if ok and res then return res end
    if getgenv and type(getgenv().require)=="function" then
        ok, res = pcall(getgenv().require, module)
        if ok and res then return res end
    end
    return nil
end

local function robust_require(module)
    for attempt=1,3 do
        local res = tryRequire(module)
        if res then return res end
        task.wait(0.25)
    end
    return nil
end

-- ═══════════════════════════════════════════════
-- KAVO UI LIBRARY LOAD
-- ═══════════════════════════════════════════════
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Window = Library.CreateLib("Aniha Skin Changer v6.0", "BloodTheme")

-- ═══════════════════════════════════════════════
-- MAIN TASK (parallel module load + GUI build)
-- ═══════════════════════════════════════════════
task.spawn(function()
    task.wait(0.5)

    local CosmeticLibrary, ItemLibrary, ReplicatedClass, ClientViewModel
    local loaded, total = 0, 5
    local function onLoaded() loaded = loaded + 1 end

    task.spawn(function()
        CosmeticLibrary = robust_require(ReplicatedStorage:WaitForChild("Modules",10):WaitForChild("CosmeticLibrary",10))
        onLoaded()
    end)
    task.spawn(function()
        ItemLibrary = robust_require(ReplicatedStorage:WaitForChild("Modules",10):WaitForChild("ItemLibrary",10))
        onLoaded()
    end)
    task.spawn(function()
        ReplicatedClass = robust_require(ReplicatedStorage:WaitForChild("Modules",10):WaitForChild("ReplicatedClass",10))
        onLoaded()
    end)
    local Modules = player.PlayerScripts:WaitForChild("Modules",8)
    task.spawn(function()
        robust_require(Modules:WaitForChild("ClientReplicatedClasses",8):WaitForChild("ClientFighter",8):WaitForChild("ClientItem",8))
        onLoaded()
    end)
    task.spawn(function()
        ClientViewModel = robust_require(Modules:WaitForChild("ClientReplicatedClasses",8):WaitForChild("ClientFighter",8):WaitForChild("ClientItem",8):WaitForChild("ClientViewModel",8))
        onLoaded()
    end)

    local elapsed = 0
    while loaded < total and elapsed < 12 do
        task.wait(0.1) elapsed = elapsed + 0.1
    end

    if not CosmeticLibrary or not ItemLibrary or not ClientViewModel or not ReplicatedClass then
        warn("[Aniha] Core modules missing — restart and try again.")
        return
    end

    -- Unlock all skins visually
    pcall(function()
        if CosmeticLibrary.IsOwned then CosmeticLibrary.IsOwned = function() return true end end
        if CosmeticLibrary.HasSkin  then CosmeticLibrary.HasSkin  = function() return true end end
        if CosmeticLibrary.OwnedSkins then
            local owned = {}
            for _, sk in ipairs(CosmeticLibrary.OwnedSkins) do owned[sk]=true end
            for _, skins in pairs(SkinLists) do
                for _, sk in ipairs(skins) do
                    if not owned[sk] then owned[sk]=true table.insert(CosmeticLibrary.OwnedSkins, sk) end
                end
            end
        end
        if CosmeticLibrary.Cosmetics then
            local batch = 0
            for _, data in pairs(CosmeticLibrary.Cosmetics) do
                if type(data)=="table" then data.Locked=false data.Owned=true data.IsOwned=true end
                batch=batch+1
                if batch>=200 then batch=0 task.wait() end
            end
        end
    end)

    -- Revolver fix
    local function FixRevolverSkin()
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
    FixRevolverSkin()

    local function getCosmeticData(name, cType)
        local base = CosmeticLibrary.Cosmetics[name]
        if not base then return nil end
        local data = table.clone(base)
        data.Name=name data.Type=cType data.Locked=false data.Owned=true data.IsOwned=true
        if name=="AKEY-47"        then data.IsMythical=true data.BundlePath="Bundles" end
        if name:find("Gingerbread") then data.BundlePath="Festive Skin Case" end
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

    -- Patch new (skin injection)
    local oldNew = ClientViewModel.new
    ClientViewModel.new = function(replicatedData, clientItem)
        pcall(function()
            if not clientItem then return end
            local wn = clientItem.Name
            if not wn or not _G.EquippedData[wn] then return end
            local cf = rawget(clientItem,"ClientFighter") or (pcall(function() return clientItem.ClientFighter end) and clientItem.ClientFighter)
            if not cf or cf.Player ~= player then return end
            local sel = _G.EquippedData[wn].Skin
            if sel and sel ~= "Default" then
                local cos = getCosmeticData(sel,"Skin")
                if cos then
                    local dk=ReplicatedClass:ToEnum("Data")
                    local sk=ReplicatedClass:ToEnum("Skin")
                    local nk=ReplicatedClass:ToEnum("Name")
                    replicatedData[dk] = replicatedData[dk] or {}
                    replicatedData[dk][sk] = cos
                    replicatedData[dk][nk] = sel
                end
            end
        end)
        local vm = oldNew(replicatedData, clientItem)
        task.delay(0.1, function() pcall(function() if vm and vm._UpdateWrap then vm:_UpdateWrap() end end) end)
        pcall(function()
            if clientItem and clientItem.Name=="Revolver" then
                task.delay(0.3, function() FixRevolverSkin() end)
            end
        end)
        return vm
    end

    local function GetThumb(name)
        local r = ""
        pcall(function()
            if ItemLibrary and ItemLibrary.ViewModels and ItemLibrary.ViewModels[name] then
                local d=ItemLibrary.ViewModels[name]
                r=d.ImageHighResolution or d.Image or d.Thumbnail or ""
                return
            end
            if CosmeticLibrary and CosmeticLibrary.Skins then
                for _, tbl in pairs(CosmeticLibrary.Skins) do
                    if tbl[name] then local d=tbl[name] r=d.ImageHighResolution or d.Image or d.Thumbnail or "" return end
                end
            end
        end)
        return r
    end

    -- ═════════════════════════════════════════════════════
    -- BUILD KAVO GUI
    -- ═════════════════════════════════════════════════════

    -- Sorted weapon list for consistent display
    local weaponNames = {}
    for w in pairs(SkinLists) do weaponNames[#weaponNames+1] = w end
    table.sort(weaponNames)

    -- ── TAB: SKINS ────────────────────────────────────────
    local SkinsTab = Window:NewTab("Skins")
    local SkinsSection = SkinsTab:NewSection("Weapon Skin Selector")

    -- Weapon picker dropdown
    local currentWeapon = weaponNames[1]

    SkinsSection:NewDropdown("Weapon", "Select a weapon to apply a skin to", weaponNames, function(selected)
        currentWeapon = selected
    end)

    SkinsSection:NewDropdown("Skin", "Choose a skin for the selected weapon", SkinLists[currentWeapon] or {"Default"}, function(selected)
        if not currentWeapon then return end
        if not _G.EquippedData[currentWeapon] then return end
        _G.EquippedData[currentWeapon].Skin = selected
        pcall(function() CosmeticLibrary.Equip(currentWeapon, "Skin", selected) end)
        if currentWeapon == "Revolver" then task.delay(0.3, FixRevolverSkin) end
        SaveConfig()
    end)

    -- NOTE: Kavo dropdowns don't dynamically refresh each other, so we wire
    -- the skin dropdown to always read currentWeapon at click time via a button.
    SkinsSection:NewButton("Apply Selected Skin", "Applies the currently chosen skin to the weapon", function()
        if not currentWeapon then return end
        local d = _G.EquippedData[currentWeapon]
        if d and d.Skin and d.Skin ~= "Default" then
            pcall(function() CosmeticLibrary.Equip(currentWeapon, "Skin", d.Skin) end)
            if currentWeapon == "Revolver" then task.delay(0.3, FixRevolverSkin) end
        end
    end)

    SkinsSection:NewButton("Reset Skin (Default)", "Removes the skin from selected weapon", function()
        if not currentWeapon then return end
        _G.EquippedData[currentWeapon].Skin = "Default"
        pcall(function() CosmeticLibrary.Equip(currentWeapon, "Skin", "Default") end)
        SaveConfig()
    end)

    -- Preview label — shows current selections per weapon
    local SkinsSection2 = SkinsTab:NewSection("Current Selections")
    local function BuildPreviewList()
        local lines = {}
        for _, w in ipairs(weaponNames) do
            local d = _G.EquippedData[w]
            local skinTxt = (d and d.Skin and d.Skin ~= "Default") and ("Skin: "..d.Skin) or nil
            local wrapTxt = (d and d.Wrap and d.Wrap ~= "None")  and ("Wrap: "..d.Wrap)  or nil
            if skinTxt or wrapTxt then
                local parts = {}
                if skinTxt then parts[#parts+1]=skinTxt end
                if wrapTxt then parts[#parts+1]=wrapTxt end
                lines[#lines+1] = w.." → "..table.concat(parts, " | ")
            end
        end
        if #lines == 0 then return "No skins or wraps applied yet." end
        return table.concat(lines, "\n")
    end

    SkinsSection2:NewLabel("Use the dropdowns above to pick weapon → skin.")
    SkinsSection2:NewButton("Print Active Skins to Console", "Prints all equipped skins to F9 console", function()
        print("=== Aniha Active Skins ===")
        print(BuildPreviewList())
    end)

    -- ── TAB: WRAPS ────────────────────────────────────────
    local WrapsTab = Window:NewTab("Wraps")
    local WrapsSection = WrapsTab:NewSection("Weapon Wrap Selector")

    local currentWrapWeapon = weaponNames[1]

    WrapsSection:NewDropdown("Weapon##wrap", "Select a weapon to apply a wrap to", weaponNames, function(selected)
        currentWrapWeapon = selected
    end)

    WrapsSection:NewDropdown("Wrap", "Choose a wrap for the selected weapon", WrapList, function(selected)
        if not currentWrapWeapon then return end
        if not _G.EquippedData[currentWrapWeapon] then return end
        _G.EquippedData[currentWrapWeapon].Wrap = selected
        pcall(function() CosmeticLibrary.Equip(currentWrapWeapon, "Wrap", selected) end)
        SaveConfig()
    end)

    WrapsSection:NewButton("Apply Wrap Now", "Force-applies the current wrap selection", function()
        if not currentWrapWeapon then return end
        local d = _G.EquippedData[currentWrapWeapon]
        if d and d.Wrap and d.Wrap ~= "None" then
            pcall(function() CosmeticLibrary.Equip(currentWrapWeapon, "Wrap", d.Wrap) end)
        end
    end)

    WrapsSection:NewButton("Remove Wrap (None)", "Removes wrap from the selected weapon", function()
        if not currentWrapWeapon then return end
        _G.EquippedData[currentWrapWeapon].Wrap = "None"
        pcall(function() CosmeticLibrary.Equip(currentWrapWeapon, "Wrap", "None") end)
        SaveConfig()
    end)

    local WrapsSection2 = WrapsTab:NewSection("Apply Wrap to ALL Weapons")
    WrapsSection2:NewDropdown("Global Wrap", "Apply the same wrap to every weapon at once", WrapList, function(selected)
        for _, w in ipairs(weaponNames) do
            _G.EquippedData[w].Wrap = selected
            pcall(function() CosmeticLibrary.Equip(w, "Wrap", selected) end)
        end
        SaveConfig()
    end)

    -- ── TAB: AIM ASSIST ───────────────────────────────────
    local AimTab = Window:NewTab("Aim Assist")

    local AimSection = AimTab:NewSection("Aim Assist")

    AimSection:NewToggle("Enable Aim Assist", "Softly pulls crosshair toward nearby enemies", function(state)
        SetAimAssist(state)
    end)

    AimSection:NewSlider("Strength", "How hard it pulls (1 = gentle, 20 = strong)", 20, 1, function(val)
        _G.AimAssist.Strength = val
    end)

    AimSection:NewSlider("Detection Range (px)", "Screen-space pixel radius to scan for enemies", 300, 30, function(val)
        _G.AimAssist.Range = val
    end)

    AimSection:NewDropdown("Snap Target", "Where aim assist snaps to on the enemy", {"Head","Torso","Random"}, function(selected)
        _G.AimAssist.TargetMode = selected
    end)

    local SilentSection = AimTab:NewSection("Silent Aim")

    SilentSection:NewSlider("Silent Aim Chance %", "Per-shot chance to snap aim to the nearest target (0 = off)", 100, 0, function(val)
        _G.AimAssist.SilentAimChance = val
    end)

    local HitboxSection = AimTab:NewSection("Hitbox Expansion")

    HitboxSection:NewToggle("Expand Enemy Hitboxes", "Invisible hitbox bubbles — easier to land hits", function(state)
        ApplyHitboxExpand(state, _G.AimAssist.HitboxSize)
    end)

    HitboxSection:NewSlider("Hitbox Size Multiplier (x10)", "15=1.5x  25=2.5x  50=5x (reapplies on change)", 50, 10, function(val)
        _G.AimAssist.HitboxSize = val / 10
        if _G.AimAssist.HitboxExpand then ApplyHitboxExpand(true, _G.AimAssist.HitboxSize) end
    end)

    -- ── TAB: SAVE / MISC ─────────────────────────────────
    local MiscTab = Window:NewTab("Misc")
    local SaveSection = MiscTab:NewSection("Config")

    SaveSection:NewButton("Save Config", "Saves current skins/wraps to file", function()
        SaveConfig()
    end)

    SaveSection:NewButton("Reload Config", "Reloads saved config from file", function()
        LoadConfig()
    end)

    SaveSection:NewButton("Reset All Skins & Wraps", "Clears all equipped skins and wraps", function()
        for _, w in ipairs(weaponNames) do
            _G.EquippedData[w].Skin = "Default"
            _G.EquippedData[w].Wrap = "None"
            pcall(function() CosmeticLibrary.Equip(w, "Skin", "Default") end)
            pcall(function() CosmeticLibrary.Equip(w, "Wrap",  "None") end)
        end
        SaveConfig()
    end)

    local InfoSection = MiscTab:NewSection("Info")
    InfoSection:NewLabel("Aniha Skin Changer v6.0 — Kavo UI Edition")
    InfoSection:NewLabel("Press [K] to toggle the GUI")
    InfoSection:NewLabel("Silent Aim uses mousemoverel — executor must support it")

    print("[+] Aniha Skin Changer v6.0 (Kavo) ready — press K to toggle.")
end)
