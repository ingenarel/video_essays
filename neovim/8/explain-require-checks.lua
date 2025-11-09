function dostuff() end
function search_for_lua_loader() end
function search_for_c_loader() end

if package.loaded then
	dostuff()
elseif search_for_lua_loader() then
	dostuff()
elseif search_for_c_loader() then
	dostuff()
end
