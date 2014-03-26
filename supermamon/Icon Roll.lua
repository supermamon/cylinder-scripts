--[[ ******************************************************************
Icon Roll v1.0
by @supermamon (github.com/supermamon/cylinder-scripts/)

Same as Spin. In reversed direction. Requested by /u/Sapharodon

v1.0 2014-03-26: First release.
******************************************************************* ]]
return function(page, offset, screen_width, screen_height)
   local percent = offset/page.width
   local angle = -percent*math.pi*2

   for i, icon in subviews(page) do
      icon:rotate(angle)
   end
end