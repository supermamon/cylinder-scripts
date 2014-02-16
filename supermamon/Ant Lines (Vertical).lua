--[[ ******************************************************************
Ant Lines (Vertical) v1.1
by @supermamon (github.com/supermamon/cylinder-scripts/)

Alternating Slide up/down transition

v1.1 2014-02-16: Compatibility update for Cylinder v0.13.2.15
v1.0 2014-02-15 First Release
		
******************************************************************* ]]
local fade = dofile("include/fade.lua")
local stayPut = dofile("include/stayPut.lua")

-- MAIN --
return function(page, offset, screen_width, screen_height)

	-- track progress
	local percent = offset/page.width
	
	-- ** PAGE EFFECTS ** --
	stayPut(page,offset)
	fade(page,percent)

	-- ** ICON EFFECTS ** --
    local i = 0
	local direction = -1 
    while true do
        i = i + 1
        local icon = page[i]
        if icon == nil then break end
		
		-- reverse the direction alternately 
		if (i % 2 == 0) then direction = 1 else direction = -1 end
		icon:translate(0, direction*percent*page.height, 0)
		
    end	
	
end
