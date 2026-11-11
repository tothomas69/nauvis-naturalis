local util = require("prototypes.util")

-- Spoilage removed permanently — setting gate removed since spoilage has no role in this mod

-- Agricultural science packs no longer spoil — standard Nauvis science pack now
util.remove_spoilage("agricultural-science-pack", "nauvis")

-- Bioflux no longer spoils — crafted and used on Nauvis
util.remove_spoilage("bioflux", "nauvis")

-- Raw fish no longer spoils — used as a crafting ingredient, not a food item
util.remove_spoilage("raw-fish", "nauvis")

-- Biter eggs no longer spoil
util.remove_spoilage("biter-egg", "nauvis")
util.remove_spoilage("captive-biter-spawner")

-- Spoilage item itself is hidden via delete_generic in data-updates.lua
