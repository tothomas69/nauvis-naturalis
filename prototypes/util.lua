-- prototypes/util.lua
-- Shared helpers for finding item prototypes without hard-coding their type.
--
-- Why: Factorio 2.1 no longer requires science packs to be "tool" prototypes,
-- so data.raw.tool can be nil (that crashed 1.1.0 on load). Rather than
-- guess which table an item lives in, search every item-like type.

local util = {}

-- Every item subtype (item, tool, capsule, ammo, module, ...). defines.prototypes
-- is available during the data stage; the fallback list covers the types this
-- mod actually touches in case it isn't.
local function item_types()
	if defines and defines.prototypes and defines.prototypes.item then
		local types = {}
		for type_name in pairs(defines.prototypes.item) do
			types[#types + 1] = type_name
		end
		return types
	end
	return {"item", "tool", "capsule"}
end

-- Returns the item prototype called `name`, whatever its type, or nil.
function util.find_item(name)
	for _, type_name in ipairs(item_types()) do
		local by_name = data.raw[type_name]
		if by_name and by_name[name] then
			return by_name[name]
		end
	end
	return nil
end

-- Makes an item non-perishable. Clears both spoil outcomes (an item uses one
-- or the other). If `import_location` is given, it also sets where the item is
-- treated as coming from. Does nothing if the item doesn't exist.
function util.remove_spoilage(name, import_location)
	local item = util.find_item(name)
	if not item then
		return
	end
	item.spoil_ticks = nil
	item.spoil_result = nil
	item.spoil_to_trigger_result = nil
	if import_location then
		item.default_import_location = import_location
	end
end

return util
