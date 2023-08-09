local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local X = Material.Load({
	Title = "Metro Sex",
	Style = 2,
	SizeX = 500,
	SizeY = 350,
	Theme = "Light",
	ColorOverrides = {
		MainFrame = Color3.fromRGB(235,235,235)
	}
})

local Y = X.New({
	Title = "Visual"
})

local Z = X.New({
	Title = "Misc"
})
local X = X.New({
	Title = "Beta"
})


--Lists
local SportMasterPrice ={
    -- Black Sport Djin
    2150,
    --White Puma
    1530,
    --Black Puma
    1530,
    32500,
    6450,
    6430,
    6440,
    1550,
    1845
}
local SportMasterList ={
    "Чёрная Спортивная Джинсовка 'Puma'",
    --White Puma
    "Белая Футболка 'Puma'",
    --Black Puma
    "Чёрная Футболка 'Puma'",
    "Серый Жилет 'Moncler'",
    "Чёрная Тренажёрная Куртка 'Nike'",
    "Оранжевая Тренажёрная Куртка 'Nike'",
    "Бежевая Тренажёрная Куртка 'Nike'",
    "Чёрные Джоггеры 'Puma'",
    "Чёрные Спортивные Штаны 'Puma'"


}

--Variables
local plr = game:GetService("Players").LocalPlayer
local char = plr.Character

_G.MaxActiv = true
_G.DropedEsp = true
_G.Noclip = true
_G.AutoPick = true
_G.InstBuy = true
_G.SportMast = true

--functions

local D = Z.Dropdown({
	Text = "Auto PickUp Mode:",
	Callback = function(Value)
		Mode = Value
	end,
	Options = {
		"Legit",
		"Teleport"
	},
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Test alert!"
			})
		end
	}
})
Mode = "Legit"

local B = Z.Toggle({
	Text = "Auto PickUp Clotching",
	Callback = function(Value)
	 	if Value then
	        _G.AutoPick = true
	        while  _G.AutoPick == true do
	        	task.wait()
	      		for i,v in pairs(workspace.World.Debris:GetChildren()) do
					if v:IsA("Model") and v.Name ~= "Seller" then
						if v:FindFirstChildOfClass("MeshPart") then
							if v:FindFirstChildOfClass("MeshPart").Name ~= "Primary" then
								local grab = v:FindFirstChildOfClass("MeshPart")
								local chars = game.Players.LocalPlayer.Character
								local distance = (grab.Position - char.HumanoidRootPart.Position).Magnitude
								local cam = workspace.CurrentCamera 
								if distance < 18 and Mode == "Teleport" then 
									chars.HumanoidRootPart.CFrame = grab.CFrame + Vector3.new(0,2,2) 
									cam.CFrame = CFrame.lookAt(cam.CFrame.Position, grab.Position)
									keypress(0x45)
								end

								if distance < 15 and Mode == "Legit" then
									cam.CFrame = CFrame.lookAt(cam.CFrame.Position, grab.Position)
									keypress(0x45)	
								end
							end
						end
					end
				end
	        end
	    else
	       _G.AutoPick = false
	   
	    end
	end,
	Enabled = false
})

local B = Z.Toggle({
	Text = "Droped Clotching Max Distance",
	Callback = function(Value)
		if Value then
            _G.MaxActiv = true
            while _G.MaxActiv == true do
                wait(0.5)
                for i,v in pairs(workspace.World.Debris:GetChildren()) do
                    if v:IsA("Model") and v.Name ~= "Seller" then
                        if v:FindFirstChildOfClass("MeshPart") then
                            if v:FindFirstChildOfClass("MeshPart").Name ~= "Primary" then
                                v:FindFirstChildOfClass("MeshPart").ProximityPrompt.MaxActivationDistance = 10
                            end
                        end
                    end
                end
            end
        else
            _G.MaxActiv = false
            
        end
	end,
	Enabled = false
})

local B = Y.Toggle({
	Text = "Droped Clotching Esp",
	Callback = function(Value)
		if Value then
            _G.DropedEsp = true
            while _G.DropedEsp == true do
                wait(0.1)
                for i,v in pairs(workspace.World.Debris:GetChildren()) do
				    if v:IsA("Model") and v.Name ~= "Seller" then
				        if v:FindFirstChildOfClass("MeshPart") then
				            if v:FindFirstChildOfClass("MeshPart").Name ~= "Primary" then
				                local pr = v:FindFirstChildOfClass("Part")

				                if not pr:FindFirstChild("Highlight") then
				                	local light = Instance.new("Highlight")

				                    light.Parent = sv
				                    light.Parent = pr
				                end
				            end
				        end
				    end
				end
            end
        else
            _G.DropedEsp = false
            
        end
	end,
	Enabled = false
})


local B = Z.Toggle({
	Text = "Auto Grab",
	Callback = function(Value)
	    if Value then
	        _G.AutoGrab = true
	        while _G.AutoGrab == true do
	            wait(0.1)
	            for i,v in pairs(workspace.World.Debris.Stores:GetDescendants()) do
	                if v:FindFirstChildOfClass("Highlight") and v:FindFirstChildOfClass("Highlight").FillTransparency ~= 1 then
	               
	                    fireproximityprompt(v.ProximityPrompt,math.huge)
	             
	                end
	            end
	        end
	    else
	        _G.AutoGrab = false

	    end
	end,
	Enabled = false
})

local B = Z.Toggle({
	Text = "Auto Sell",
	Callback = function(Value)
	    if Value then
	        _G.AutoSell = true
	        while _G.AutoSell == true do
	            wait(0.1)
				for i,v in pairs(workspace.World.Debris.Stores:GetChildren()) do
				    if v:FindFirstChild("BoundingBox") then

				        if game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool") then
				            game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool").Parent = game.Players.LocalPlayer.Character
				        end
				        fireproximityprompt(v.BoundingBox.PurchasePrompt.ProximityPrompt,math.huge)
				    end
				end
	        end
	    else
	        _G.AutoSell = false

	    end
	end,
	Enabled = false
})


local B = Z.Toggle({
	Text = "Instance grab Clotching",
	Callback = function(Value)
	    if Value then
	        _G.InstBuy = true
	        while _G.InstBuy == true do
	            wait(2)
	            for i,v in pairs(game:GetService("Workspace").World.Debris.Stores:GetDescendants()) do
	                if v.Name == "ProximityPrompt" then
	                    v.HoldDuration = 0
	                end
	            end
	        end
	    else
	        _G.InstBuy = false
	        wait(2.5)
	        for i,v in pairs(game:GetService("Workspace").World.Debris.Stores:GetDescendants()) do
	            if v.Name == "ProximityPrompt" then
	                v.HoldDuration = 1
	            end
	        end
	    end
	end,
	Enabled = false
})

local B = X.Toggle({
	Text = "Esp Sport-Master",
	Callback = function(Value)
	 	if Value then
	        _G.SportMast = true
	        while _G.SportMast == true do
	        	task.wait(1)


				for i,v in pairs(workspace.World.Debris.Stores:GetDescendants()) do
				    if v:FindFirstChildOfClass("ProximityPrompt") then
				        if table.find(SportMasterList,v.ProximityPrompt.ObjectText) then
				            local Price = string.gsub(v.ProximityPrompt.ActionText, "(%D)", "")
				            local name = v.ProximityPrompt.ObjectText
				            local index = table.find(SportMasterList,name)
				            if tonumber(Price) < SportMasterPrice[index] then
				            	if not v:FindFirstChild("Highlight") then
					                local light = Instance.new("Highlight")

					                light.Parent = v
					                light.FillColor = Color3.fromRGB(90,150,90)
					             end
				                
				            end
				        end
				    end
				end

	        end
	    else

	       _G.SportMast = false

	    end
	end,
	Enabled = false
})


local C = Z.Slider({
	Text = "WalkSpeed",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
	end,
	Min = 16,
	Max = 37,
	Def = 16
})

while true do
    task.wait(0.05)
                for i,v in pairs(workspace.World.Debris.Stores:GetDescendants()) do
                    if v:FindFirstChildOfClass("ProximityPrompt") then
                        if v.ProximityPrompt.ActionText == "\xd0\x9f\xd0\xbe\xd0\xb2\xd0\xb5\xd1\x81\xd0\xb8\xd1\x82\xd1\x8c" then
                            if v:FindFirstChild("Highlight") then
                                v:FindFirstChild("Highlight"):Remove()
                            end
                        end
                    end
                end
end


