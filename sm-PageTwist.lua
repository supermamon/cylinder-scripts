--[[
- @supermamon | 15 Feb 2014

Tornado v1.0

v1.0 First Release
	
]]
local fade = dofile("inc-supermamon/sm-fade.lua")

local M_PI = 3.14159265

return function(page, offset, width, height)
	local view=page
	
	-- progress tracking
	local percent = offset/width -- progress of completion till the next page
	
	-- rotations
	local tumbles = 0.5					
    local angle = percent*M_PI*2*tumbles	-- 
	
	-- ** PAGE EFFECTS ** --
	local x = percent
    if percent < 0 then x = -x end
    view:translate(x, 0, 0)
    view:rotate(-2/3*angle, 1, 0, 0)
    view:translate(-x, 0, 0)	
	fade(view,percent)
	
		
end
