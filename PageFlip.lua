--[[
PageFlip.lua for Cylinder v1.0

- @supermamon
- 13 Feb 2014
]]
local M_PI = 3.14159265

return function(page, offset, width, height)

	local percent = offset/width
    local angle = percent*M_PI
	local x = percent
    if percent < 0 then x = -x end

    page:translate(x, 0, 0)
    page:rotate(angle, 0, 1, 0)
    
    if percent < 0 then percent = -percent end
    page.alpha = 1 - percent*percent*percent
	
end
