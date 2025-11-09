function dostuff() end

if package.loaded then
	dostuff()
elseif package.path then
	dostuff()
elseif package.cpath then
	dostuff()
end
