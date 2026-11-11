# Gleba Reimagined: Nauvis Naturalis

> _Gleba was never your destination — Nauvis always was._

**Version 1.1.0** · Factorio 2.1 · Requires Space Age

## Credits

This mod is built upon the original work of **Leftn**, who created the [Delete Gleba](https://mods.factorio.com/mod/delete-gleba) mod (v0.0.6). The original
mod's core architecture, planet removal logic, and prototype deletion system provided the foundation for this reimagining.
All credit for the original concept and implementation goes to Leftn.

The prototype hiding functions used internally are adapted from Leftn's [delete-planet-compatability](https://github.com/Leftn/delete-planet-compatability) mod, licensed under the Mozilla Public License 2.0.

---

## Overview

Gleba Reimagined: Nauvis Naturalis removes Gleba from the game entirely and rebuilds its biological production tier from the ground up, 
rather than simply deleting Gleba's content, this mod reimagines it — the biochamber and agricultural tower are fully retained
and rewired to work with Nauvis-native resources, creating a coherent biological production chain rooted on your home planet. 

Reflective of modern day, fish farming, automated tree growing, and sustainably harvested lumber - you have something to use that lumber on 
finally!! Like Leftn I too have a strong dislike of Gleba having used his mod for a while. I wanted to make play through a little more interesting and
aligned to my own vision of how Factorio without Glebus might look. I kept the good pieces and removed the annoying bits. Hope you enjoy. 

---

## What's New in 1.1.0

- Updated for Factorio 2.1 (no longer loads on 2.0)
- Wood processing now overrides vanilla's **Tree Seed** recipe (2.1 renamed `wood-processing` to `tree-seed`); existing saves migrate automatically
- Recycling now comes from 2.1's separate **Recycler** mod, which is listed as a dependency
- Fixed a load crash on 2.1: science packs are no longer assumed to be "tool" prototypes

## How It Works

### Bioflux

The cornerstone of biological science is now crafted in the biochamber using Nauvis-native and Vulcanus-tier materials. Bioflux is the gateway to the entire biological production chain and requires completing Vulcanus progression before it becomes available. Tungsten is only a trace catalyst, and bioflux no longer spoils.

**Recipe:** Tungsten Ore ×1 + Carbon ×4 + Raw Fish ×3 + Water ×50 → Bioflux ×2
**Machine:** Biochamber (its +50% productivity makes this roughly 1 fish per bioflux)

### The Biochamber

Fully retained and rewired. The biochamber no longer requires nutrients to operate — it runs on electricity like any standard production machine (with a small pollution output of 2/min) while preserving its built-in +50% productivity bonus. Each biological recipe gives it its own glow: red-orange for bioflux, water blue for fish breeding, lime for agricultural science.

**Crafting Recipe:**

- Steel Plate ×10
- Advanced Circuit ×5
- Landfill ×4
- Refined Concrete ×10

**Unlocked by:** Biochamber technology (requires electromagnetic, metallurgic, and space science packs)

### Fish Farming

Raw fish is the primary biological bottleneck in the production chain. Breed fish in the biochamber using a small seed population, bioflux, and water to amplify your supply. Bootstrap it by hand-catching fish from Nauvis water sources, then let the biochamber take over. Raw fish no longer spoils.

**Recipe:** Raw Fish ×2 + Bioflux ×1 + Water ×50 → Raw Fish ×4
**Machine:** Biochamber (6 fish per craft with its +50% productivity)
**Modules:** Productivity allowed; quality is deliberately disabled to prevent an infinite-legendary-fish loop

### Tree Farming

The agricultural tower is fully restored and buildable on Nauvis. It runs on electricity, and can plant and harvest trees across any soil type. Tree seeds are produced in a chemical plant from wood and water, giving the farming loop a genuine resource cost and a stable guaranteed seed supply with no RNG risk. A tree yields 4 wood, so one harvest funds several replants — enough for large farms that also feed agricultural science.

**Seed Recipe (Tree Seed):** Wood ×2 + Water ×20 → Tree Seed ×2 (Chemical Plant, 5 s, productivity allowed)
**Tower:** Plants and harvests trees automatically on Nauvis, outputs wood and seeds

**Agricultural Tower Recipe:**

- Steel Plate ×10
- Electronic Circuit ×3
- Iron Gear Wheel ×20
- Electric Engine Unit ×4
- Landfill ×1

**Unlocked by:** Agriculture technology (requires electromagnetic, metallurgic, space, and agricultural science packs)

The complete tree farming loop:

```
Water + Wood → Tree Seeds  (chemical plant)
Tree Seeds   → Trees       (agricultural tower plants)
Trees        → Wood        (agricultural tower harvests)
Net result: Wood profit per cycle, water consumed
```

### Agricultural Science

Agricultural science packs are crafted on Nauvis from the whole biological chain — wood, seeds, fish and bioflux. They no longer spoil. The research tree is rewired around standard science packs — no Gleba landing required.

**Recipe:** Wood ×20 + Tree Seed ×2 + Raw Fish ×3 + Bioflux ×5 → Agricultural Science Pack ×1 (30 s)
**Machine:** Biochamber
**Ratio:** a full science line needs roughly 2 science : 1 fish breeding : 1 bioflux biochambers
**Surface:** Nauvis only (pressure condition enforced)

### Space Connections

A direct Vulcanus to Aquilo space connection is added so your interplanetary journey continues uninterrupted without Gleba in the route.

### Other Recipes Using Bioflux

With Gleba gone, these late-game recipes now draw on your Nauvis bioflux:

- **Carbon Fiber:** Carbon ×2 + Bioflux ×20 → Carbon Fiber ×2 (Chemical Plant, any surface)
- **Stack Inserter:** Processing Unit ×1 + Carbon Fiber ×2 + Bioflux ×10 + Bulk Inserter ×1
- **Efficiency Module 3:** Advanced Circuit ×5 + Processing Unit ×5 + Bioflux ×5 + Efficiency Module 2 ×4

---

## Technology Tree

```
Electromagnetic + Metallurgic + Space Science
        ↓
   Bioflux (500 packs)
   Unlocks: bioflux, tree seed, fish breeding, agricultural science pack recipes
        ↓
   Biochamber (300 packs)
   Unlocks: biochamber machine
        ↓
   Agriculture (500 packs)  [requires agricultural science packs]
   Unlocks: agricultural tower

   Agricultural Science Pack (200 packs, after Bioflux)
        ↓
   Heating Tower (1000 packs, uses agricultural science)
```

---

## What's Removed

- Gleba the planet (hidden, map gen disabled)
- All Gleba-native plants, terrain tiles, and flora
- Pentapod enemies (stompers removed)
- Yumako and jellynut processing chains
- Nutrients and bacteria cultivation
- All spoilage-related recipes and items permanently removed (spoilage has no role in this mod)
- Agricultural science packs no longer spoil — they are standard Nauvis science packs
- Bioplastic, biolubricant, biosulfur
- Agricultural science via Gleba research trigger

---

## Dependencies

- Factorio base >= 2.1.0
- Space Age >= 2.1.0
- Recycler >= 2.1.0 (ships with Space Age in 2.1)

No third-party mods required — this mod is fully self-contained.

---

## Compatibility

This mod is standalone and has no third-party mod dependencies. It is not compatible with other mods that modify Gleba's planet definition, agricultural tower, or biochamber prototypes in conflicting ways.

---

_Original mod "Delete Gleba" by Leftn — thank you for laying the groundwork!_
