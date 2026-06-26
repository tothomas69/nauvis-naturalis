local recycling = require("__quality__.prototypes.recycling")

require("prototypes.item")
require("prototypes.recipe")

-- Start change technologies
if data.raw.technology["agricultural-science-pack"] then
	data.raw.technology["agricultural-science-pack"].prerequisites = {"bioflux"}
	data.raw.technology["agricultural-science-pack"].research_trigger = nil
	data.raw.technology["agricultural-science-pack"].unit =
    {
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
		{"metallurgic-science-pack", 1},
		{"electromagnetic-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 30,
      count = 200
    }
end

if data.raw.technology["heating-tower"] then
	data.raw.technology["heating-tower"].prerequisites = {"agricultural-science-pack", "space-science-pack", "electromagnetic-science-pack", "metallurgic-science-pack"}
	data.raw.technology["heating-tower"].unit =
    {
      ingredients =
      {
        {"agricultural-science-pack", 1},
        {"electromagnetic-science-pack", 1},
        {"metallurgic-science-pack", 1},
        {"space-science-pack", 1}
      },
      time = 30,
      count = 1000
    }
	data.raw.technology["heating-tower"].research_trigger = nil
end

if data.raw.technology["bioflux"] then
	data.raw.technology["bioflux"].prerequisites = {"space-science-pack", "electromagnetic-science-pack", "metallurgic-science-pack"}
	data.raw.technology["bioflux"].research_trigger = nil
	data.raw.technology["bioflux"].unit =
    {
		ingredients =
		{
			{"electromagnetic-science-pack", 1},
			{"metallurgic-science-pack", 1},
			{"space-science-pack", 1},
		},
		time = 30,
		count = 500
    }
	data.raw.technology["bioflux"].effects =
    {
		{
			type = "unlock-recipe",
			recipe = "bioflux"
		},
		{
			type = "unlock-recipe",
			recipe = "wood-processing"
		},
		{
			type = "unlock-recipe",
			recipe = "fish-breeding"
		},
		{
			type = "unlock-recipe",
			recipe = "agricultural-science-pack"
		}
	}
end

if data.raw.technology["plastic-bar-productivity"] then
    data.raw.technology["plastic-bar-productivity"].effects =
    {
		{
			type = "change-recipe-productivity",
			recipe = "plastic-bar",
			change = 0.1
		}
	}
end

if data.raw.technology["rocket-fuel-productivity"] then
    data.raw.technology["rocket-fuel-productivity"].effects =
    {
		{
			type = "change-recipe-productivity",
			recipe = "rocket-fuel",
			change = 0.1
		},
		{
			type = "change-recipe-productivity",
			recipe = "ammonia-rocket-fuel",
			change = 0.1
		}
	}
end

if data.raw.technology["biochamber"] then
	data.raw.technology["biochamber"].prerequisites = {"bioflux"}
	data.raw.technology["biochamber"].research_trigger = nil
	data.raw.technology["biochamber"].unit =
	{
		ingredients =
		{
			{"electromagnetic-science-pack", 1},
			{"metallurgic-science-pack", 1},
			{"space-science-pack", 1},
		},
		time = 30,
		count = 300
	}
	data.raw.technology["biochamber"].effects =
	{
		{
			type = "unlock-recipe",
			recipe = "biochamber"
		}
	}
end

if data.raw.technology["agriculture"] then
	data.raw.technology["agriculture"].prerequisites = {"biochamber"}
	data.raw.technology["agriculture"].research_trigger = nil
	data.raw.technology["agriculture"].unit =
	{
		ingredients =
		{
			{"electromagnetic-science-pack", 1},
			{"metallurgic-science-pack", 1},
			{"space-science-pack", 1},
			{"agricultural-science-pack", 1},
		},
		time = 30,
		count = 500
	}
	data.raw.technology["agriculture"].effects =
	{
		{
			type = "unlock-recipe",
			recipe = "agricultural-tower"
		}
	}
end

if data.raw.technology["captivity"] then
    data.raw.technology["captivity"].effects =
    {
		{
			type = "unlock-recipe",
			recipe = "capture-robot-rocket"
		},
		{
			type = "unlock-recipe",
			recipe = "biter-egg"
		}
	}
end
-- End change technologies

-- Start Recipe editing
if data.raw.recipe["carbon-fiber"] then
	data.raw.recipe["carbon-fiber"].ingredients =
	{
		{type = "item", name = "carbon", amount = 2},
		{type = "item", name = "bioflux", amount = 20}
	}
	data.raw.recipe["carbon-fiber"].category = "chemistry"
	data.raw.recipe["carbon-fiber"].results = {{type="item", name="carbon-fiber", amount=2}}
	data.raw.recipe["carbon-fiber"].surface_conditions = nil
end

if data.raw.recipe["stack-inserter"] then
	data.raw.recipe["stack-inserter"].ingredients =
	{
		{type = "item", name = "processing-unit", amount = 1},
		{type = "item", name = "carbon-fiber", amount = 2},
		{type = "item", name = "bioflux", amount = 10},
		{type = "item", name = "bulk-inserter", amount = 1}
	}
	data.raw.recipe["stack-inserter"].category = "crafting"
	data.raw.recipe["stack-inserter"].results = {{type="item", name="stack-inserter", amount=1}}
end

if data.raw.recipe["agricultural-tower"] then
	-- Rewired crafting recipe: removes Gleba ingredients (spoilage etc)
	-- Mechanical arm machine — gears and electric engines are thematically appropriate
	-- Surface condition removed — craftable on Nauvis
	data.raw.recipe["agricultural-tower"].ingredients =
	{
		{type = "item", name = "steel-plate", amount = 10},
		{type = "item", name = "electronic-circuit", amount = 3},
		{type = "item", name = "iron-gear-wheel", amount = 20},
		{type = "item", name = "electric-engine-unit", amount = 4},
		{type = "item", name = "landfill", amount = 1}
	}
	data.raw.recipe["agricultural-tower"].results = {{type="item", name="agricultural-tower", amount=1}}
	data.raw.recipe["agricultural-tower"].surface_conditions = nil
end

if data.raw.recipe["biochamber"] then
	-- Rewired crafting recipe: removes Gleba ingredients (pentapod eggs etc)
	-- Refined concrete stands in for the glass panels visible in the biochamber animation
	-- Surface condition removed — craftable on Nauvis
	data.raw.recipe["biochamber"].ingredients =
	{
		{type = "item", name = "steel-plate", amount = 10},
		{type = "item", name = "advanced-circuit", amount = 5},
		{type = "item", name = "landfill", amount = 4},
		{type = "item", name = "refined-concrete", amount = 10}
	}
	data.raw.recipe["biochamber"].results = {{type="item", name="biochamber", amount=1}}
	data.raw.recipe["biochamber"].surface_conditions = nil
end

if data.raw.recipe["agricultural-science-pack"] then
	-- Disabled here; unlocked via bioflux technology effects
	data.raw.recipe["agricultural-science-pack"].enabled = false
	data.raw.recipe["agricultural-science-pack"].ingredients = {
		{type = "item", name = "wood", amount = 20},
		{type = "item", name = "tree-seed", amount = 2},
		{type = "item", name = "raw-fish", amount = 3},
		{type = "item", name = "bioflux", amount = 5}
	}
	data.raw.recipe["agricultural-science-pack"].category = "organic"
	data.raw.recipe["agricultural-science-pack"].energy_required = 30
	-- Explicitly set output — 1 pack per craft
	data.raw.recipe["agricultural-science-pack"].results = {{type="item", name="agricultural-science-pack", amount=1}}
	-- Remove spoil time — this is a Nauvis science pack now, not a Gleba perishable
	data.raw.tool["agricultural-science-pack"].spoil_ticks = nil
	data.raw.recipe["agricultural-science-pack"].surface_conditions =
	{
		{
			property = "pressure",
			min = 1000,
			max = 1000
		}
	}
end

if data.raw.recipe["efficiency-module-3"] then
	data.raw.recipe["efficiency-module-3"].ingredients = {
		{type = "item", name = "advanced-circuit", amount = 5},
		{type = "item", name = "processing-unit", amount = 5},
		{type = "item", name = "bioflux", amount = 5},
		{type = "item", name = "efficiency-module-2", amount = 4}
	}
	-- Explicitly set output — 1 module per craft
	data.raw.recipe["efficiency-module-3"].results = {{type="item", name="efficiency-module-3", amount=1}}
end

if data.raw.recipe["fish-breeding"] then
	-- Amplifier loop: bootstrap with hand-caught fish, bioflux acts as
	-- the biological catalyst replacing vanilla's nutrients
	data.raw.recipe["fish-breeding"].ingredients = {
		{type = "item", name = "raw-fish", amount = 2},
		{type = "item", name = "bioflux", amount = 1},
		{type = "fluid", name = "water", amount = 50}
	}
	-- "organic" is the recipe category that runs in the biochamber
	data.raw.recipe["fish-breeding"].category = "organic"
	-- Net gain of 1 fish per craft — slow amplifier, not a fish factory
	data.raw.recipe["fish-breeding"].results = {{type="item", name="raw-fish", amount=3}}
	data.raw.recipe["fish-breeding"].surface_conditions = nil
end

if data.raw.recipe["bioflux"] then
	data.raw.recipe["bioflux"].ingredients =
	{
		{type = "item", name = "tungsten-ore", amount = 3},
		{type = "item", name = "carbon", amount = 4},
		{type = "item", name = "raw-fish", amount = 3},
		{type = "fluid", name = "water", amount = 50}
	}
	data.raw.recipe["bioflux"].category = "organic"
	-- Output is 2 bioflux per craft
	data.raw.recipe["bioflux"].results = {{type="item", name="bioflux", amount=2}}
	data.raw.recipe["bioflux"].surface_conditions = nil
end
if data.raw.recipe["wood-processing"] then
	-- Repurpose the existing wood-processing recipe slot with our new design.
	-- Breaks down wood with water to extract biological material as tree seeds.
	data.raw.recipe["wood-processing"].ingredients = {
		{type = "item", name = "wood", amount = 2},
		{type = "fluid", name = "water", amount = 50}
	}
	-- Runs in a chemical plant — water + organic matter = biological extraction
	data.raw.recipe["wood-processing"].category = "chemistry"
	-- One tree seed per craft, used to plant trees on Nauvis
	data.raw.recipe["wood-processing"].results = {{type="item", name="tree-seed", amount=1}}
else
	-- If the recipe doesn't exist yet, create it from scratch
	data:extend({{
		type = "recipe",
		name = "wood-processing",
		enabled = false, -- unlocked via bioflux technology
		category = "chemistry",
		energy_required = 5,
		ingredients = {
			{type = "item", name = "wood", amount = 2},
			{type = "fluid", name = "water", amount = 50}
		},
		results = {{type="item", name="tree-seed", amount=1}}
	}})
end
-- End Recipe editing

--Start item editing
if data.raw.item["carbon-fiber"] then
	data.raw.item["carbon-fiber"].default_import_location = "nauvis"
end

if data.raw.item["stack-inserter"] then
	data.raw.item["stack-inserter"].default_import_location = "nauvis"
end

if data.raw.item["tree-seed"] then
	data.raw.item["tree-seed"].default_import_location = "nauvis"
end

if data.raw.item["biochamber"] then
	data.raw.item["biochamber"].default_import_location = "nauvis"
end

if data.raw.item["agricultural-tower"] then
	data.raw.item["agricultural-tower"].default_import_location = "nauvis"
end
-- End item editing

--Start Entity editing
if data.raw["simple-entity"]["iron-stromatolite"] then
	data.raw["simple-entity"]["iron-stromatolite"].minable = nil
end

if data.raw["simple-entity"]["copper-stromatolite"] then
	data.raw["simple-entity"]["copper-stromatolite"].minable = nil
end

-- Convert the biochamber from nutrient-burning to electric.
-- Vanilla's biochamber is a burner fueled by nutrients; with the whole nutrient
-- chain removed, that fuel is unobtainable and the machine silently stalls.
-- We swap ONLY the energy_source and leave energy_usage untouched, so the
-- machine's power draw stays at the vanilla rate (no guessed numbers).
if data.raw["assembling-machine"]["biochamber"] then
	data.raw["assembling-machine"]["biochamber"].energy_source =
	{
		type = "electric",
		usage_priority = "secondary-input",
		emissions_per_minute = { pollution = 2 } -- half the token value we discussed
	}
end
-- End entity editing

-- Achievement editing
if data.raw["group-attack-achievement"]["it-stinks-and-they-do-like-it"] then
	data.raw["group-attack-achievement"]["it-stinks-and-they-do-like-it"].entities = {
		"small-wriggler-pentapod",
		"medium-wriggler-pentapod",
		"big-wriggler-pentapod",
		"small-strafer-pentapod",
		"medium-strafer-pentapod",
		"big-strafer-pentapod"
	}
end
--

-- Guard BOTH accesses — nil crash fix
if data.raw.planet["gleba"] then
	data.raw.planet["gleba"].map_gen_settings = nil
	data.raw.planet["gleba"].hidden = true
end

delete_generic("fish-breeding", "technology")
delete_generic("tree-seeding", "technology")
delete_generic("overgrowth-soil", "technology")
delete_generic("bioflux-processing", "technology")
delete_generic("bacteria-cultivation", "technology")
delete_generic("artificial-soil", "technology")
-- biochamber technology kept — restored
delete_generic("jellynut", "technology")
delete_generic("yumako", "technology")
delete_generic("planet-discovery-gleba", "technology")
-- agriculture technology kept — restored
delete_generic("gleba-briefing", "tips-and-tricks-item")
delete_generic("spoilables-result", "tips-and-tricks-item")
delete_generic("agriculture", "tips-and-tricks-item")

delete_generic("yumako-processing", "recipe")
delete_generic("jellynut-processing", "recipe")
delete_generic("artificial-yumako-soil", "recipe")
delete_generic("artificial-jellynut-soil", "recipe")
delete_generic("overgrowth-yumako-soil", "recipe")
delete_generic("overgrowth-jellynut-soil", "recipe")
delete_generic("iron-bacteria", "recipe")
delete_generic("copper-bacteria", "recipe")
delete_generic("iron-bacteria-cultivation", "recipe")
delete_generic("copper-bacteria-cultivation", "recipe")
delete_generic("nutrients-from-spoilage", "recipe")
delete_generic("nutrients-from-yumako-mash", "recipe")
delete_generic("nutrients-from-jelly", "recipe")
delete_generic("nutrients-from-bioflux", "recipe")
delete_generic("pentapod-egg", "recipe")
-- agricultural-tower and biochamber recipes kept — players need to craft both
delete_generic("nutrients-from-fish", "recipe")
delete_generic("nutrients-from-biter-egg", "recipe")
delete_generic("artificial-yumako-soil-recycling", "recipe")
delete_generic("artificial-jellynut-soil-recycling", "recipe")
delete_generic("overgrowth-yumako-soil-recycling", "recipe")
delete_generic("overgrowth-jellynut-soil-recycling", "recipe")
-- biochamber-recycling and agricultural-tower-recycling kept — restored machines
delete_generic("nutrients-recycling", "recipe")
delete_generic("pentapod-egg-recycling", "recipe")
delete_generic("yumako-recycling", "recipe")
delete_generic("jellynut-recycling", "recipe")
delete_generic("iron-bacteria-recycling", "recipe")
delete_generic("copper-bacteria-recycling", "recipe")
delete_generic("yumako-seed-recycling", "recipe")
delete_generic("jellynut-seed-recycling", "recipe")
delete_generic("rocket-fuel-from-jelly", "recipe")
delete_generic("bioplastic", "recipe")
delete_generic("biolubricant", "recipe")
delete_generic("biosulfur", "recipe")
delete_generic("yumako-mash-recycling", "recipe")
delete_generic("jelly-recycling", "recipe")
delete_generic("burnt-spoilage", "recipe")
delete_generic("spoilage", "item")
delete_generic("spoilage-recycling", "recipe")

delete_generic("yumako-seed", "item")
delete_generic("jellynut-seed", "item")
delete_generic("iron-bacteria", "item")
delete_generic("copper-bacteria", "item")
delete_generic("nutrients", "item")
-- agricultural-tower and biochamber items kept — restored machines
delete_generic("artificial-yumako-soil", "item")
delete_generic("artificial-jellynut-soil", "item")
delete_generic("overgrowth-yumako-soil", "item")
delete_generic("overgrowth-jellynut-soil", "item")
delete_generic("pentapod-egg", "item")

delete_generic("yumako", "capsule")
delete_generic("jellynut", "capsule")
delete_generic("jelly", "capsule")
delete_generic("yumako-mash", "capsule")

delete_generic("yumako-tree", "plant")
delete_generic("jellystem", "plant")

delete_generic("slipstack", "tree")
delete_generic("funneltrunk", "tree")
delete_generic("cuttlepop", "tree")
delete_generic("hairyclubnub", "tree")
delete_generic("teflilly", "tree")
delete_generic("lickmaw", "tree")
delete_generic("stingfrond", "tree")
delete_generic("boompuff", "tree")
delete_generic("sunnycomb", "tree")

delete_generic("small-stomper-shell", "simple-entity")
delete_generic("medium-stomper-shell", "simple-entity")
delete_generic("big-stomper-shell", "simple-entity")

delete_generic("artificial-yumako-soil", "tile")
delete_generic("artificial-jellynut-soil", "tile")
delete_generic("overgrowth-yumako-soil", "tile")
delete_generic("overgrowth-jellynut-soil", "tile")

delete_generic("small-stomper-pentapod", "spider-unit")
delete_generic("medium-stomper-pentapod", "spider-unit")
delete_generic("big-stomper-pentapod", "spider-unit")

delete_generic("gleba-spawner", "unit-spawner")
delete_generic("gleba-spawner-small", "unit-spawner")

recycling.generate_recycling_recipe(data.raw.recipe["stack-inserter"])
recycling.generate_recycling_recipe(data.raw.recipe["efficiency-module-3"])

-- Must run last — Space Age re-applies spoil_ticks during its own data-updates phase
-- so we override it here at the end to guarantee it sticks
if data.raw.tool["agricultural-science-pack"] then
	data.raw.tool["agricultural-science-pack"].spoil_ticks = nil
	data.raw.tool["agricultural-science-pack"].spoil_result = nil
end
