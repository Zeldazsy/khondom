local HttpService = game:GetService("HttpService")
local req = (http and http.request) or request
local LocalPlayer = game.Players.LocalPlayer
uky = nil
inahe = 1

local function ClientId()
    return game:GetService("RbxAnalyticsService"):GetClientId();
end;

local function xfghxfgjxghj(key)
    local requesturl = "https://khondomhub.vercel.app/api/validate-key";
    local postData = {
        key = key,
        hwid = tostring(ClientId())
    }
    local success, response = pcall(function()
        return req({Url=requesturl,Method="POST",Headers={["Content-Type"]="application/json"},Body=HttpService:JSONEncode(postData)});
    end);
    if (success and response and response.Body) then
        local decodedBody = HttpService:JSONDecode(response.Body);
        if (decodedBody.success == true) then
            -- Waiting game to loaded before scripts is getting executed
local W=Instance.new("Message",workspace)
if not game:IsLoaded() and game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character then 
    W.Text='Waiting game to loaded before scripts is getting executed by Xenon Hub and reskin by zenzo hub'
    game.Loaded:Wait()
W:Destroy()
    wait(15)
end

-- Variables or aynthing
local GetService = function(service)
    return game:GetService(service);
end
startTime = tick()
local Players = GetService("Players")
local RunService = GetService("RunService")
local VirtualInputManager = GetService("VirtualInputManager")
local MapFolder = workspace:WaitForChild("map")
local AGoal = MapFolder:WaitForChild("Agoal")
local BGoal = MapFolder:WaitForChild("Bgoal")
local LocalPlayer = Players.LocalPlayer
local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()
local teamA = game.Teams:FindFirstChild("A")
local teamB = game.Teams:FindFirstChild("B")
local char = LocalPlayer.Character
local Rootpart = char and char:FindFirstChild("HumanoidRootPart")
local Goal = LocalPlayer.Team == teamA and BGoal or AGoal
local ReplicatedStorage = GetService("ReplicatedStorage")
warn(ReplicatedStorage)

-- User Interface Setup
local Window = WindUI:CreateWindow({
    Title = "Zenzo Hub | Free Version",
    Icon = "zap",
    Author = "by zelda",
    Folder = "Zelda",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 200,
    HasOutline = true,
})

-- Settings Initializer
local path = "Zelda"
if not isfolder(path) then
    makefolder(path)
end

DefaultConfigName = path .. "/Default-config.json"
ConfigName = path .. "/" .. LocalPlayer.UserId .. "-config.json"
Settings = isfile(ConfigName) and readfile(ConfigName)

getIndentity = getthreadidentity or syn.get_thread_identity
setIdentity = setidentity or syn.set_thread_identity

DefaultSettings = isfile(DefaultConfigName) and readfile(DefaultConfigName)
if DefaultSettings then
    if type(DefaultSettings) == "string" and DefaultSettings:find "{" then
        local Success, Result
        task.spawn(function()
            Success, Result = pcall(function()
                return GetService("HttpService"):JSONDecode(DefaultSettings)
            end)
        end)
        wait(0.1)
        if Success then
            DefaultSettings = Result
        else
            DefaultSettings = nil
        end
    end
end

if Settings then
    if type(Settings) == "string" and Settings:find "{" then
        local Success, Result
        task.spawn(function()
            Success, Result = pcall(function()
                return GetService("HttpService"):JSONDecode(Settings)
            end)
        end)
        wait(0.1)
        if Success then
            Settings = Result
        else
            Settings = {}
        end
    else
        Settings = {}
    end
else
    Settings = {}
end

for i, v in pairs(DefaultSettings or {
    Autogoal = false,
    AutoJoinTeamA = false,
    AutoJoinTeamB = false,
    AutoStealBall = false,
    AutoTeleportToGoal = false,
    timetohop = 5,
}) do
    if Settings[i] == nil then
        Settings[i] = v
    end
end
function saveConfig()
    if not isfolder("Zelda") then
        makefolder("Zelda")
    end
    writefile(ConfigName, GetService("HttpService"):JSONEncode(Settings))
end

function setDefaultConfig()
    if not isfolder("Zelda") then
        makefolder("Zelda")
    end
    writefile(DefaultConfigName, GetService("HttpService"):JSONEncode(Settings))
end

-- Anti AFK
task.spawn(function(InitializeService)
    for i, v in pairs(getconnections(LocalPlayer.Idled)) do
        v:Disable()
    end
    LocalPlayer.Idled:connect(function()
        GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end)
    while wait(300) do
        GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end
end)

-- Funcs

local RealFuncs = {}
local funcName = {}

local Function_Storage = setmetatable({}, {
    __index = function(self, k)
        return rawget(RealFuncs, k)
    end,
    __newindex = function(self, k, v)
        funcName[v] = k
        return rawset(RealFuncs, k, v)
    end,
})

    task.spawn(function()
        while task.wait(1) do
            pcall(function()
                saveConfig()
            end)
        end
    end)

 Function_Storage.IsInGame = function()
    local char = LocalPlayer.Character
    if not char then return end

    local StateFolder = char:FindFirstChild("state")
    if not StateFolder then return end

    local InGameValue = StateFolder:FindFirstChild("ingame")
    if not InGameValue then return end

    return InGameValue.Value
end

 Function_Storage.DisableCollisionBoxes = function()
    local MapFolder = workspace:FindFirstChild("map")
    if not MapFolder then return end

    local GkBarriar = MapFolder:FindFirstChild("gkbarriar")
    local AGoal = MapFolder:FindFirstChild("Agoal")
    local BGoal = MapFolder:FindFirstChild("Bgoal")

    if GkBarriar then
        local ABarriar = GkBarriar:FindFirstChild("A")
        local BBarriar = GkBarriar:FindFirstChild("B")

        if ABarriar then ABarriar.CanCollide = false end
        if BBarriar then BBarriar.CanCollide = false end
    end

    if AGoal then AGoal.CanCollide = false end
    if BGoal then BGoal.CanCollide = false end
end

 Function_Storage.StealBall = function()
    local char = LocalPlayer.Character
    local LocalHumanoidRootPart = char and char:FindFirstChild("HumanoidRootPart")
    local Football = workspace.Terrain:FindFirstChild("Ball")

    if LocalHumanoidRootPart and Football then
        LocalHumanoidRootPart.CFrame = CFrame.new(Football.Position.X, 0, Football.Position.Z)
    end
    
    for _, OtherPlayer in pairs(Players:GetPlayers()) do
        if OtherPlayer.Name ~= LocalPlayer.Name then
            local OtherCharacter = OtherPlayer.Character
            local OtherFootball = OtherCharacter and OtherCharacter:FindFirstChild("Ball")
            local OtherHumanoidRootPart = OtherCharacter and OtherCharacter:FindFirstChild("HumanoidRootPart")
            if OtherFootball and OtherHumanoidRootPart and LocalHumanoidRootPart then
                LocalHumanoidRootPart.CFrame = OtherFootball.CFrame
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
            end
        end
    end
end

 Function_Storage.HasBall = function()
    local char = LocalPlayer.Character
    local Football = char and char:FindFirstChild("Ball")
    if Football then
        return true
    end
    return false
end

 Function_Storage.tptogoal = function()
    if not Rootpart then return end
    Rootpart.CFrame = Goal.CFrame
end

 Function_Storage.joina = function()
        local args = {
        [1] = {
            [1] = {
                [1] = math.random(1,7);
                [2] = "A";
            };
            [2] = "";
        };
    }
    
    ReplicatedStorage:WaitForChild("bridgeNet2", 9e9):WaitForChild("dataRemoteEvent", 9e9):FireServer(unpack(args))
    end

 Function_Storage.joinb = function()
    local args = {
        [1] = {
            [1] = {
                [1] = math.random(1,7);
                [2] = "B";
            };
            [2] = "";
        };
    }
    ReplicatedStorage:WaitForChild("bridgeNet2", 9e9):WaitForChild("dataRemoteEvent", 9e9):FireServer(unpack(args))
end

Function_Storage.AutoJoinTeamA = function()
        if Settings.AutoJoinTeamA == false then Function_Storage.Canceljoin() return end
        task.spawn(function()
            while Settings.AutoJoinTeamA and task.wait(.1) do
                pcall(function()
                    if LocalPlayer.Team ~= teamA then
                        Function_Storage.joina()
                    end
                end)
            end
        end)
    end

Function_Storage.AutoJoinTeamB = function()
    if Settings.AutoJoinTeamB == false then Function_Storage.Canceljoin() return end
    task.spawn(function()
        while Settings.AutoJoinTeamB and task.wait(.1) do
            pcall(function()
                if LocalPlayer.Team ~= teamB then
                    Function_Storage.joinb()
                end
            end)
        end
    end)
end

Function_Storage.Autogoal = function()
    task.spawn(function()
        while Settings.Autogoal and task.wait(.1) do
                if not Settings.Autogoal then return end
                pcall(function()
                    if not Function_Storage.IsInGame() == true then return end
                    Function_Storage.DisableCollisionBoxes()
                    Function_Storage.StealBall()
                    if Function_Storage.HasBall() == true then
                        local char = LocalPlayer.Character
                        local Rootpart = char and char:FindFirstChild("HumanoidRootPart")
                        local Goal = LocalPlayer.Team.Name == "A" and BGoal or AGoal
        
                        if not Rootpart then return end
                        Rootpart.CFrame = Goal.CFrame
                        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
                        VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
                    end
            end)
        end
    end)
end

-- UI Setup

btn = function(tab, title, desc, callback, locked)
        local Button = tab:Button({
            Title = title,
            Desc = desc,
            Callback = callback,
            Locked = locked
        })
    end

tog = function(tab, settingName, title, description, defaultValue)
    tab:Toggle({
        Title = title,
        Desc = description,
        Value = defaultValue,
        Callback = function(state) 
            Settings[settingName] = state
            task.defer(Function_Storage[settingName])
        end
    })
    end

local ButtonTab = Window:Tab({ Title = "Button", Icon = "mouse-pointer-2" })
ButtonTab:Section({ Title = "Teams" })
btn(ButtonTab, "Join Team A", "Click to join team A", function()
    Function_Storage.joina()
end, false)
btn(ButtonTab, "Join Team B", "Click to join team B", function()
    Function_Storage.joinb()
end, false)
ButtonTab:Section({ Title = "Ball" })
btn(ButtonTab, "Steal Ball", "Click to steal the ball", function()
    Function_Storage.StealBall()
end, false) 
ButtonTab:Section({ Title = "Goal" })
btn(ButtonTab, "Teleport To Goal", "Click to tp to goal", function()
    Function_Storage.tptogoal()
end, false)

-- Toggle
local ToggleTab = Window:Tab({ Title = "Toggle", Icon = "toggle-left" })
ToggleTab:Section({ Title = "Auto Join Team" })
tog(ToggleTab, "AutoJoinTeamA", "Auto Join Team A", "Automentic join team A, if you not in team A", Settings.AutoJoinTeamA)
tog(ToggleTab, "AutoJoinTeamB", "Auto Join Team B", "Automentic join team B, if you not in team B", Settings.AutoJoinTeamB)
ToggleTab:Section({ Title = "Auto farm" })
tog(ToggleTab, "Autogoal", "Auto goal", "Automentic farm, by steal ball and teleport to goal", Settings.Autogoal)
ToggleTab:Section({ Title = "Automantic" })
ToggleTab:Toggle({
    Title = "Auto Steal Ball",
    Desc = "Automentic steal ball",
    Value = Settings.AutoStealBall,
    Callback = function(state) 
        Settings.AutoStealBall = state
        task.spawn(function()
            while Settings.AutoStealBall and task.wait(.1) do
                pcall(function()
                    Function_Storage.StealBall()
                end)
            end
        end)
    end
})
ToggleTab:Toggle({
    Title = "Auto Teleport To Goal",
    Desc = "Automentic teleport to goal",
    Value = Settings.AutoTeleportToGoal,
    Callback = function(state) 
        Settings.AutoTeleportToGoal = state
        task.spawn(function()
            while Settings.AutoTeleportToGoal and task.wait(.1) do
                pcall(function()
                    Function_Storage.tptogoal()
                end)
            end
        end)
    end
})

-- Server
local ServersTab = Window:Tab({ Title = "Servers", Icon = "boxes" })
ServersTab:Section({ Title = "Server Controls" })

btn(ServersTab, "Rejoin", "Rejoin This Server", function()
    W.Text='Rejoining...'
    GetService("TeleportService"):Teleport(game.PlaceId,LocalPlayer)
end, false)
btn(ServersTab, "Hop Server", "Join Random Server", function()
    W.Text='Hopping...'
    while true and task.wait(.1) do
    local t = 4
    if #GetService("Players"):GetPlayers() <= t then
        local s, p, sId = GetService("TeleportService"), game.JobId, game.PlaceId
        local g = GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. sId .. "/servers/Public?sortOrder=Asc&limit=100"))
        for _, d in ipairs(g.data) do
            if d.id ~= p and d.playing < d.maxPlayers then
                s:TeleportToPlaceInstance(sId, d.id, GetService("Players").LocalPlayer)
                return
            end
        end
    end
end
end, false)

ServersTab:Slider({
    Title = "Time To Hop'm",
    Desc = "Time to hop servers(minutes)",
    Step = 1,
    Value = {
        Min = 1,
        Max = 120,
        Default = Settings.timetohop,
    },
    Callback = function(value)
        Settings.timetohop = value
    end
})

ServersTab:Toggle({
    Title = "Auto Hop Server",
    Desc = "Automentic hop servers by time you set",
    Value = Settings.AutoStealBall,
    Callback = function(state) 
        Settings.AutoStealBall = state
        task.spawn(function()
            while Settings.AutoStealBall and task.wait(.1) do
                pcall(function()
                    if tick() - startTime >= Settings.timetohop * 60 then
                        local s, p, sId = GetService("TeleportService"), game.JobId, game.PlaceId
                        local g = GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. sId .. "/servers/Public?sortOrder=Asc&limit=100"))
                        for _, d in ipairs(g.data) do
                            if d.id ~= p and d.playing < d.maxPlayers then
                                GetService("Players").LocalPlayer.OnTeleport:Connect(function(state)
                                    if state == Enum.TeleportState.Started then
                                        queue_on_teleport([[loadstring(game:HttpGet("https://raw.githubusercontent.com/Zeldazsy/Zenzo/loadder/.lua"))()]]) -- ใส่ลิงก์โหลดสคริปต์ใหม่
                                    end
                                end)
                                s:TeleportToPlaceInstance(sId, d.id, GetService("Players").LocalPlayer)
                                return
                            end
                        end
                        task.wait(3)
                end
                end)
            end
        end)
    end
})

-- Theme
Window:Divider()
local CreateThemeTab = Window:Tab({ Title = "Theme", Icon = "palette" })

local currentThemeName = WindUI:GetCurrentTheme()
local themes = WindUI:GetThemes()

local ThemeAccent = themes[currentThemeName].Accent
local ThemeOutline = themes[currentThemeName].Outline
local ThemeText = themes[currentThemeName].Text
local ThemePlaceholderText = themes[currentThemeName].PlaceholderText

function updateTheme()
    WindUI:AddTheme({
        Name = currentThemeName,
        Accent = ThemeAccent,
        Outline = ThemeOutline,
        Text = ThemeText,
        PlaceholderText = ThemePlaceholderText
    })
    WindUI:SetTheme(currentThemeName)
end

local CreateInput = CreateThemeTab:Input({
    Title = "Theme Name",
    Value = currentThemeName,
    Callback = function(name)
        currentThemeName = name
    end
})

CreateThemeTab:Colorpicker({
    Title = "Background Color",
    Default = Color3.fromHex(ThemeAccent),
    Callback = function(color)
        ThemeAccent = color:ToHex()
    end
})

CreateThemeTab:Colorpicker({
    Title = "Outline Color",
    Default = Color3.fromHex(ThemeOutline),
    Callback = function(color)
        ThemeOutline = color:ToHex()
    end
})

CreateThemeTab:Colorpicker({
    Title = "Text Color",
    Default = Color3.fromHex(ThemeText),
    Callback = function(color)
        ThemeText = color:ToHex()
    end
})

CreateThemeTab:Colorpicker({
    Title = "Placeholder Text Color",
    Default = Color3.fromHex(ThemePlaceholderText),
    Callback = function(color)
        ThemePlaceholderText = color:ToHex()
    end
})

CreateThemeTab:Button({
    Title = "Update Theme",
    Callback = function()
        updateTheme()
    end
})
Window:SelectTab(2)
    print("Successfully authorized with key: " .. key)
    uky = 1
    else
        local path = "Zelda"
        DefaultConfigName = path .. "/keys.json"
        ConfigName = path .. "/" .. LocalPlayer.UserId .. "-keys.json"
        keyx = isfile(ConfigName) and readfile(ConfigName)
    
        if keyx then
            deletefile(ConfigName)
        end
        LocalPlayer:Kick("Key is invalid or expired.")
        end
    end
end

local functions = {print,warn,error,writefile,makefolder,rconsoleprint,setclipboard,rconsoleerr,rconsolewarn}
local hell_nah = {"githubusercontent","LRHUBEDIT"}
local function RandomString(length)
  local randomString = ""
  for i = 1, length do
    local randomNumber = math.random(97, 122)
    randomString = randomString .. string.char(randomNumber)
  end
  return tostring(randomString)
end
local function CheckForSpy()
  local core = game:GetService("CoreGui")
  local keyword = "spy"
  for _, v in pairs(core:GetDescendants()) do
    if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
      if string.find(string.lower(v.Name), string.lower(keyword)) or string.find(string.lower(v.Text), string.lower(keyword)) then
        while true do end
      end
    end
  end
end
for i,v in pairs(functions) do
  local old
  old = hookfunction(v, function(...)
    local content = {...}
    for i2,v2 in pairs(content) do
      for i3,v3 in pairs(hell_nah) do
        if string.find(string.lower(tostring(i2)),string.lower(tostring(v3))) or string.find(string.lower(tostring(v2)),string.lower(tostring(v3))) then
          print("Nigga ass dumb")
          content = " So Let's raise the bar"
          while true do end
            return
          end
      end
    end
    return old(...)
  end)
end
CheckForSpy()
game:GetService("CoreGui").ChildAdded:Connect(function()
  CheckForSpy()
end)

pcall(game.HttpGet, game, setmetatable({}, {
  __tostring = function()
    print("Kick Player")
    return ""
  end,
}))

task.spawn(function()
    local path = "Zelda"
    DefaultConfigName = path .. "/keys.json"
    ConfigName = path .. "/" .. LocalPlayer.UserId .. "-keys.json"
    keyx = isfile(ConfigName) and readfile(ConfigName)

    if keyx then
        local success, response = pcall(function()
            return HttpService:JSONDecode(keyx)
        end)
        if success and response then
            key = response.key
            xfghxfgjxghj(key)
    end;
end;
end)

if not uky == inahe then
local UIS = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "KeyUI"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

local clickSound = Instance.new("Sound")
clickSound.SoundId = "rbxassetid://9118823100"
clickSound.Volume = 0.5
clickSound.Parent = gui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 160)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Parent = gui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0, 10)
frameCorner.Parent = frame

local titleBar = Instance.new("TextLabel")
titleBar.Size = UDim2.new(1, -30, 0, 30)
titleBar.Position = UDim2.new(0, 10, 0, 0)
titleBar.BackgroundTransparency = 1
titleBar.Text = "Key System"
titleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
titleBar.TextSize = 20
titleBar.Font = Enum.Font.GothamBold
titleBar.TextXAlignment = Enum.TextXAlignment.Left
titleBar.Parent = frame

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(1, -30, 0, 3)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = frame

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(1, -20, 0, 35)
keyInput.Position = UDim2.new(0, 10, 0, 35)
keyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
keyInput.Text = ""
keyInput.PlaceholderText = "Paste Key"
keyInput.TextColor3 = Color3.fromRGB(200, 200, 200)
keyInput.TextSize = 16
keyInput.Font = Enum.Font.Gotham
keyInput.ClearTextOnFocus = true
keyInput.Parent = frame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 6)
inputCorner.Parent = keyInput

local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(0.5, -15, 0, 35)
submitBtn.Position = UDim2.new(0, 10, 0, 85)
submitBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
submitBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
submitBtn.Text = "Submit"
submitBtn.TextSize = 16
submitBtn.Font = Enum.Font.Gotham
submitBtn.Parent = frame

local submitCorner = Instance.new("UICorner")
submitCorner.CornerRadius = UDim.new(0, 6)
submitCorner.Parent = submitBtn

local getLinkBtn = Instance.new("TextButton")
getLinkBtn.Size = UDim2.new(0.5, -15, 0, 35)
getLinkBtn.Position = UDim2.new(0.5, 5, 0, 85)
getLinkBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
getLinkBtn.TextColor3 = Color3.fromRGB(0, 0, 0)

getLinkBtn.Text = "Get Link"
getLinkBtn.TextSize = 16
getLinkBtn.Font = Enum.Font.Gotham
getLinkBtn.Parent = frame

local linkCorner = Instance.new("UICorner")
linkCorner.CornerRadius = UDim.new(0, 6)
linkCorner.Parent = getLinkBtn

local resultLabel = Instance.new("TextLabel")
resultLabel.Size = UDim2.new(1, -20, 0, 20)
resultLabel.Position = UDim2.new(0, 10, 0, 130)
resultLabel.BackgroundTransparency = 1
resultLabel.Text = ""
resultLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
resultLabel.TextSize = 16
resultLabel.Font = Enum.Font.Gotham
resultLabel.TextWrapped = true
resultLabel.Visible = false
resultLabel.Parent = frame

local function buttonEffect(button)
	clickSound:Play()
end

submitBtn.MouseButton1Click:Connect(function()
	buttonEffect(submitBtn)
local key = keyInput.Text
if key == "" then
    resultLabel.Text = "❌ Please enter a key."
    resultLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    resultLabel.Visible = true
    return
end

local requesturl = "https://khondomhub.vercel.app/api/validate-key";

local postData = {
    key = key,
    hwid = tostring(ClientId())
}
success, response = pcall(function()
    return req({Url=requesturl,Method="POST",Headers={["Content-Type"]="application/json"},Body=HttpService:JSONEncode(postData)});
end);
if (success and response and response.Body) then
    local decodedBody = HttpService:JSONDecode(response.Body);
    if (decodedBody.success == true) then
    resultLabel.Text = "✅ Correct Key!"
    resultLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    resultLabel.Visible = true
    wait(2)
    gui:Destroy()
    local path = "Zelda"
    if not isfolder(path) then
        makefolder(path)
    end
    
    DefaultConfigName = path .. "/keys.json"
    ConfigName = path .. "/" .. LocalPlayer.UserId .. "-keys.json"
    keyx = isfile(ConfigName) and readfile(ConfigName)

    if not isfile(ConfigName) then
        writefile(ConfigName, HttpService:JSONEncode({key = key}))
    end
    if isfile(ConfigName) then
        writefile(ConfigName, HttpService:JSONEncode({key = key}))
    end

    if keyx then
        local success, response = pcall(function()
            return HttpService:JSONDecode(keyx)
        end)
        if success and response then
            key = response.key
        else
            key = nil
        end
    else
        key = nil
    end

    if (key == nil) then
        return false
    end
    if (key == "") then
        return false
    end
    xfghxfgjxghj(key)
else
    resultLabel.Text = "❌" .. " " .. decodedBody.message
    resultLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    resultLabel.Visible = true
end
end
end)

getLinkBtn.MouseButton1Click:Connect(function()
	buttonEffect(getLinkBtn)
setclipboard("https://khondomhub.vercel.app/getkey")
end)

closeBtn.MouseButton1Click:Connect(function()
	buttonEffect(closeBtn)
	gui:Destroy()
end)

local dragging, dragStart, startPos
titleBar.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = frame.Position
	end
end)

titleBar.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = false
	end
end)

UIS.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end);
end
