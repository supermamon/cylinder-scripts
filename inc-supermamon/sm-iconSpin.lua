--[[
- @supermamon | 15 Feb 2014

iconSpin function
	view	: assign to page
	percent	: percentage of transition
	tumbles : number or rotations
		
]]
return function (view, percent, tumbles)
	local M_PI = 3.14159265
    local angle = percent*M_PI*2*tumbles

    local i = 0
    while true do
        i = i + 1
        local v = view[i]
        if v == nil then break end
        v:rotate(angle)
    end
end