local class = require"engine.class"

class:bindHook("Entity:loadList", function(self, data)
	if data.file == "/data/general/objects/egos/staves.lua" then
		self:loadList("/data-more1hstaves/staves.lua", data.no_default, data.res, data.mod, data.loaded)
	end
    if data.file == '/data/general/stores/basic.lua' then
		self:loadList('/data-more1hstaves/stores.lua', data.no_default, data.res, data.mod, data.loaded)
	end
end)