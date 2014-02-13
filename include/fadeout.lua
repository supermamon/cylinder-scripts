-- fadeout function
return function (view, percent)
    if percent < 0 then percent = -percent end
    view.alpha = 1 - percent*percent*percent	
end


