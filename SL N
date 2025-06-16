setclipboard("https://discord.gg/aDexK56tau")

game.StarterGui:SetCore("SendNotification",{
        Title = "تم نسخ رابط سيرفر المطورين";
        Text = "✅";
    })

local GUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/aaaa"))()

local UI = GUI:CreateWindow("RL Team","RedLine")

local Home = UI:addPage("Page 1 ",1,true,6)

-- Label

Home:addLabel("RL Team","Don't use in games with anti cheats")

--- Button

Home:addButton("RESET | ريسيت",function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)

-- Toggle

Home:addToggle("جري | Sprint",function(value)
    if value == false then
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
    else
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 40
    end
end)


local Players = game:GetService("Players")
local selectedPlayerName = nil
local dropdown = nil

-- دالة ترجع قائمة أسماء اللاعبين
local function getPlayerList()
    local list = {}
    for _, player in pairs(Players:GetPlayers()) do
        table.insert(list, player.Name)
    end
    return list
end

-- إنشاء الـ Dropdown
dropdown = Home:addDropdown("اختر اسم اللاعب", getPlayerList(), 1, function(value)
    selectedPlayerName = value
end)

-- زر التنقل
Home:addButton("تنقل الى اللاعب", function()
    local localPlayer = Players.LocalPlayer
    if selectedPlayerName and Players:FindFirstChild(selectedPlayerName) then
        local target = Players[selectedPlayerName]
        if target.Character and target.Character:FindFirstChild("HumanoidRootPart")
            and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
            localPlayer.Character.HumanoidRootPart.CFrame =
                target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, 1)
        end
    else
        warn("اللاعب غير موجود أو لم يتم اختياره.")
    end
end)

-- 🟢 تحديث تلقائي للقائمة لما يدخل أو يطلع لاعب
local function refreshDropdown()
    local updatedList = getPlayerList()
    dropdown:Refresh(updatedList, 1)
end

Players.PlayerAdded:Connect(refreshDropdown)
Players.PlayerRemoving:Connect(refreshDropdown)
-- Textbox

Home:addTextBox("السرعه | Walkspeed","Number here",function(value)
    
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

-- Textbox

Home:addTextBox("Jump Power | قوه النط","Number here",function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)

local PE = UI:addPage("Page 2 ",2,true,6)

   local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

local espBillboards = {}
local highlights = {}
local connections = {}

local function createESP(player)
	if player == Players.LocalPlayer then return end
	if not player.Character or not player.Character:FindFirstChild("Head") then return end
	if espBillboards[player] then return end

	-- اسم الحساب بالأحمر
	local bb = Instance.new("BillboardGui")
	bb.Name = "ESP_Billboard"
	bb.Adornee = player.Character.Head
	bb.Size = UDim2.new(0, 100, 0, 20)
	bb.StudsOffset = Vector3.new(0, 2, 0)
	bb.AlwaysOnTop = true

	local label = Instance.new("TextLabel", bb)
	label.Size = UDim2.new(1, 0, 1, 0)
	label.BackgroundTransparency = 1
	label.Text = player.Name
	label.TextColor3 = Color3.new(1, 0, 0) -- أحمر
	label.TextScaled = true
	label.Font = Enum.Font.SourceSansBold

	bb.Parent = player.Character.Head
	espBillboards[player] = bb

	-- Highlight لامع وواضح
	local highlight = Instance.new("Highlight")
	highlight.Name = "ESP_Highlight"
	highlight.Adornee = player.Character
	highlight.FillColor = Color3.fromRGB(255, 255, 255) -- أبيض لامع
	highlight.OutlineColor = Color3.fromRGB(255, 255, 255) -- إطار أبيض
	highlight.FillTransparency = 0.1 -- أقل شفافية = أكثر لمعان
	highlight.OutlineTransparency = 0 -- الإطار واضح
	highlight.Parent = player.Character

	highlights[player] = highlight
end

-- إزالة كل الكشف
local function removeAllESP()
	for _, bb in pairs(espBillboards) do
		if bb and bb.Parent then
			bb:Destroy()
		end
	end
	for _, h in pairs(highlights) do
		if h and h.Parent then
			h:Destroy()
		end
	end
	espBillboards = {}
	highlights = {}
end

-- تفعيل الكشف
local function enableESP()
	for _, player in pairs(Players:GetPlayers()) do
		createESP(player)
	end

	table.insert(connections, Players.PlayerAdded:Connect(function(p)
		p.CharacterAdded:Connect(function()
			wait(1)
			createESP(p)
		end)
	end))

	table.insert(connections, Players.PlayerRemoving:Connect(function(p)
		if espBillboards[p] then
			espBillboards[p]:Destroy()
			espBillboards[p] = nil
		end
		if highlights[p] then
			highlights[p]:Destroy()
			highlights[p] = nil
		end
	end))

	table.insert(connections, RunService.RenderStepped:Connect(function()
		for _, player in pairs(Players:GetPlayers()) do
			createESP(player)
		end
	end))

	StarterGui:SetCore("SendNotification", {
		Title = "ESP",
		Text = "✅ تم تفعيل الكشف"
	})
end

-- تعطيل الكشف
local function disableESP()
	removeAllESP()
	for _, conn in pairs(connections) do
		conn:Disconnect()
	end
	connections = {}

	StarterGui:SetCore("SendNotification", {
		Title = "ESP",
		Text = "❌ تم إيقاف الكشف"
	})
end

-- Toggle في تاب PE
PE:addToggle("🔍 كشف اللاعبين", function(value)
	if value then
		enableESP()
	else
		disableESP()
	end
end)

PE:addToggle("Fling", function(value)
    if value then
        game.StarterGui:SetCore("SendNotification", {
            Title = "Fling Enabled",
            Text = "Fling has been activated.",
            Duration = 4
        })

        local Targets = {"All"}
        local Players = game:GetService("Players")
        local Player = Players.LocalPlayer
        local AllBool = false

        local GetPlayer = function(Name)
            Name = Name:lower()
            if Name == "all" or Name == "others" then
                AllBool = true
                return
            elseif Name == "random" then
                local GetPlayers = Players:GetPlayers()
                if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
                return GetPlayers[math.random(#GetPlayers)]
            else
                for _,x in next, Players:GetPlayers() do
                    if x ~= Player then
                        if x.Name:lower():match("^"..Name) or x.DisplayName:lower():match("^"..Name) then
                            return x
                        end
                    end
                end
            end
        end

        local SkidFling = function(TargetPlayer)
            local Character = Player.Character
            local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
            local RootPart = Humanoid and Humanoid.RootPart
            local TCharacter = TargetPlayer.Character
            local THumanoid = TCharacter and TCharacter:FindFirstChildOfClass("Humanoid")
            local TRootPart = THumanoid and THumanoid.RootPart
            local THead = TCharacter and TCharacter:FindFirstChild("Head")
            local Accessory = TCharacter and TCharacter:FindFirstChildOfClass("Accessory")
            local Handle = Accessory and Accessory:FindFirstChild("Handle")

            if Character and Humanoid and RootPart then
                if RootPart.Velocity.Magnitude < 50 then
                    getgenv().OldPos = RootPart.CFrame
                end

                local FPos = function(BasePart, Pos, Ang)
                    RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
                    Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
                    RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                    RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
                end

                local SFBasePart = function(BasePart)
                    local TimeToWait = 2
                    local Time = tick()
                    local Angle = 0
                    repeat
                        if RootPart and THumanoid then
                            Angle += 100
                            FPos(BasePart, CFrame.new(0, 1.5, 0), CFrame.Angles(math.rad(Angle),0 ,0))
                            task.wait()
                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()
                        else
                            break
                        end
                    until tick() > Time + TimeToWait
                end

                workspace.FallenPartsDestroyHeight = 0/0

                local BV = Instance.new("BodyVelocity")
                BV.Name = "EpixVel"
                BV.Parent = RootPart
                BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
                BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)

                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

                if TRootPart then
                    SFBasePart(TRootPart)
                elseif THead then
                    SFBasePart(THead)
                elseif Handle then
                    SFBasePart(Handle)
                end

                BV:Destroy()
                Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)

                repeat
                    RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
                    Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
                    Humanoid:ChangeState("GettingUp")
                    for _, x in pairs(Character:GetChildren()) do
                        if x:IsA("BasePart") then
                            x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                        end
                    end
                    task.wait()
                until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
                workspace.FallenPartsDestroyHeight = getgenv().FPDH
            end
        end

        if not getgenv().Welcome then
            getgenv().Welcome = true
        end
        if Targets[1] then
            for _,x in next, Targets do GetPlayer(x) end
        end
        if AllBool then
            for _,x in next, Players:GetPlayers() do
                SkidFling(x)
            end
        end
        for _,x in next, Targets do
            local TPlayer = GetPlayer(x)
            if TPlayer and TPlayer ~= Player then
                SkidFling(TPlayer)
            end
        end

    else
        game.StarterGui:SetCore("SendNotification", {
            Title = "Fling Disabled",
            Text = "Fling has been turned off.",
            Duration = 4
        })
        -- no reset
    end
end)

PE:addButton("سكربت العاده - JerkOff",function()
     loadstring(game:HttpGet("https://pastebin.com/raw/YiSqWZ78"))()
    game.StarterGui:SetCore("SendNotification",{
        Title = "تم الضغط";
        Text = "Clicked✅";
    })
end)

PE:addButton("Script Fly - سكربت طيران",function()
     loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Universal-Fly-V3-16477"))()

    game.StarterGui:SetCore("SendNotification",{
        Title = "تم الضغط";
        Text = "Clicked✅";
    })
end)

    

local PD = UI:addPage("Page 3 ",3,true,6)

PD:addLabel("Script message","Script Made By RL Team")

PD:addButton("Fling Touch",function()
    
local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))();
local Notify = AkaliNotif.Notify;
Notify({
Description = "RL TEAM";
Title = "Made By RL Team :).";
Duration = 10;
});
loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI"))()

    game.StarterGui:SetCore("SendNotification",{
        Title = "تم الضغط";
        Text = "Clicked✅";
    })
end)

PD:addButton("Emotes Free",function()
    

loadstring(game:HttpGet("https://pastebin.com/raw/eCpipCTH"))()

    game.StarterGui:SetCore("SendNotification",{
        Title = "تم الضغط";
        Text = "Clicked✅";
    })
end)



  
 local SK = UI:addPage("Page 4 ",4,true,6)

SK:addButton("Anti Fling - مضاد فلنق",function()
    

-- // Constants \\ --
-- [ Services ] --
local Services = setmetatable({}, {__index = function(Self, Index)
local NewService = game.GetService(game, Index)
if NewService then
Self[Index] = NewService
end
return NewService
end})

-- [ LocalPlayer ] --
local LocalPlayer = Services.Players.LocalPlayer

-- // Functions \\ --
local function PlayerAdded(Player)
   local Detected = false
   local Character;
   local PrimaryPart;

   local function CharacterAdded(NewCharacter)
       Character = NewCharacter
       repeat
           wait()
           PrimaryPart = NewCharacter:FindFirstChild("HumanoidRootPart")
       until PrimaryPart
       Detected = false
   end

   CharacterAdded(Player.Character or Player.CharacterAdded:Wait())
   Player.CharacterAdded:Connect(CharacterAdded)
   Services.RunService.Heartbeat:Connect(function()
       if (Character and Character:IsDescendantOf(workspace)) and (PrimaryPart and PrimaryPart:IsDescendantOf(Character)) then
           if PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 or PrimaryPart.AssemblyLinearVelocity.Magnitude > 100 then
               if Detected == false then
                   game.StarterGui:SetCore("ChatMakeSystemMessage", {
                       Text = "Fling Exploit detected, Player: " .. tostring(Player);
                       Color = Color3.fromRGB(255, 200, 0);
                   })
               end
               Detected = true
               for i,v in ipairs(Character:GetDescendants()) do
                   if v:IsA("BasePart") then
                       v.CanCollide = false
                       v.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
                       v.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                       v.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
                   end
               end
               PrimaryPart.CanCollide = false
               PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
               PrimaryPart.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
           end
       end
   end)
end

-- // Event Listeners \\ --
for i,v in ipairs(Services.Players:GetPlayers()) do
   if v ~= LocalPlayer then
       PlayerAdded(v)
   end
end
Services.Players.PlayerAdded:Connect(PlayerAdded)

local LastPosition = nil
Services.RunService.Heartbeat:Connect(function()
   pcall(function()
       local PrimaryPart = LocalPlayer.Character.PrimaryPart
       if PrimaryPart.AssemblyLinearVelocity.Magnitude > 250 or PrimaryPart.AssemblyAngularVelocity.Magnitude > 250 then
           PrimaryPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
           PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
           PrimaryPart.CFrame = LastPosition

           game.StarterGui:SetCore("ChatMakeSystemMessage", {
               Text = "You were flung. Neutralizing velocity.";
               Color = Color3.fromRGB(255, 0, 0);
           })
       elseif PrimaryPart.AssemblyLinearVelocity.Magnitude < 50 or PrimaryPart.AssemblyAngularVelocity.Magnitude > 50 then
           LastPosition = PrimaryPart.CFrame
       end
   end)
end)

    game.StarterGui:SetCore("SendNotification",{
        Title = "تم التفعيل";
        Text = "Clicked✅";
    })
end)


SK:addButton("Anti Bang | مضاد اغتص.اب",function()
    

loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-anti-bang-21721"))()

    game.StarterGui:SetCore("SendNotification",{
        Title = "احيانا المضاد يشتغل على حسب سكربتات الا.غتصاب";
        Text = "Clicked✅";
    })
end)

SK:addButton("Anti AFK | مضاد افك",function()
    

-- ANTI AFK made by Muscle_legends2021 [Gio]
 
local VirtualUser = game:GetService('VirtualUser')
 
game:GetService('Players').LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
 
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "AntiAFK loaded!",
    Text = "Made by RL Team",
    Button1 = "Team SanD RocK",
    Duration = 5
})
    game.StarterGui:SetCore("SendNotification",{
        Title = "تم الضغط";
        Text = "Clicked✅";
    })
end)

local LND = UI:addPage("Page 5 ",5,true,6)

LND:addLabel("مطورين السكربت","Majed627 / https://discord.gg/aDexK56tau ")

LND:addButton("نسخ رابط سيرفر الديسكورد ، فيه كل شي هناك اضغط للنسخ",function()

    setclipboard("https://discord.gg/aDexK56tau")

game.StarterGui:SetCore("SendNotification",{
        Title = "تم نسخ رابط السيرفر بنجاح";
        Text = "Clicked✅";
    })
end)
    
LND:addButton("اضغط لنسخ يوزر مطور السكربت",function()

    setclipboard("Majed627")

game.StarterGui:SetCore("SendNotification",{
        Title = "تم نسخ اليوزر بنجاح";
        Text = "Clicked✅";
    })
end)
