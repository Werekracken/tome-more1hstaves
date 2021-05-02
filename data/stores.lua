local store = loading_list['GATES_STAFF_WEAPON'].store
local filter = {type = 'weapon', subtype = 'staff', id = true, tome_drops = 'store'}
if _G.type(store.filters) == 'function' then
    store.filters = {store.filters()}
 end
table.insert(store.filters, filter)
--- Increase the number of items to make up for the variety.
store.nb_fill = (store.nb_fill or 4) + 2

local store = loading_list['STAFF_WEAPON'].store -- luacheck: ignore 411
local filter = {type = 'weapon', subtype = 'staff', id = true, tome_drops = 'store'} -- luacheck: ignore 411
if _G.type(store.filters) == 'function' then
    store.filters = {store.filters()}
 end
table.insert(store.filters, filter)
--- Increase the number of items to make up for the variety.
store.nb_fill = (store.nb_fill or 4) + 2

