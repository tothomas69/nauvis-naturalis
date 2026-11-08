
-- Spoilage recycling removed permanently
-- The spoilage toggle setting has been removed; spoilage has no role in this mod
delete_generic("spoilage-recycling", "recipe")

-- Factorio 2.1 renamed vanilla "wood-processing" to "tree-seed" and ships a
-- migration for old saves. We no longer define our own recipe; data-updates.lua
-- overrides vanilla "tree-seed" with our chemical-plant design instead.
