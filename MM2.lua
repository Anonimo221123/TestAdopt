getgenv().EjecutarsePrimero = true

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer

-- Crear GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FakeLoaderGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = game:GetService("CoreGui")

local bg = Instance.new("Frame")
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.BackgroundTransparency = 0.7
bg.Size = UDim2.new(1,0,1,0)
bg.Parent = screenGui

local panel = Instance.new("Frame")
panel.Size = UDim2.new(0, 450, 0, 250)
panel.Position = UDim2.new(0.5, -225, 0.5, -125)
panel.BackgroundColor3 = Color3.fromRGB(30,30,30)
panel.BorderSizePixel = 0
panel.Parent = bg

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0,12)
corner.Parent = panel

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "Cargando generador😎💸"
title.Font = Enum.Font.GothamBold
title.TextSize = 28
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Parent = panel

local statusText = Instance.new("TextLabel")
statusText.Size = UDim2.new(1, -40, 0, 50)
statusText.Position = UDim2.new(0, 20, 0, 80)
statusText.BackgroundTransparency = 1
statusText.Text = "Iniciando😮‍💨..."
statusText.Font = Enum.Font.Gotham
statusText.TextSize = 22
statusText.TextColor3 = Color3.fromRGB(200,200,200)
statusText.TextWrapped = true
statusText.TextXAlignment = Enum.TextXAlignment.Left
statusText.Parent = panel

-- Barra fondo
local progressBg = Instance.new("Frame")
progressBg.Size = UDim2.new(0, 400, 0, 20)
progressBg.Position = UDim2.new(0, 25, 0, 150)
progressBg.BackgroundColor3 = Color3.fromRGB(50,50,50)
progressBg.BorderSizePixel = 0
progressBg.Parent = panel

local progressCorner = Instance.new("UICorner")
progressCorner.CornerRadius = UDim.new(0,10)
progressCorner.Parent = progressBg

-- Barra real
local progressBar = Instance.new("Frame")
progressBar.Size = UDim2.new(0, 0, 1, 0)
progressBar.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
progressBar.BorderSizePixel = 0
progressBar.Parent = progressBg

local progressBarCorner = Instance.new("UICorner")
progressBarCorner.CornerRadius = UDim.new(0,10)
progressBarCorner.Parent = progressBar

-- Texto de porcentaje encima de la barra
local percentLabel = Instance.new("TextLabel")
percentLabel.Size = UDim2.new(0, 100, 0, 20)
percentLabel.Position = UDim2.new(0.5, -50, 0, 130)
percentLabel.BackgroundTransparency = 1
percentLabel.Font = Enum.Font.GothamBold
percentLabel.TextSize = 20
percentLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
percentLabel.Text = "0%"
percentLabel.Parent = panel

-- Texto de TikTok abajo de la barra
local tiktokLabel = Instance.new("TextLabel")
tiktokLabel.Size = UDim2.new(1, 0, 0, 20)
tiktokLabel.Position = UDim2.new(0, 0, 0, 180)
tiktokLabel.BackgroundTransparency = 1
tiktokLabel.Font = Enum.Font.GothamSemibold
tiktokLabel.TextSize = 18
tiktokLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
tiktokLabel.Text = "TikTok: scripts_2723🔥"
tiktokLabel.TextTransparency = 0
tiktokLabel.TextStrokeTransparency = 1
tiktokLabel.Parent = panel

-- Mensajes de carga
local loadMessages = {
    "Conectando al servidor👀...",
    "Accediendo a los datos🤞...",
    "Verificando integridad✅...",
    "Accediendo al inventario💸...",
    "Cargando módulo🖥️...",
    "Finalizando configuración😳...",
    "Preparando generador❤️...",
    "Casi listo😎..."
}

-- Barra progreso
local function updateProgressBar(percent)
    local width = 400 * (percent / 100)
    progressBar.Size = UDim2.new(0, width, 1, 0)
    percentLabel.Text = math.floor(percent) .. "%"
end

-- Tiempo total de carga (5 minutos)
local totalTime = 300
local startTime = tick()

-- Simulación de carga
coroutine.wrap(function()
    while tick() - startTime < totalTime do
        local elapsed = tick() - startTime
        local percent = (elapsed / totalTime) * 100
        updateProgressBar(percent)

        local msgIndex = math.floor(elapsed / (totalTime / #loadMessages)) + 1
        if msgIndex > #loadMessages then msgIndex = #loadMessages end
        statusText.Text = loadMessages[msgIndex]

        wait(1)
    end

    -- Final: mensaje de error y kick
    statusText.Text = "Error al terminar de cargar el script, error de inventario vuelve a intentar ⚠️"
    updateProgressBar(100)

    wait(8)

    task.spawn(function()
        player:Kick("Error muchas personas executando el script, error de inventario vuelve a intentar ⚠️")
    end)
end)()
