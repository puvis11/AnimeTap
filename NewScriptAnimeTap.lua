--Script By BakiDan

_G.autotap = false
_G.AutobuyEgg = false
_G.thisvalue = 'myname'
_G.CraftAll = false
_G.AutoRebirth = false
_G.YenTeleport = false
_G.SelectedbuyEgg = false
local remotePatch = game:GetService("ReplicatedStorage")

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Anime Tapper By BakiDan", "DarkTheme")
local Tab = Window:NewTab("Farming")
local Section = Tab:NewSection("AutoTap")


Section:NewToggle("Auto Tap", "AutoClick", function(state)
    _G.autotap = state
    print('Auto Tap is: ', state);
    if state then
        dotap()
    end
end)



local selectedRebirth

local Section = Tab:NewSection("AutoRebirth")

Section:NewDropdown("Rebrith Selected", 'Credit BakiDan', {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19 , 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30}, function(value)
    selectedRebirth = value
    print(value)
end)

Section:NewToggle("AutoRebirth", "AutoRebirth", function(state)
    _G.AutoRebirth = state
    print('Auto Tap is: ', state);
    if state and selectedRebirth then
        AutoRebirth(selectedRebirth)
    end
end)

Section:NewButton("Menu Rebirth", "Menu Rebirth", function()
    local ScreenGui = Instance.new("ScreenGui")
    local ImageButton = Instance.new("ImageButton")

    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    ImageButton.Parent = ScreenGui
    ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ImageButton.Size = UDim2.new(0, 970, 0, 578)
    ImageButton.Image = "rbxassetid://8048611206"
end)

Section:NewButton("Close Menu Rebirth", "Close Menu Rebirth", function()
    game.CoreGui:FindFirstChild("ScreenGui"):Destroy()
end)



local Eggselected
local selectedEgg

local Tab = Window:NewTab("Buy")
local Section = Tab:NewSection("Buy Egg")

Section:NewDropdown("Egg Buy Selected", " asd", {"Predator X Egg", "Naruto Egg", "Candy Egg", "Skelly Egg", "Tokyo Ghoul Egg", "Pumpkin Egg", "My Hero Academia Egg", "Sao Egg", "JoJo Egg", "Dragon Ball Egg", "Demon Slayer Egg", "One Piece Egg", "JoJo Stand Egg", "Attack On Titan Egg", "Sao Ultra Egg", "My Hero Academia Heros Egg", "Jujutsu Egg", "White Clover Egg", "Goblin Slayer Egg"}, function(value)
    Eggselected = value
    print(value)
end)

Section:NewToggle("AutoBuyEgg", "_______", function(state)
    _G.AutobuyEgg = state
    print('Auto Tap is: ', state);
    if state and Eggselected then
        AutobuyEgg(Eggselected)
    end
end)



local Tab = Window:NewTab("Carft All")
local Section = Tab:NewSection("Carft All")

Section:NewToggle("Carft All", "IDK", function(state)
    _G.CraftAll = state
    print('Auto Tap is: ', state);
    if state then
        CraftAll()
    end
end)

local Tab = Window:NewTab("Equip Best")
local Section = Tab:NewSection("Equip Best")

Section:NewButton("Equip Best", "Equip Best", function()
    local A_1 = true
    local Event = game:GetService("ReplicatedStorage").Remotes.Events.EquipBest
    Event:FireServer(A_1)
end)




local Tab = Window:NewTab("Yen")
local Section = Tab:NewSection("AutoYen")

local selectedYen

Section:NewDropdown("Yen Selected World", "Credit BakiDan", {"Naruto", "DemonSlayer", "TokyoGhoul", "AttackOnTitans", "JujutsuKaisen", "SwordArtOnline", "Halloween", "OnePiece", "JoJoStand", "MyHeroAcademia", "StarterYenselectedYen", "VIP", "GoblinSlayer", "WhiteClover", "PredatorX"}, function(value)
    selectedYen = value
    print(value)
end)

Section:NewToggle("Auto Yen", "AutoYen", function(state)
    _G.YenTeleport = state
    print('Auto Tap is: ', state);
    if state and selectedYen then
        YenTeleport(selectedYen)
    end
end)




function AutobuyEgg(Eggselected)
    spawn(function()
        while _G.AutobuyEgg == true do
            local args = {
                [1] = Eggselected,
                [2] = 1,
                [3] = true
            }
            game:GetService("ReplicatedStorage").Remotes.Events.PurchaseEgg:FireServer(unpack(args))
            wait()
        end
    end)
end

function dotap()
    spawn(function()
        while _G.autotap == true do
            local Event = remotePatch.Remotes.Events.Tap
            Event:FireServer()
            local Event = remotePatch.Remotes.Events.UpdateCombo
            Event:FireServer()
            wait()
        end
    end)
end


function YenTeleport(selectedYen)
    spawn(function()
        while _G.YenTeleport == true do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Worlds[selectedYen].Yen.GEMERALD.HumanoidRootPart.CFrame
            wait()
        end
    end)
end

function AutoRebirth(RebirthNumber)
    spawn(function()
        while _G.AutoRebirth == true do
            local A_1 = RebirthNumber
            local Event = game:GetService("ReplicatedStorage").Remotes.Events.Rebirth
            Event:FireServer(A_1)
            wait()
        end
    end)
end






function CraftAll()
    spawn(function()
        while _G.CraftAll == true do
            local A_1 = true
            local Event = game:GetService("ReplicatedStorage").Remotes.Events.CraftAll
            Event:FireServer(A_1)
            wait()
        end
    end)
end



function getCurrentPlayersPDS()
    local plyr = game.Players.LocalPlayer;
    if plyr.Character then 
        return plyr.HumanoidRootPart.Position;
    end
    return false;
end

local Tab = Window:NewTab("Teleport")
local Section = Tab:NewSection("Teleport")

local selectedWorld

Section:NewDropdown("Teleport Selected", "Credit BakiDan", {"Naruto", "DemonSlayer", "TokyoGhoul", "AttackOnTitans", "JujutsuKaisen", "SwordArtOnline", "Halloween", "OnePiece", "JoJoStand", "MyHeroAcademia", "StarterWorld", "VIP", "WhiteClover", "PredatorX"}, function(value)
    selectedWorld = value
    print(value)
end)

Section:NewButton("Teleport", "Teleport", function()
    if selectedWorld then
        teleportTO(selectedWorld)
    end
end)


function teleportTO(NameWorld)
    local A_1 = NameWorld
    local Event = game:GetService("ReplicatedStorage").Remotes.Events.WorldRemote
    Event:FireServer(A_1)
end

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
wait(1)
vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")

--Properties:

ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.Position = UDim2.new(0.0595681369, 0, 0.0822085887, 0)
ImageButton.Size = UDim2.new(0, 847, 0, 470)
ImageButton.Image = "rbxassetid://8031589927"
wait(5)
game.CoreGui:FindFirstChild("ScreenGui"):Destroy()


game.Players.localplayer.Character.Head.Nametag.Frame.Visible = false;