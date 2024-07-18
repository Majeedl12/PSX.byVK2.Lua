setclipboard("https://discord.com/invite/vr7")
            print("link copied to clipoard")

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
OrionLib:MakeNotification({
	Name = "Wait ...",
	Content = "Wait",
	Image = "rbxassetid://4483345998",
	Time = 3
})
local Window = OrionLib:MakeWindow({Name = "VR7 Hubs | Murder Mystery", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
OrionLib:MakeNotification({
	Name = "Script Is Work .",
	Content = "Script Is Work ! VR7 ON TOP",
	Image = "rbxassetid://4483345998",
	Time = 3
})

local Tab = Window:MakeTab({
	Name = "Kill | mm2",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Teleport To Gun | .",
	Callback = function()
	local currentX = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X
	local currentY = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y
	local currentZ = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z	

	if workspace:FindFirstChild("GunDrop") ~= nil then

		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild("GunDrop").CFrame	
		wait(1)	
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(currentX, currentY, currentZ)

	else
OrionLib:MakeNotification({
	Name = "Bro The Gun Is Not There",
	Content = "The Gun is Not There",
	Image = "rbxassetid://4483345998",
	Time = 3
})
	end
end
})

Tab:AddButton({
	Name = "Kill All |.",
	Callback = function()
	if game.Players.LocalPlayer.Backpack:FindFirstChild("Knife") ~= nil then -- Only works if you're the murderer

		local Players = game:GetService("Players")	
		for i, Victim in pairs(Players:GetPlayers()) do
			if Victim.Name ~= game.Players.LocalPlayer.Name then

				repeat wait()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Victim.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
				until
				Victim.Character.Humanoid.Health == 0

			end
		end

	else
OrionLib:MakeNotification({
	Name = "Try Again an error occurred",
	Content = "You must be a killer",
	Image = "rbxassetid://4483345998",
	Time = 3
})
		print("No victims killed")
	end
end
})

local Tab = Window:MakeTab({
	Name = "Farm | mm2",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddToggle({
	Name = "Farm Coins |.",
	Default = false,
	Callback = function(value)
getgenv().Farm = (value)
while getgenv().Farm == true do
			local place = workspace:GetChildren()	
			local currentX = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X
			local currentY = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Y
			local currentZ = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z

			for i,v in pairs(place) do	    
			    local vChildren = v:GetChildren()
			    for i,child in pairs(vChildren) do
			        if child.Name == "CoinContainer" then

						if child.Coin_Server:FindFirstChild("Coin") ~= nil then
				            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = child.Coin_Server.Coin.CFrame
						else
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(currentX, currentY, currentZ)
						end

			        end
			    end	
			end
wait(2)
end
	end    
})

Tab:AddToggle({
	Name = "Farm Coin Aura |.",
	Default = false,
	Callback = function(value)
getgenv().God = (value)
while getgenv().God == true do
local Playeer = game:GetService('Players').LocalPlayer
Playeer.Character.LeftLowerLeg.Size = Vector3.new(15, 2, 2)
Playeer.Character.RightLowerLeg.Size = Vector3.new(15, 2, 2)
Playeer.Character.LeftUpperLeg.Size = Vector3.new(15, 2, 2)
Playeer.Character.RightUpperLeg.Size = Vector3.new(15, 2, 2)
Playeer.Character.RightFoot.Size = Vector3.new(15, 2, 2)
Playeer.Character.LeftFoot.Size = Vector3.new(15, 2, 2)
Playeer.Character.LeftLowerLeg.CanCollide = true
Playeer.Character.RightLowerLeg.CanCollide = true
Playeer.Character.LeftUpperLeg.CanCollide = true
Playeer.Character.RightUpperLeg.CanCollide = true
Playeer.Character.RightFoot.CanCollide = true
Playeer.Character.LeftFoot.CanCollide = true
Playeer.Character.LeftLowerLeg.Transparency = 1
Playeer.Character.RightLowerLeg.Transparency = 1
Playeer.Character.LeftUpperLeg.Transparency = 1
Playeer.Character.RightUpperLeg.Transparency = 1
Playeer.Character.RightFoot.Transparency = 1
Playeer.Character.LeftFoot.Transparency = 1
wait(10)
end
	end    
})

local Tab = Window:MakeTab({
	Name = "ESP | mm2",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
 Name = "ESP All | .",
 Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/M7majed/ScriptsByM7/main/ESP_majedLocalend.LUA"))()
   end    
})

Tab:AddButton({
 Name = "Esp Name Murder |.",
 Callback = function()
        local players = game.Players:GetPlayers()

for i,v in ipairs(players) do
  if v.Backpack:FindFirstChild("Knife") or (v.Character and v.Character:FindFirstChild("Knife")) then
  game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v.Name .. " is the murderer!", "normalchat")
break
  end
end
   end    
})

Tab:AddButton({
	Name = "Esp Name Sherrif |.",
	Callback = function()
	local players = game.Players:GetPlayers()

for i,v in ipairs(players) do
  if v.Backpack:FindFirstChild("Gun") or (v.Character and v.Character:FindFirstChild("Gun")) then
  game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(v.Name .. " is the sheriff!", "normalchat")
break
  end
end
end
})

Tab:AddButton({
	Name = "Respawn |.",
	Callback = function()
	game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)
end
})

local Tab = Window:MakeTab({
	Name = " Misc | mm2",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddToggle({
	Name = " God Mode Not dying |. ",
	Default = false,
	Callback = function(value)
getgenv().God = (value)
while getgenv().God == true do
game.Players.LocalPlayer.Character.Humanoid:Remove()
Instance.new('Humanoid', game.Players.LocalPlayer.Character)
game:GetService("Workspace")[game.Players.LocalPlayer.Name]:FindFirstChildOfClass(
'Humanoid').HipHeight = 2
wait(10)
end
	end    
})


Tab:AddButton({
	Name = "Fly Script |.",
	Callback = function()
	loadstring(game:HttpGet('https://pastebin.com/raw/YSL3xKYU'))()
end
})

Tab:AddButton({
	Name = "Script Admin |.",
	Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end
})

Tab:AddButton({
	Name = "Script Admin 2 |.",
	Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/BloodyBurns/Hex/main/Iv%20Admin%20v3.lua'))()
end
})

local Tab = Window:MakeTab({
	Name = "Fun | mm2",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Auto Fling |.",
	Callback = function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Auto%20Fling%20Player'))()
end
})

Tab:AddButton({
	Name = "Script Teleport |.",
	Callback = function()
	-- Load the Kavo UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- Create a new window with the DarkTheme
local Window = Library.CreateLib("VR7 TELEPORT", "BloodTheme")

-- Create a new tab in the window
local Tab = Window:NewTab("Teleport")

-- Create a new section in the tab
local Section = Tab:NewSection("Teleport To Player")

-- Create a textbox for the player's username
Section:NewTextBox("Name Player", "Enter the username of the player you want to teleport to", function(username)
    -- Store the entered username for later use
    _G.targetUsername = username
end)

-- Create a button that will teleport the player when clicked
Section:NewButton("Teleport |.", "Teleport to the entered player", function()
    -- Get the Players service
    local Players = game:GetService("Players")

    -- Get the local player
    local player = Players.LocalPlayer

    -- Find the target player in the game
    local targetPlayer = Players:FindFirstChild(_G.targetUsername)

    -- Check that the target player exists and has a character
    if targetPlayer and targetPlayer.Character then
        -- Teleport the player to the target player
        player.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
    else
        print("Target player not found or does not have a character.")
    end
end)
end
})

Tab:AddButton({
	Name = "Fling All |.",
	Callback = function()
	print("Before the while loop")



local Targets = {"All"} -- "All", "Target Name", "Target name can be shortened"
 
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
 
local AllBool = falseasa
 
local GetPlayer = function(Name)
    Name = Name:lower()
    if Name == "all" or Name == "others" then
        AllBool = true
        return
    elseif Name == "random" then
        local GetPlayers = Players:GetPlayers()
        if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
        return GetPlayers[math.random(#GetPlayers)]
    elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
        for _,x in next, Players:GetPlayers() do
            if x ~= Player then
                if x.Name:lower():match("^"..Name) then
                    return x;
                elseif x.DisplayName:lower():match("^"..Name) then
                    return x;
                end
            end
        end
    else
        return
    end
end
 
local Message = function(_Title, _Text, Time)
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
end
 
local SkidFling = function(TargetPlayer)
    local Character = Player.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart
 
    local TCharacter = TargetPlayer.Character
    local THumanoid
    local TRootPart
    local THead
    local Accessory
    local Handle
 
    if TCharacter:FindFirstChildOfClass("Humanoid") then
        THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    end
    if THumanoid and THumanoid.RootPart then
        TRootPart = THumanoid.RootPart
    end
    if TCharacter:FindFirstChild("Head") then
        THead = TCharacter.Head
    end
    if TCharacter:FindFirstChildOfClass("Accessory") then
        Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    end
    if Accessoy and Accessory:FindFirstChild("Handle") then
        Handle = Accessory.Handle
    end
 
    if Character and Humanoid and RootPart then
        if RootPart.Velocity.Magnitude < 50 then
            getgenv().OldPos = RootPart.CFrame
        end
        if THumanoid and THumanoid.Sit and not AllBool then
            return Message("Error Occurred", "Targeting is sitting", 5) -- u can remove dis part if u want lol
        end
        if THead then
            workspace.CurrentCamera.CameraSubject = THead
        elseif not THead and Handle then
            workspace.CurrentCamera.CameraSubject = Handle
        elseif THumanoid and TRootPart then
            workspace.CurrentCamera.CameraSubject = THumanoid
        end
        if not TCharacter:FindFirstChildWhichIsA("BasePart") then
            return
        end
 
        local FPos = function(BasePart, Pos, Ang)
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
            RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
            RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
        end
 
        local SFBasePart = function(BasePart)
            local TimeToWait = 0.1
            local Time = tick()
            local Angle = 0
 
            repeat
                if RootPart and THumanoid then
                    if BasePart.Velocity.Magnitude < 50 then
                        Angle = Angle + 100
 
                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
                    else
                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                        task.wait()
 
                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()
                    end
                else
                    break
                end
            until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
        end
 
        workspace.FallenPartsDestroyHeight = 0/0
 
        local BV = Instance.new("BodyVelocity")
        BV.Name = "EpixVel"
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
        BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
 
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
 
        if TRootPart and THead then
            if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                SFBasePart(THead)
            else
                SFBasePart(TRootPart)
            end
        elseif TRootPart and not THead then
            SFBasePart(TRootPart)
        elseif not TRootPart and THead then
            SFBasePart(THead)
        elseif not TRootPart and not THead and Accessory and Handle then
            SFBasePart(Handle)
        else
            return Message("Error Occurred", "Target is missing everything", 5)
        end
 
        BV:Destroy()
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        workspace.CurrentCamera.CameraSubject = Humanoid
 
        repeat
            RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
            Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
            Humanoid:ChangeState("GettingUp")
            table.foreach(Character:GetChildren(), function(_, x)
                if x:IsA("BasePart") then
                    x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                end
            end)
            task.wait()
        until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
        workspace.FallenPartsDestroyHeight = getgenv().FPDH
    else
        return Message("Error Occurred", "Random error", 5)
    end
end
 
if not Welcome then Message("Script by DranghetaSm0ke", "Enjoy!", 5) end
getgenv().Welcome = true
if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end
 
if AllBool then
    for _,x in next, Players:GetPlayers() do
        SkidFling(x)
    end
end
 
for _,x in next, Targets do
    if GetPlayer(x) and GetPlayer(x) ~= Player then
        if GetPlayer(x).UserId ~= 1414978355 then
            local TPlayer = GetPlayer(x)
            if TPlayer then
                SkidFling(TPlayer)
            end
        else
            Message("Error Occurred", "This user is whitelisted! (Owner)", 5)
        end
    elseif not GetPlayer(x) and not AllBool then
        Message("Error Occurred", "Username Invalid", 5)
    end
end
local WhitelistedPlayers = {
    [123456789] = true, -- Replace with the actual UserId of whitelisted players
    [987654321] = true,
}

local function IsPlayerWhitelisted(player)
    local userId = player.UserId
    return WhitelistedPlayers[userId] or false
end

return IsPlayerWhitelisted
end
})


Tab:AddButton({
	Name = "VR7 Murder Mystery 2 |. ",
	Callback = function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/VR7ss/VR7/main/MM2"))()
end
})

local Tab = Window:MakeTab({
	Name = "Credits | mm2",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


Tab:AddButton({
    Name = "Copy My Server Invite Discord |.",
    Callback = function()
    setclipboard("discord.gg/vr7")
            print("link copied to clipoard")
      end
})
local Section = Tab:AddSection({
	Name = "Developers : i.vr7 / 5t77"
})

Tab:AddButton({
    Name = "Copy My User Discord |.",
    Callback = function()
    setclipboard("i.vr7")
            print("link copied to clipoard")
      end
})
