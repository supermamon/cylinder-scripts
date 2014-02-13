M_PI = 3.14159265

local fade = dofile("include/fade.lua")
local flipIcons = dofile("include/flipIcons.lua")
local stayPut = dofile("include/stayPut.lua")

return function(page, offset, width, height)
    local percent = offset/width
    flipIcons(page, percent, "h")
	fade(page,percent)
	stayPut(page,offset, width)
end
