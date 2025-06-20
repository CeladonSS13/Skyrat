
//sechud override
/datum/id_trim/syndicom/nova/interdyne
	sechud_icon_state = SECHUD_SYNDICATE_INTERDYNE_GREEN
	access = list(ACCESS_SYNDICATE, ACCESS_SYNDICATE_IP, ACCESS_ROBOTICS)

/datum/id_trim/syndicom/nova/interdyne/shaftminer
	sechud_icon_state = SECHUD_SYNDICATE_INTERDYNE_GREEN_MINER
	access = list(ACCESS_SYNDICATE, ACCESS_SYNDICATE_IP, ACCESS_ROBOTICS)

/datum/id_trim/syndicom/nova/interdyne/deckofficer
	sechud_icon_state = SECHUD_SYNDICATE_INTERDYNE_GREEN_HEAD
	access = list(ACCESS_SYNDICATE, ACCESS_SYNDICATE_IP, ACCESS_SYNDICATE_LEADER, ACCESS_ROBOTICS)



/datum/map_template/ruin/lavaland/nova/interdyne_base1984
	name = "Lava-Ruin Interdyne Pharmaceutics Nova Sector Base 3c76928 (1984)"
	id = "lava-base1984"
	description = "A planetside Interdyne research facility developing biological weapons; it is closely guarded by an elite team of agents."
	prefix = "_maps/RandomRuins/LavaRuins/nova/"
	suffix = "lavaland_surface_interdyne_base1984.dmm"
	allow_duplicates = FALSE
	never_spawn_with = list(/datum/map_template/ruin/icemoon/underground/nova/interdyne_base1984)
	always_place = TRUE

/datum/map_template/ruin/icemoon/underground/nova/interdyne_base1984
	name = "Ice-ruin Interdyne Pharmaceuticals Nova Sector Base 8817238 (1984)"
	id = "ice-base1984"
	description = "A planetside Interdyne research facility developing biological weapons; it is closely guarded by an elite team of agents."
	prefix = "_maps/RandomRuins/IceRuins/nova/"
	suffix = "icemoon_underground_interdyne_base1984.dmm"
	allow_duplicates = FALSE
	never_spawn_with = list(/datum/map_template/ruin/lavaland/nova/interdyne_base1984)
	always_place = TRUE
