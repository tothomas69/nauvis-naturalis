-- Gleba Reimagined: Nauvis Naturalis
-- Originally based on Delete Gleba by Leftn
-- Functions below adapted from delete-planet-compatability by Leftn
-- Licensed under Mozilla Public License 2.0
-- https://github.com/Leftn/delete-planet-compatability

require("prototypes.planet.planet")

-- Hides a prototype by name and type from the game
-- Used to remove Gleba-native content without hard-deleting it,
-- which is safer since other mods may still reference these prototypes
function delete_generic(name, type_name)
	if data.raw[type_name] and data.raw[type_name][name] then
		data.raw[type_name][name].hidden = true
	end
end

-- Restores a previously hidden prototype by name and type
function undelete_generic(name, type_name)
	if data.raw[type_name] and data.raw[type_name][name] then
		data.raw[type_name][name].hidden = false
	end
end

-- Removes a space connection route entirely (hard delete is safe here
-- since space connections are not referenced by other prototypes)
function delete_space_connection(name)
	if data.raw["space-connection"] and data.raw["space-connection"][name] then
		data.raw["space-connection"][name] = nil
	end
end

-- Returns whether a planet is currently hidden (i.e. deleted by a mod)
function check_mod(name)
	return data.raw.planet[name] and data.raw.planet[name].hidden
end
