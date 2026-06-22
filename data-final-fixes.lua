-- data-final-fixes.lua
-- Runs after ALL mods have finished their data and data-updates phases.
-- Used here to guarantee spoil_ticks removal sticks, since Space Age
-- re-applies spoilage properties during its own data-updates phase.

if data.raw.tool["agricultural-science-pack"] then
	data.raw.tool["agricultural-science-pack"].spoil_ticks = nil
	data.raw.tool["agricultural-science-pack"].spoil_result = nil
end

if data.raw.capsule["bioflux"] then
	data.raw.capsule["bioflux"].spoil_ticks = nil
	data.raw.capsule["bioflux"].spoil_result = nil
end

if data.raw.capsule["raw-fish"] then
	data.raw.capsule["raw-fish"].spoil_ticks = nil
	data.raw.capsule["raw-fish"].spoil_result = nil
end

if data.raw.item["biter-egg"] then
	data.raw.item["biter-egg"].spoil_ticks = nil
	data.raw.item["biter-egg"].spoil_to_trigger_result = nil
end

if data.raw.item["captive-biter-spawner"] then
	data.raw.item["captive-biter-spawner"].spoil_ticks = nil
	data.raw.item["captive-biter-spawner"].spoil_to_trigger_result = nil
end
