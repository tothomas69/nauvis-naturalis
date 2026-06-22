
-- Spoilage removed permanently — setting gate removed since spoilage has no role in this mod

-- Agricultural science packs no longer spoil — standard Nauvis science pack now
if data.raw.tool["agricultural-science-pack"] then
	data.raw.tool["agricultural-science-pack"].spoil_ticks = nil
	data.raw.tool["agricultural-science-pack"].spoil_result = nil
	data.raw.tool["agricultural-science-pack"].default_import_location = "nauvis"
end

-- Bioflux no longer spoils — crafted and used on Nauvis
if data.raw.capsule["bioflux"] then
	data.raw.capsule["bioflux"].spoil_ticks = nil
	data.raw.capsule["bioflux"].spoil_result = nil
	data.raw.capsule["bioflux"].default_import_location = "nauvis"
end

-- Raw fish no longer spoils — used as a crafting ingredient, not a food item
if data.raw.capsule["raw-fish"] then
	data.raw.capsule["raw-fish"].spoil_ticks = nil
	data.raw.capsule["raw-fish"].spoil_result = nil
	data.raw.capsule["raw-fish"].default_import_location = "nauvis"
end

-- Biter eggs no longer spoil
if data.raw.item["biter-egg"] then
	data.raw.item["biter-egg"].spoil_ticks = nil
	data.raw.item["biter-egg"].spoil_to_trigger_result = nil
	data.raw.item["biter-egg"].default_import_location = "nauvis"
end

if data.raw.item["captive-biter-spawner"] then
	data.raw.item["captive-biter-spawner"].spoil_ticks = nil
	data.raw.item["captive-biter-spawner"].spoil_to_trigger_result = nil
end

-- Spoilage item itself is hidden via delete_generic in data-updates.lua