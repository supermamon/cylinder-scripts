--[[
- @supermamon | 15 Feb 2014

Ant Lines (Vertical) 1.0

Alternating Slide up/down transition

v1.0 First Release
		
]]
local fade = dofile("inc-supermamon/sm-fade.lua")
local stayPut = dofile("inc-supermamon/sm-stayPut.lua")
local M_PI = 3.14159265

return function(page, offset, width, height)

	-- some generic stuff
	local view=page 						-- so i can just always use view
	local percent = offset/width 			-- progress of how far ahead till the next page
	
	-- ** PAGE EFFECTS ** --

	stayPut(page,offset, width)
	fade(page,percent)

	-- ** ICON EFFECTS ** --
    local i = 0
	local direction = -1 
    while true do
        i = i + 1
        local v = view[i]
        if v == nil then break end
		
		if (i % 2 == 0) then direction = 1 else direction = -1 end
		v:translate(0, direction*percent*height, 0)
    end	
	
end
