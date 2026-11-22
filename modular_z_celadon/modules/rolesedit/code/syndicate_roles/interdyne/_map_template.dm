// map files

//disable nova
/datum/map_template/ruin/lavaland/nova/interdyne_base
	never_spawn_with = list(/datum/map_template/ruin/icemoon/underground/nova/interdyne_base, /datum/map_template/ruin/lavaland/nova/interdyne_base_celadon, /datum/map_template/ruin/icemoon/underground/nova/interdyne_base_celadon)
	always_place = FALSE
	cost = 1000

/datum/map_template/ruin/lavaland/nova/interdyne_base_celadon
	name = "Lava-Ruin Interdyne Pharmaceutics Nova Sector Base 3c76928 (Celadon)"
	id = "lava-base_celadon"
	description = "A planetside Interdyne research facility developing biological weapons; it is closely guarded by an elite team of agents."
	prefix = "_maps/RandomRuins/LavaRuins/nova/"
	suffix = "lavaland_surface_interdyne_base_celadon.dmm"
	allow_duplicates = FALSE
	never_spawn_with = list(/datum/map_template/ruin/icemoon/underground/nova/interdyne_base_celadon)
	always_place = TRUE

//disable nova
/datum/map_template/ruin/icemoon/underground/nova/interdyne_base
	never_spawn_with = list(/datum/map_template/ruin/lavaland/nova/interdyne_base, /datum/map_template/ruin/lavaland/nova/interdyne_base_celadon, /datum/map_template/ruin/icemoon/underground/nova/interdyne_base_celadon)
	always_place = FALSE
	cost = 1000

/datum/map_template/ruin/icemoon/underground/nova/interdyne_base_celadon
	name = "Ice-ruin Interdyne Pharmaceuticals Nova Sector Base 8817238 (Celadon)"
	id = "ice-base_celadon"
	description = "A planetside Interdyne research facility developing biological weapons; it is closely guarded by an elite team of agents."
	prefix = "_maps/RandomRuins/IceRuins/nova/"
	suffix = "icemoon_underground_interdyne_base_celadon.dmm"
	allow_duplicates = FALSE
	never_spawn_with = list(/datum/map_template/ruin/lavaland/nova/interdyne_base_celadon)
	always_place = TRUE
