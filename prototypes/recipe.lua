
-- Spoilage recycling removed permanently
-- The spoilage toggle setting has been removed; spoilage has no role in this mod
delete_generic("spoilage-recycling", "recipe")

-- Create wood-processing before data-updates.lua references it in the bioflux
-- tech unlock-recipe effect. Vanilla Space Age DOES define this recipe (2 wood ->
-- 1 tree-seed); we overwrite it only to keep our chemical-plant / water-extraction
-- theme, but deliberately preserve the 2:1 ratio. A planted tree yields 4 wood, so
-- at 2 wood per seed each tree pays back 2 seeds and the seed/wood loop self-expands.
-- (Anything above 4 wood/seed makes the loop seed-negative and starves the farm.)
data:extend({{
	type = "recipe",
	name = "wood-processing",
	enabled = false, -- unlocked via bioflux technology effects
	category = "chemistry",
	energy_required = 5,
	allow_productivity = true, -- lets productivity modules boost seed yield per wood
	ingredients = {
		{type = "item", name = "wood", amount = 2},   -- 2:1 wood->seed keeps the loop self-sustaining
		{type = "fluid", name = "water", amount = 20}  -- token water, retains the extraction flavor
	},
	results = {{type = "item", name = "tree-seed", amount = 1}}
}})