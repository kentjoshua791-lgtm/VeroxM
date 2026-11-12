local P, U, R, T = game:GetService("Players").LocalPlayer, game:GetService("UserInputService"), game:GetService("RunService"), game:GetService("TweenService")
local PG = P:WaitForChild("PlayerGui")

local old = PG:FindFirstChild("XLAIAHIRIS_KeySystem") if old then old:Destroy() end
local oldMain = PG:FindFirstChild("XLAIAHIRIS_MainUI") if oldMain then oldMain:Destroy() end
local oldFloat = PG:FindFirstChild("XLAIAHIRIS_Float") if oldFloat then oldFloat:Destroy() end

local A, D, BG, RB, RB2, TX, MU = Color3.fromRGB(90,160,255), Color3.fromRGB(255,70,90), Color3.fromRGB(15,17,21), Color3.fromRGB(26,29,37), Color3.fromRGB(32,36,46), Color3.fromRGB(235,238,245), Color3.fromRGB(120,128,145)

-- =======================================================
-- PALITAN ITO NG DISCORD INVITE LINK MO
local DISCORD_LINK = "https://discord.gg/ILAGAY_MO_DITO"
-- =======================================================

-- KEY UI
local keyGui = Instance.new("ScreenGui", PG)
keyGui.Name, keyGui.ResetOnSpawn, keyGui.IgnoreGuiInset = "XLAIAHIRIS_KeySystem", false, true

local keyFrame = Instance.new("Frame", keyGui)
keyFrame.Size, keyFrame.Position, keyFrame.BackgroundColor3 = UDim2.new(0,300,0,250), UDim2.new(0.5,-150,0.5,-125), BG
Instance.new("UICorner", keyFrame).CornerRadius = UDim.new(0,12)
Instance.new("UIStroke", keyFrame).Color = RB2

local kTitle = Instance.new("TextLabel", keyFrame)
kTitle.Size, kTitle.Position, kTitle.BackgroundTransparency, kTitle.Text, kTitle.TextColor3, kTitle.Font, kTitle.TextSize = UDim2.new(1,0,0,40), UDim2.new(0,0,0,10), 1, "AUTHENTICATION", TX, Enum.Font.GothamBold, 18

local kBox = Instance.new("TextBox", keyFrame)
kBox.Size, kBox.Position, kBox.BackgroundColor3, kBox.Text, kBox.TextColor3, kBox.Font, kBox.TextSize, kBox.PlaceholderText, kBox.PlaceholderColor3 = UDim2.new(0,260,0,36), UDim2.new(0.5,-130,0,60), RB, "", TX, Enum.Font.Gotham, 14, "I-paste ang Key...", MU
Instance.new("UICorner", kBox).CornerRadius = UDim.new(0,6)

local kBtn = Instance.new("TextButton", keyFrame)
kBtn.Size, kBtn.Position, kBtn.BackgroundColor3, kBtn.Text, kBtn.TextColor3, kBtn.Font, kBtn.TextSize = UDim2.new(0,260,0,36), UDim2.new(0.5,-130,0,110), A, "VERIFY", BG, Enum.Font.GothamBold, 14
Instance.new("UICorner", kBtn).CornerRadius = UDim.new(0,6)

-- DISCORD BUTTON (COPY TO CLIPBOARD)
local dBtn = Instance.new("TextButton", keyFrame)
dBtn.Size, dBtn.Position, dBtn.BackgroundColor3, dBtn.Text, dBtn.TextColor3, dBtn.Font, dBtn.TextSize = UDim2.new(0,260,0,30), UDim2.new(0.5,-130,0,160), Color3.fromRGB(88, 101, 242), Color3.fromRGB(255, 255, 255), Enum.Font.GothamBold, 12
dBtn.Text = "Join Discord for Keys"
Instance.new("UICorner", dBtn).CornerRadius = UDim.new(0,6)

local kStatus = Instance.new("TextLabel", keyFrame)
kStatus.Size, kStatus.Position, kStatus.BackgroundTransparency, kStatus.Text, kStatus.TextColor3, kStatus.Font, kStatus.TextSize = UDim2.new(1,0,0,20), UDim2.new(0,0,0,210), 1, "", MU, Enum.Font.GothamBold, 11

dBtn.MouseButton1Click:Connect(function()
    -- Sinusubukang i-copy sa clipboard ang link
    if setclipboard then
        setclipboard(DISCORD_LINK)
        kStatus.Text = "✅ Link Copied! I-paste sa Chrome/Safari."
        kStatus.TextColor3 = A
    else
        kStatus.Text = "Error: Executor does not support clipboard."
        kStatus.TextColor3 = D
    end
end)

-- MAIN SCRIPT FUNCTION
local function loadMainScript(keyType, expireTime)
    local MAX, CAP = 100, 1200
    local SMOOTHNESS = 0.15 
    
    local m, on, noclipOn = 2.0, false, false
    local DV = Color3.fromRGB(40,44,55)

    local gui = Instance.new("ScreenGui", PG)
    gui.Name, gui.ResetOnSpawn, gui.IgnoreGuiInset = "XLAIAHIRIS_MainUI", false, true

    local floatGui = Instance.new("ScreenGui", PG)
    floatGui.Name, floatGui.ResetOnSpawn = "XLAIAHIRIS_Float", false
    local floatBtn = Instance.new("TextButton", floatGui)
    floatBtn.Size, floatBtn.Position, floatBtn.BackgroundColor3, floatBtn.Text, floatBtn.TextColor3, floatBtn.Font, floatBtn.TextSize = UDim2.new(0, 120, 0, 30), UDim2.new(0.5, -60, 0, 10), A, "SHOW UI", BG, Enum.Font.GothamBold, 12
    floatBtn.Visible = false
    floatBtn.Draggable = true
    Instance.new("UICorner", floatBtn).CornerRadius = UDim.new(0, 6)

    local root = Instance.new("Frame", gui)
    root.Size, root.Position, root.BackgroundColor3, root.Active, root.Draggable = UDim2.new(0,520,0,380), UDim2.new(0.5,-260,0.5,-190), BG, true, true
    Instance.new("UICorner", root).CornerRadius = UDim.new(0,14)
    local rs = Instance.new("UIStroke", root) rs.Color, rs.Thickness = DV, 1

    local side = Instance.new("Frame", root)
    side.Size, side.BackgroundColor3 = UDim2.new(0,52,1,0), Color3.fromRGB(18,20,26)
    Instance.new("UICorner", side).CornerRadius = UDim.new(0,14)
    
    local logo = Instance.new("Frame", side)
    logo.Size, logo.Position, logo.BackgroundColor3 = UDim2.new(0,28,0,28), UDim2.new(0.5,-14,0,14), A
    Instance.new("UICorner", logo).CornerRadius = UDim.new(0,8)
    local lt = Instance.new("TextLabel", logo) 
    lt.Size, lt.BackgroundTransparency, lt.Text, lt.TextColor3, lt.Font, lt.TextSize = UDim2.new(1,0,1,0), 1, "X", BG, Enum.Font.GothamBold, 16

    local panel = Instance.new("Frame", root)
    panel.Size, panel.Position, panel.BackgroundColor3 = UDim2.new(1,-52,1,0), UDim2.new(0,52,0,0), BG
    Instance.new("UICorner", panel).CornerRadius = UDim.new(0,14)

    local top = Instance.new("Frame", panel) 
    top.Size, top.Position, top.BackgroundTransparency = UDim2.new(1,-32,0,44), UDim2.new(0,16,0,12), 1
    local title = Instance.new("TextLabel", top) 
    title.Size, title.BackgroundTransparency, title.Text, title.TextColor3, title.Font, title.TextSize, title.TextXAlignment = UDim2.new(0,150,1,0), 1, "XL-AIAH-IRIS", TX, Enum.Font.GothamBold, 16, Enum.TextXAlignment.Left

    local hideBtn = Instance.new("TextButton", top)
    hideBtn.Size, hideBtn.Position, hideBtn.BackgroundColor3, hideBtn.Text, hideBtn.TextColor3, hideBtn.Font, hideBtn.TextSize = UDim2.new(0,60,0,26), UDim2.new(1,-100,0.5,-13), RB, "Hide", A, Enum.Font.GothamBold, 11
    Instance.new("UICorner", hideBtn).CornerRadius = UDim.new(0,4)
    hideBtn.MouseButton1Click:Connect(function() root.Visible = false; floatBtn.Visible = true end)
    floatBtn.MouseButton1Click:Connect(function() root.Visible = true; floatBtn.Visible = false end)

    local cl = Instance.new("TextButton", top) 
    cl.Size, cl.Position, cl.BackgroundColor3, cl.Text, cl.TextColor3, cl.Font, cl.TextSize = UDim2.new(0,26,0,26), UDim2.new(1,-26,0.5,-13), RB, "✕", MU, Enum.Font.GothamBold, 13
    Instance.new("UICorner", cl).CornerRadius = UDim.new(0,6)
    cl.MouseButton1Click:Connect(function() gui:Destroy(); floatGui:Destroy() end)

    local sc = Instance.new("ScrollingFrame", panel)
    sc.Size, sc.Position, sc.BackgroundTransparency, sc.ScrollBarThickness, sc.AutomaticCanvasSize = UDim2.new(1,-32,1,-78), UDim2.new(0,16,0,66), 1, 3, Enum.AutomaticSize.Y
    local sp = Instance.new("UIPadding", sc) sp.PaddingRight, sp.PaddingBottom = UDim.new(0,8), UDim.new(0,8)

    local y = 4
    local function sec(txt) local l = Instance.new("TextLabel", sc) l.Size, l.Position, l.BackgroundTransparency, l.Text, l.TextColor3, l.Font, l.TextSize, l.TextXAlignment = UDim2.new(1,-4,0,20), UDim2.new(0,4,0,y), 1, txt, MU, Enum.Font.GothamBold, 10, Enum.TextXAlignment.Left y = y + 24 end
    local function row(h) local r = Instance.new("Frame", sc) r.Size, r.Position, r.BackgroundColor3 = UDim2.new(1,-4,0,h), UDim2.new(0,0,0,y), RB Instance.new("UICorner", r).CornerRadius = UDim.new(0,8) y = y + h + 4 return r end
    local function lbl(p, txt, x, w) local l = Instance.new("TextLabel", p) l.Size, l.Position, l.BackgroundTransparency, l.Text, l.TextColor3, l.Font, l.TextSize, l.TextXAlignment = UDim2.new(0,w,1,0), UDim2.new(0,x,0,0), 1, txt, TX, Enum.Font.Gotham, 13, Enum.TextXAlignment.Left return l end
    local function tw(o, p, t) T:Create(o, TweenInfo.new(t or 0.18), p):Play() end

    sec("GENERAL")
    
    local rTime = row(30)
    local timeLbl = Instance.new("TextLabel", rTime)
    timeLbl.Size, timeLbl.Position, timeLbl.BackgroundTransparency = UDim2.new(1,0,1,0), UDim2.new(0,10,0,0), 1
    timeLbl.Text, timeLbl.TextColor3, timeLbl.Font, timeLbl.TextSize, timeLbl.TextXAlignment = "Session: Lifetime", A, Enum.Font.GothamBold, 11, Enum.TextXAlignment.Left

    local rSt = row(46)
    local ind = Instance.new("Frame", rSt) ind.Size, ind.Position, ind.BackgroundColor3 = UDim2.new(0,8,0,8), UDim2.new(0,14,0.5,-4), D Instance.new("UICorner", ind).CornerRadius = UDim.new(1,0)
    local stT = lbl(rSt, "Status — inactive", 32, 200)
    local tgl = Instance.new("TextButton", rSt) tgl.Size, tgl.Position, tgl.BackgroundColor3, tgl.Text, tgl.TextColor3, tgl.Font, tgl.TextSize = UDim2.new(0,90,0,28), UDim2.new(1,-104,0.5,-14), RB2, "OFF", MU, Enum.Font.GothamBold, 12
    Instance.new("UICorner", tgl).CornerRadius = UDim.new(0,6)

    local rM = row(46)
    lbl(rM, "Multiplier", 14, 200)
    local mb = Instance.new("TextBox", rM)
    mb.Size, mb.Position, mb.BackgroundColor3, mb.Text, mb.TextColor3, mb.Font, mb.TextSize, mb.ClearTextOnFocus = UDim2.new(0,70,0,28), UDim2.new(1,-170,0.5,-14), RB2, "2.0", TX, Enum.Font.GothamBold, 12, false
    Instance.new("UICorner", mb).CornerRadius = UDim.new(0,6)
    local ab = Instance.new("TextButton", rM)
    ab.Size, ab.Position, ab.BackgroundColor3, ab.Text, ab.TextColor3, ab.Font, ab.TextSize = UDim2.new(0,80,0,28), UDim2.new(1,-90,0.5,-14), RB2, "Apply", A, Enum.Font.GothamBold, 12
    Instance.new("UICorner", ab).CornerRadius = UDim.new(0,6)

    local rSm = row(46)
    lbl(rSm, "Smoothing", 14, 120)
    local sl = Instance.new("TextButton", rSm) sl.Size, sl.Position, sl.BackgroundColor3, sl.Text = UDim2.new(0,150,0,6), UDim2.new(1,-220,0.5,-3), RB2, ""
    Instance.new("UICorner", sl).CornerRadius = UDim.new(1,0)
    local sf = Instance.new("Frame", sl) sf.Size, sf.BackgroundColor3 = UDim2.new(SMOOTHNESS,0,1,0), A Instance.new("UICorner", sf).CornerRadius = UDim.new(1,0)
    local sk = Instance.new("Frame", sl) sk.Size, sk.Position, sk.BackgroundColor3 = UDim2.new(0,12,0,12), UDim2.new(SMOOTHNESS,-6,0.5,-6), TX Instance.new("UICorner", sk).CornerRadius = UDim.new(1,0)
    local sv = Instance.new("TextLabel", rSm) sv.Size, sv.Position, sv.BackgroundTransparency, sv.Text, sv.TextColor3, sv.Font, sv.TextSize = UDim2.new(0,50,1,0), UDim2.new(1,-60,0,0), 1, string.format("%.2f",SMOOTHNESS), MU, Enum.Font.GothamBold, 12

    sec("UTILITIES")
    local rNc = row(42)
    local cbNc = Instance.new("TextButton", rNc) 
    cbNc.Size, cbNc.Position, cbNc.BackgroundColor3, cbNc.Text, cbNc.TextColor3, cbNc.Font, cbNc.TextSize = UDim2.new(0,18,0,18), UDim2.new(0,14,0.5,-9), RB2, "", BG, Enum.Font.GothamBold, 11
    Instance.new("UICorner", cbNc).CornerRadius = UDim.new(0,4)
    lbl(rNc, "NoClip (Walls Only)", 44, 260)

    local function updateActive(s)
        on = s
        if s then tgl.Text = "ON" tw(tgl,{TextColor3=A,BackgroundColor3=Color3.fromRGB(30,50,80)},0.15) tw(ind,{BackgroundColor3=A},0.15) stT.Text = string.format("Status — active · x%.1f", m) stT.TextColor3 = A
        else tgl.Text = "OFF" tw(tgl,{TextColor3=MU,BackgroundColor3=RB2},0.15) tw(ind,{BackgroundColor3=D},0.15) stT.Text = "Status — inactive" stT.TextColor3 = TX end
    end

    local function applyMult()
        local v = tonumber(mb.Text)
        if v and v > 0 and v <= MAX then m = v updateActive(on) tw(ab,{TextColor3=TX},0.08) task.wait(0.15) tw(ab,{TextColor3=A},0.2)
        else tw(mb,{BackgroundColor3=D},0.1) task.wait(0.4) tw(mb,{BackgroundColor3=RB2},0.2) end
    end

    tgl.MouseButton1Click:Connect(function() updateActive(not on) end)
    ab.MouseButton1Click:Connect(applyMult)

    cbNc.MouseButton1Click:Connect(function()
        noclipOn = not noclipOn
        cbNc.Text = noclipOn and "✓" or ""
        tw(cbNc, {BackgroundColor3 = noclipOn and A or RB2}, 0.12)
    end)

    sl.MouseButton1Down:Connect(function()
        local cn
        cn = U.InputChanged:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then
                local p = math.clamp((i.Position.X - sl.AbsolutePosition.X) / sl.AbsoluteSize.X, 0.05, 0.95)
                SMOOTHNESS = p
                sf.Size = UDim2.new(p,0,1,0)
                sk.Position = UDim2.new(p,-6,0.5,-6)
                sv.Text = string.format("%.2f", p)
            end
        end)
        U.InputEnded:Connect(function(i) 
            if (i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch) and cn then cn:Disconnect() end 
        end)
    end)

    U.InputBegan:Connect(function(i, g)
        if g then return end
        if i.KeyCode == Enum.KeyCode.RightShift then updateActive(not on) end
    end)

    local smoothedVelocity = Vector3.zero
    local isPrimed = false

    R.Stepped:Connect(function(_, dt)
        if keyType == "Trial" then
            local timeLeft = expireTime - os.time()
            if timeLeft <= 0 then
                root.Visible = false
                floatBtn.Visible = false
                local expGui = Instance.new("ScreenGui", PG)
                local f = Instance.new("Frame", expGui) f.Size = UDim2.new(0,300,0,100) f.Position = UDim2.new(0.5,-150,0.5,-50) f.BackgroundColor3 = BG
                Instance.new("UICorner", f).CornerRadius = UDim.new(0, 8)
                local t = Instance.new("TextLabel", f) t.Size, t.Text, t.TextColor3 = UDim2.new(1,0,1,0), "TRIAL EXPIRED.", D t.BackgroundTransparency = 1 t.Font = Enum.Font.GothamBold
                task.wait(5)
                gui:Destroy()
                floatGui:Destroy()
                expGui:Destroy()
                return
            else
                local hrs = math.floor(timeLeft / 3600)
                local mins = math.floor((timeLeft % 3600) / 60)
                local secs = timeLeft % 60
                if hrs > 0 then
                    timeLbl.Text = string.format("Session: %02d:%02d:%02d", hrs, mins, secs)
                else
                    timeLbl.Text = string.format("Session: %02d:%02d", mins, secs)
                end
                timeLbl.TextColor3 = timeLeft < 300 and D or A
            end
        end

        local c = P.Character
        if not c then return end
        local hum = c:FindFirstChildOfClass("Humanoid")
        local seat = hum and hum.SeatPart

        if noclipOn then
            for _, v in ipairs(c:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end
            if seat and seat.Parent then for _, v in ipairs(seat.Parent:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end end
        end

        if not seat or not on then isPrimed = false return end
        
        local v = seat.AssemblyLinearVelocity
        local horizontalVel = Vector3.new(v.X, 0, v.Z)
        
        if horizontalVel.Magnitude < 0.1 then isPrimed = false return end
        
        local moveDir = horizontalVel.Unit
        local targetSpeed = horizontalVel.Magnitude * m
        if targetSpeed > CAP then targetSpeed = CAP end
        
        if not isPrimed then
            smoothedVelocity = horizontalVel
            isPrimed = true
        end
        
        local alpha = 1 - math.exp(-dt / (SMOOTHNESS + 0.001))
        local targetVelocity = moveDir * targetSpeed
        smoothedVelocity = smoothedVelocity:Lerp(targetVelocity, alpha)
        
        seat.AssemblyLinearVelocity = Vector3.new(smoothedVelocity.X, V.Y, smoothedVelocity.Z)
    end)
end

-- VERIFY BUTTON
kBtn.MouseButton1Click:Connect(function()
    local input = string.gsub(kBox.Text, "%s+", "")
    kStatus.Text = "Verifying..."
    kStatus.TextColor3 = A
    
    local parts = string.split(input, "_")
    
    if #parts == 3 then
        local keyType = parts[2]
        local expiryValue = parts[3]
        
        if keyType == "LIFE" then
            if expiryValue == "NEVER" then
                kStatus.Text = "Lifetime Key Verified!"
                kStatus.TextColor3 = A
                task.wait(1)
                keyGui:Destroy()
                loadMainScript("Lifetime", 0)
            else
                kStatus.Text = "Invalid Lifetime Key!"
                kStatus.TextColor3 = D
            end
        elseif keyType == "1H" or keyType == "2H" or keyType == "5H" or keyType == "24H" then
            local expireTime = tonumber(expiryValue)
            if expireTime then
                if os.time() > expireTime then
                    kStatus.Text = "Key Expired!"
                    kStatus.TextColor3 = D
                else
                    kStatus.Text = "Trial Key Verified!"
                    kStatus.TextColor3 = A
                    task.wait(1)
                    keyGui:Destroy()
                    loadMainScript("Trial", expireTime)
                end
            else
                kStatus.Text = "Invalid Expiry Time!"
                kStatus.TextColor3 = D
            end
        else
            kStatus.Text = "Invalid Key Type!"
            kStatus.TextColor3 = D
        end
    else
        kStatus.Text = "Invalid Format!"
        kStatus.TextColor3 = D
    end
end)
