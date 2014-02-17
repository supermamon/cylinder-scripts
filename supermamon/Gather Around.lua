--[[ ******************************************************************
Gather Around v1.0
by @supermamon (github.com/supermamon/cylinder-scripts/)

Trying to mimic the animation by "that other tweak".
Half-baked.

v1.0 2014-02-17: First release.
		
******************************************************************* ]]
local iconSpin 	= dofile("include/iconSpin.lua")

local saved = false

local icons ={}

local iconsX = {}
local iconsY = {}

local iconsTX = {}
local iconsTY = {}


return function(page, offset, screen_width, screen_height)

	-- get the center of the page
	local cx = page.width/2
	local cy = page.height/2

	-- save the original and target icon positions
	if (saved ~= true) then
		local radius = page.width/2*0.60 -- get 60% of the page
		
		local iconCount = #page.subviews
		local theta = 360/iconCount -- this is the angle in degrees between each icon

		--local px = 0
		--local py = 0		
		local i = 0
		
		while true do
			i = i + 1
			local icon = page[i]
			if icon == nil then break end

			-- target
			angle = theta * i 
			angle = math.rad(angle) -- convert to radians
			
			local px = cx+(radius * math.cos(angle))
			local py = cy-(radius * math.sin(angle))

			icons[i] = {}
				icons[i]["source"] = {}
					icons[i].source["x"] = icon.x
					icons[i].source["y"] = icon.y
		
				icons[i]["target"] = {}
					icons[i].target["x"] = px
					icons[i].target["y"] = py
		end
		saved = true
	end
	
	-- track progress
	local percent = offset/page.width

    local j = 0
    while true do
        j = j + 1
        local icon = page[j]
        if icon == nil then break end
		percent = math.abs(percent) -- TIL:replicate to other pages
		
		-- if p will follow percent, the circle will only form when you reach 100%
		local p = percent*2.5 -- complete the circle in twice as fast
		
		if (p >= 1) then p = 1 end -- stay in a circle, don't exceed 100%
		
		-- calculate each step
		local tx = (p)*(icons[j].target.x - icons[j].source.x)
		local ty = (p)*(icons[j].target.y-icons[j].source.y)

        icon:translate(tx, ty, 0)
		
    end	
	iconSpin(page,percent,1,true)
	
end
