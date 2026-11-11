local reportResult, _packResults, _unpackResults, environment = ...

return function()
	if environment.Drawing.new(environment.newproxy(true)) then
		reportResult(false, "Drawing.new", "Allowed an invalid drawing to be made from improper argument")
	end
end
