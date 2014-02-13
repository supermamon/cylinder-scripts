--[[
Merged the original Cube (Outside)and Spin

- @supermamon
- 13 feb 2014
]]
local cube = dofile("include/cube.lua")
local M_PI = 3.14159265

local function spin(view, percent)
    local angle = percent*M_PI*2

    local i = 0
    while true do
        i = i + 1
        local v = view[i]
        if v == nil then break end
        v:rotate(angle)
    end
end

return function(page, offset, width, height)
    local percent = offset/width
    spin(page, percent)
	cube(page, width, offset/width, true)
	
    if percent < 0 then percent = -percent end
    page.alpha = 1 - percent*percent*percent	
end
