--[[
- @supermamon | 15 Feb 2014

Ant Lines (Horizontal) 1.0

Alternating Slide left/right transition

v1.0 First Release
		
]]
local cube = dofile("include/cube.lua")
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
	local row = 0
    while true do
        i = i + 1
        local v = view[i]
        if v == nil then break end
		
		if ((i-1) % 4 == 0) then row = row+1 end
		if (row % 2 == 0) then direction = 1 else direction = -1 end
		
		v:translate(direction*offset, 0, 0)
    end	
	
end
