--[[
- @supermamon | 13 Feb 2014

FlipIcons (Vertical) v1.0
		
]]
local fade = dofile("inc-supermamon/sm-fade.lua")
local flipIcons = dofile("inc-supermamon/sm-flipIcons.lua")
local stayPut = dofile("inc-supermamon/sm-stayPut.lua")

return function(page, offset, width, height)
    local percent = offset/width
    flipIcons(page, percent, "v")
	fade(page,percent)
	stayPut(page,offset, width)
end
