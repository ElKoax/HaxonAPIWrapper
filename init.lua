local tbl_remove = table.remove
local GetService = game.GetService
local download_url = 

local HttpGet = function(self, url)
    return download_url(url)
end

local GetObjects = function(self, k)
    return { GetService(self, "InsertService"):LoadLocalAsset(k) }
end

local mt = getrawmetatable(game)
local index = mt.__index
local namecall = mt.__namecall

mt.__namecall = function(self, ...)
	local args = { ... }
	local method = tbl_remove(args)
	if checkcaller() then				
		if type(method) == "string" then
			if method == "HttpGet" then
				return HttpGet(self, unpack(args))
			elseif method == "GetObjects" then
				return GetObjects(self, unpack(args))
			end
		end
	end
	return namecall(self, ...)
end)

mt.__index = function(self, k)
	if checkcaller() then
		if type(k) == "string" then
			if k == "HttpGet" then
				return HttpGet
			elseif k == "GetObjects" then
				return GetObjects
			end
		end
	end
	return index(self, k)
end)


getgenv().input = {}
local VIM = game:GetService("VirtualInputManager")
local UIS = game:GetService("UserInputService")
getgenv().input.mouse1click = function(length)
    VIM:SendMouseButtonEvent(UIS:GetMouseLocation().X, UIS:GetMouseLocation().Y, 0, true, nil)
    wait(length)
    VIM:SendMouseButtonEvent(UIS:GetMouseLocation().X, UIS:GetMouseLocation().Y, 0, false, nil)
end
getgenv().input.mouse2click = function(length)
    VIM:SendMouseButtonEvent(UIS:GetMouseLocation().X, UIS:GetMouseLocation().Y, 1, true, nil)
    wait(length or 0.01)
    VIM:SendMouseButtonEvent(UIS:GetMouseLocation().X, UIS:GetMouseLocation().Y, 1, false, nil)
end
getgenv().input.mouse3click = function(length)
    VIM:SendMouseButtonEvent(UIS:GetMouseLocation().X, UIS:GetMouseLocation().Y, 2, true, nil)
    wait(length or 0.01)
    VIM:SendMouseButtonEvent(UIS:GetMouseLocation().X, UIS:GetMouseLocation().Y, 3, false, nil)
end

getgenv().input.mouse1down = function()
    VIM:SendMouseButtonEvent(UIS:GetMouseLocation().X, UIS:GetMouseLocation().Y, 0, true, nil)
end
getgenv().input.mouse1up = function()
    VIM:SendMouseButtonEvent(UIS:GetMouseLocation().X, UIS:GetMouseLocation().Y, 0, false, nil)
end
getgenv().input.mouse2down = function()
    VIM:SendMouseButtonEvent(UIS:GetMouseLocation().X, UIS:GetMouseLocation().Y, 1, true, nil)
end
getgenv().input.mouse2up = function()
    VIM:SendMouseButtonEvent(UIS:GetMouseLocation().X, UIS:GetMouseLocation().Y, 1, false, nil)
end
getgenv().input.mouse3down = function()
    VIM:SendMouseButtonEvent(UIS:GetMouseLocation().X, UIS:GetMouseLocation().Y, 2, true, nil)
end
getgenv().input.mouse3up = function()
    VIM:SendMouseButtonEvent(UIS:GetMouseLocation().X, UIS:GetMouseLocation().Y, 2, false, nil)
end

getgenv().input.movemouserel = function(x,y)
    VIM:SendMouseMoveEvent(UIS:GetMouseLocation().X + x, UIS:GetMouseLocation().Y + y, nil)
end
getgenv().input.mousemoverel = getgenv().movemouserel -- Alias

getgenv().input.movemousepos = function(x,y) -- Moves mouse to absolute position, not relative
    VIM:SendMouseMoveEvent(x, y, nil)
end

getgenv().input.mousescroll = function(amt)
    for i = 1, math.abs(math.floor(amt / 120)) do
    VIM:SendMouseWheelEvent(UIS:GetMouseLocation().X, UIS:GetMouseLocation().Y, amt >= 0, nil)
    end
end

getgenv().input.keytap = function(key, len)
    if (typeof(key) == "Enum") then
        VIM:SendKeyEvent(true, key, false, nil)
        wait(len or 0.01)
        VIM:SendKeyEvent(false, key, false, nil)
    elseif (type(key) == "string") then
        VIM:SendKeyEvent(true, Enum.KeyCode[key], false, nil)
        wait(len or 0.01)
        VIM:SendKeyEvent(false, Enum.KeyCode[key], false, nil)
    end
end
getgenv().input.keypress = getgenv().input.keytap -- Alias

getgenv().input.keydown = function(key)
    if (typeof(key) == "Enum") then
        VIM:SendKeyEvent(true, key, false, nil)
    elseif (type(key) == "string") then
        VIM:SendKeyEvent(true, Enum.KeyCode[key], false, nil)
    end
end

getgenv().input.keyup = function(key)
    if (typeof(key) == "Enum") then
        VIM:SendKeyEvent(false, key, false, nil)
    elseif (type(key) == "string") then
        VIM:SendKeyEvent(false, Enum.KeyCode[key], false, nil)
    end
end
)
print("Done!")
