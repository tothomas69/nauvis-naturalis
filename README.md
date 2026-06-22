# Gleba Reimagined: Nauvis Naturalis

> _Gleba was never your destination — Nauvis always was._

## Credits

This mod is built upon the original work of **Leftn**, who created the [Delete Gleba](https://mods.factorio.com/mod/delete-gleba) mod (v0.0.6). The original
mod's core architecture, planet removal logic, and prototype deletion system provided the foundation for this reimagining.
All credit for the original concept and implementation goes to Leftn.

The prototype hiding functions used internally are adapted from Leftn's [delete-planet-compatability](https://github.com/Leftn/delete-planet-compatability) mod, licensed under the Mozilla Public License 2.0.

---

## Overview

Like Leftn I too have a strong hatred of Gleba, having used his mod for a while I wanted to make it a little more interesting
aligned to my own vision of how mod and its change should be applied. Gleba Reimagined: Nauvis Naturalis removes Gleba from
the game entirely and rebuilds its biological production tier from the ground up, using only resources available on Nauvis and the other planets.

Rather than simply deleting Gleba's content, this mod reimagines it — the biochamber and agricultural tower are fully retained
and rewired to work with Nauvis-native resources, creating a coherent biological production chain rooted on your home planet.

---

## How It Works

### Bioflux

The cornerstone of biological science is now crafted in the biochamber using Nauvis-native and Vulcanus-tier materials. Bioflux is the gateway to the entire biological production chain and requires completing Vulcanus progression before it becomes available.

**Recipe:** Tungsten Ore ×3 + Carbon ×4 + Raw Fish ×3 + Water ×50 → Bioflux ×2
**Machine:** Biochamber

### The Biochamber

Fully retained and rewired. The biochamber no longer requires nutrients to operate — it runs on electricity like any standard production machine, while preserving its built-in productivity bonus and its unique ability to absorb pollution on Nauvis.

**Crafting Recipe:**

- Steel Plate ×10
- Advanced Circuit ×5
- Landfill ×4
- Refined Concrete ×10

**Unlocked by:** Biochamber technology (requires electromagnetic, metallurgic, and space science packs)

### Fish Farming

Raw fish is the primary biological bottleneck in the production chain. Breed fish in the biochamber using a small seed population, bioflux, and water to slowly amplify your supply. The loop is intentionally gradual — bootstrap it by hand-catching fish from Nauvis water sources, then let the biochamber take over.

**Recipe:** Raw Fish ×2 + Bioflux ×2 + Water ×50 → Raw Fish ×3
**Machine:** Biochamber

### Tree Farming

The agricultural tower is fully restored and buildable on Nauvis. It runs on electricity, and can plant and harvest trees across any soil type. Tree seeds are produced in a chemical plant from wood and water, giving the farming loop a genuine resource cost and a stable guaranteed seed supply with no RNG risk.

**Seed Recipe:** Wood ×2 + Water ×50 → Tree Seed ×1 (Chemical Plant)
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

Agricultural science packs are crafted on Nauvis from raw fish and bioflux, gated behind the full biological production chain. The research tree is rewired around standard science packs — no Gleba landing required.

**Recipe:** Raw Fish ×5 + Bioflux ×5 → Agricultural Science Pack ×1
**Machine:** Biochamber
**Surface:** Nauvis only (pressure condition enforced)

### Space Connections

A direct Vulcanus to Aquilo space connection is added so your interplanetary journey continues uninterrupted without Gleba in the route.

---

## Technology Tree

```
Electromagnetic + Metallurgic + Space Science
        ↓
   Bioflux (500 packs)
   Unlocks: bioflux recipe, wood-processing, fish-breeding, agricultural science pack recipe
        ↓
   Biochamber (300 packs)
   Unlocks: biochamber machine
        ↓
   Agriculture (500 packs)  [requires agricultural science packs]
   Unlocks: agricultural tower
        ↓
   Agricultural Science Pack (200 packs)
        ↓
   Heating Tower (1000 packs)
```

---

## What's Removed

- Gleba the planet (hidden, map gen disabled)
- All Gleba-native plants, terrain tiles, and flora
- Pentapod enemies (stompers removed; wrigglers and strafers retained for achievements)
- Yumako and jellynut processing chains
- Nutrients and bacteria cultivation
- All spoilage-related recipes and items permanently removed (spoilage has no role in this mod)
- Agricultural science packs no longer spoil — they are standard Nauvis science packs
- Bioplastic, biolubricant, biosulfur
- Agricultural science via Gleba research trigger

---

## Dependencies

- Factorio base >= 2.0.0
- Space Age >= 2.0.15

No additional mods required — this mod is fully self-contained.

---

## Compatibility

This mod is standalone and has no external mod dependencies. It is not compatible with other mods that modify Gleba's planet definition, agricultural tower, or biochamber prototypes in conflicting ways.

---

_Original mod "Delete Gleba" by Leftn — thank you for laying the groundwork!_
