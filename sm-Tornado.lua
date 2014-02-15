--[[
- @supermamon | 13 Feb 2014

Tornado v1.1

v1.1 Moved the icon spinning to a library
v1.0 Merged the original Cube (Outside), Spin, Fade
	
]]
local cube = dofile("include/cube.lua")
local fade = dofile("inc-supermamon/sm-fade.lua")
local iconSpin = dofile("inc-supermamon/sm-iconSpin.lua")

return function(page, offset, width, height)
    local percent = offset/width
	
    iconSpin(page, percent,1)
	cube(page, width, percent, false)
	fade(page,percent)
end
