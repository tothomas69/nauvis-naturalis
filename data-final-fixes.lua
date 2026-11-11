-- data-final-fixes.lua
-- Runs after ALL mods have finished their data and data-updates phases.
-- Used here to guarantee spoil_ticks removal sticks, since Space Age
-- re-applies spoilage properties during its own data-updates phase.

local util = require("prototypes.util")

util.remove_spoilage("agricultural-science-pack")
util.remove_spoilage("bioflux")
util.remove_spoilage("raw-fish")
util.remove_spoilage("biter-egg")
util.remove_spoilage("captive-biter-spawner")
