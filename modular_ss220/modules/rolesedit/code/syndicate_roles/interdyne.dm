
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

// IP techfab
/obj/item/circuitboard/machine/techfab/ip
	name = "\improper Techfab - Interdyne"
	greyscale_colors = CIRCUIT_COLOR_SERVICE
	build_path = /obj/machinery/rnd/production/techfab/ip

/obj/machinery/rnd/production/techfab/ip
	name = "techfab (Interdyne)"
	desc = "An advanced fabricator designed to print out the latest prototypes and circuits researched from Science. Contains hardware to sync to research networks. This one is department-locked and only possesses a limited set of decryption keys."
	allowed_department_flags = DEPARTMENT_BITFLAG_CARGO | DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_MEDICAL
	allowed_buildtypes = PROTOLATHE | AWAY_LATHE | IMPRINTER | AWAY_IMPRINTER
	circuit = /obj/item/circuitboard/machine/techfab/ip
	stripe_color = "#4f8f56"
	payment_department = ACCOUNT_INT

/obj/item/mod/control/pre_equipped/interdyne/nerfed
	locked = 1
	req_one_access = list(ACCESS_SYNDICATE_IP, ACCESS_SYNDICATE_DS)

/obj/machinery/computer/shuttle/interdyne_cargo
	req_one_access = list(ACCESS_SYNDICATE_IP, ACCESS_SYNDICATE_DS)

// map files
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

// bank code
/obj/item/card/id/departmental_budget/interdyne
	budget_name = "Interdyne Pharmaceuticals"
	radio_channel = RADIO_CHANNEL_INTERDYNE
	departament_access = ACCESS_SYNDICATE_IP
	away = TRUE

//job code
/datum/outfit/interdyne_planetary_base
	role_job = /datum/job/interdyne_planetary_base

/datum/outfit/interdyne_planetary_base/ice
	role_job = /datum/job/interdyne_planetary_base_icebox

/datum/outfit/interdyne_planetary_base/shaftminer
	role_job = /datum/job/interdyne_planetary_base/mining

/datum/outfit/interdyne_planetary_base/shaftminer/ice
	role_job = /datum/job/interdyne_planetary_base_icebox/mining

/datum/job/interdyne_planetary_base/command
	bounty_types = DYNE_JOB_COMMAND

/datum/outfit/interdyne_planetary_base/shaftminer/deckofficer
	role_job = /datum/job/interdyne_planetary_base/command

/datum/job/interdyne_planetary_base/command
	bounty_types = DYNE_JOB_COMMAND

/datum/outfit/lavaland_syndicate/shaftminer/deckofficer
	role_job = /datum/job/interdyne_planetary_base/command
