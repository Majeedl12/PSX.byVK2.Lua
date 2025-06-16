-- سكربت معدل بناءً على طلبك، مع التعديلات والتنظيم الكامل
-- إعدادات الواجهة PE
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- عناصر واجهة المستخدم
local ScreenGui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
ScreenGui.Name = "PE"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 400, 0, 300)
Frame.Position = UDim2.new(0.5, -200, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0

-- حماية ضد السحب، الفريز، السرعة، الاغتصاب
local protections = {
    ["Antigrab"] = false,
    ["Antifreeze"] = false,
    ["Antispeed"] = false,
    ["Antirape"] = false,
}

-- إشعارات
local function Notify(msg)
    game.StarterGui:SetCore("SendNotification", {
        Title = "PE System",
        Text = msg,
        Duration = 3
    })
end

-- فلنق وظيفة
local function flingTarget(target)
    if not target or not target:FindFirstChild("HumanoidRootPart") then return end
    local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end

    local BodyGyro = Instance.new("BodyGyro")
    BodyGyro.P = 100000
    BodyGyro.D = 1000
    BodyGyro.MaxTorque = Vector3.new(1, 1, 1) * math.huge
    BodyGyro.CFrame = CFrame.lookAt(root.Position, target.HumanoidRootPart.Position)
    BodyGyro.Parent = root

    local BodyAngularVelocity = Instance.new("BodyAngularVelocity")
    BodyAngularVelocity.AngularVelocity = Vector3.new(0, 100, 0)
    BodyAngularVelocity.MaxTorque = Vector3.new(0, math.huge, 0)
    BodyAngularVelocity.P = 3000
    BodyAngularVelocity.Parent = root

    wait(2)

    BodyGyro:Destroy()
    BodyAngularVelocity:Destroy()
end

-- زر للاختيار والطيران
local dropdown = Instance.new("TextButton", Frame)
dropdown.Size = UDim2.new(0, 200, 0, 30)
dropdown.Position = UDim2.new(0, 10, 0, 10)
dropdown.Text = "اختيار لاعب"
dropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
dropdown.TextColor3 = Color3.new(1, 1, 1)

local flyButton = Instance.new("TextButton", Frame)
flyButton.Size = UDim2.new(0, 100, 0, 30)
flyButton.Position = UDim2.new(0, 220, 0, 10)
flyButton.Text = "طير"
flyButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
flyButton.TextColor3 = Color3.new(1, 1, 1)

local selectedPlayer = nil

dropdown.MouseButton1Click:Connect(function()
    local names = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(names, player.Name)
        end
    end
    selectedPlayer = Players:FindFirstChild(names[1])
    dropdown.Text = "✅ " .. (selectedPlayer and selectedPlayer.Name or "لا أحد")
end)

flyButton.MouseButton1Click:Connect(function()
    if selectedPlayer then
        flingTarget(selectedPlayer.Character)
        Notify("🚀 تم تنفيذ الفلنق على " .. selectedPlayer.Name)
    else
        Notify("❌ اختر لاعب أولاً")
    end
end)

-- حماية بسيطة كمثال
LocalPlayer.CharacterAdded:Connect(function(char)
    char:WaitForChild("HumanoidRootPart")
    if protections["Antigrab"] then
        char.HumanoidRootPart.Anchored = false
    end
end)

Notify("✅ تم تفعيل سكربت PE")
