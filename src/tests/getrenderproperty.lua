local drawing, reportResult, _packResults, _unpackResults, environment = ...

return function()
	if drawing.__OBJECT_EXISTS == false then
		reportResult(false, "Drawing.new", "Couldn't retrieve the correct existence of the drawing[2]")
	end

	local initialColor = environment.getrenderproperty(drawing, "Color")
	if environment.tostring(initialColor) ~= "1, 1, 0" then
		reportResult(false, "getrenderproperty", "Output couldn't match expected Drawing's property")
	end

	environment.setrenderproperty(drawing, "Color", environment.Color3.fromRGB(255, 0, 0))
	if environment.tostring(drawing.Color) ~= "1, 0, 0" then
		reportResult(false, "setrenderproperty", "Failed to set the render's color property")
	end

	local updatedColor = environment.getrenderproperty(drawing, "Color")
	if environment.tostring(updatedColor) ~= "1, 0, 0" then
		reportResult(false, "getrenderproperty", "Output couldn't match new Drawing's color property")
	end

	environment.cleardrawcache()
	environment.task.wait(0.067)
	if drawing.__OBJECT_EXISTS == true then
		reportResult(false, "cleardrawcache", "The object exists after clearing the cache")
	end
end
