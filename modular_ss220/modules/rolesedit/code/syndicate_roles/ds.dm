
// trim edit
/datum/id_trim/syndicom/nova/ds2/miner
	access = list(ACCESS_SYNDICATE, ACCESS_SYNDICATE_DS, ACCESS_SYNDICATE_IP, ACCESS_ROBOTICS)

/datum/id_trim/syndicom/nova/ds2/syndicatestaff
	access = list(ACCESS_SYNDICATE, ACCESS_SYNDICATE_DS)

/datum/id_trim/syndicom/nova/ds2/researcher
	access = list(ACCESS_SYNDICATE, ACCESS_SYNDICATE_DS, ACCESS_ROBOTICS)

/datum/id_trim/syndicom/nova/ds2/enginetechnician
	access = list(ACCESS_SYNDICATE, ACCESS_SYNDICATE_DS)

/datum/id_trim/syndicom/nova/ds2/medicalofficer
	access = list(ACCESS_SYNDICATE, ACCESS_SYNDICATE_DS)

/datum/id_trim/syndicom/nova/ds2/brigofficer
	access = list(ACCESS_SYNDICATE, ACCESS_SYNDICATE_DS, ACCESS_SYNDICATE_LEADER, ACCESS_ROBOTICS)

/datum/id_trim/syndicom/nova/ds2/masteratarms
	access = list(ACCESS_SYNDICATE, ACCESS_SYNDICATE_DS, ACCESS_SYNDICATE_LEADER, ACCESS_ROBOTICS)

/datum/id_trim/syndicom/nova/ds2/corporateliasion
	access = list(ACCESS_SYNDICATE, ACCESS_SYNDICATE_DS, ACCESS_SYNDICATE_IP, ACCESS_SYNDICATE_LEADER, ACCESS_ROBOTICS)

/datum/id_trim/syndicom/nova/ds2/stationadmiral
	access = list(ACCESS_SYNDICATE, ACCESS_SYNDICATE_DS, ACCESS_SYNDICATE_IP, ACCESS_SYNDICATE_LEADER, ACCESS_ROBOTICS)

// hop console

/obj/machinery/computer/id_upgrader/ds
	name = "syndicate access upgrader console"
	desc = "A console meant to allow modifications to IDs. This one made by syndicate and add DS2 access."
	icon = 'icons/obj/machines/computer.dmi'
	icon_keyboard = "syndie_key"
	icon_screen = "explosive"
	icon_state = "computer"
	density = TRUE
	circuit = /obj/item/circuitboard/computer/id_upgrader/ds
	access_to_give = list(ACCESS_SYNDICATE_DS)

/obj/item/circuitboard/computer/id_upgrader/ds
	name = "syndicate access upgrader console circuit"
	greyscale_colors = CIRCUIT_COLOR_SECURITY
	build_path = /obj/machinery/computer/id_upgrader/ds

//map template
/datum/map_template/ruin/space/nova/des_two1984
	id = "des_two1984"
	suffix = "des_two1984.dmm"
	name = "Space-Ruin DS-2 (ss1984 edit)"
	description = "If DS-1 was so good... and DS-2 from offs..."
	always_place = TRUE

// comm console
/obj/machinery/computer/communications/syndicate/ds
	name = "syndicate communications console"
	desc = "A console meant to communicate with Syndicate upper command. This one seems to be busy processing flight calculations since you last saw it, usage is limited..."
	icon_keyboard = "tech_key"
	icon_screen = "commsyndie"
	circuit = /obj/item/circuitboard/computer/communications/syndicate/ds
	away = TRUE
	syndicate = TRUE

/obj/item/circuitboard/computer/communications/syndicate/ds
	greyscale_colors = CIRCUIT_COLOR_SECURITY
	build_path = /obj/machinery/computer/communications/syndicate/ds

// techfab
/obj/item/circuitboard/machine/techfab/ds
	name = "\improper Techfab - Deepspace"
	greyscale_colors = CIRCUIT_COLOR_SECURITY
	build_path = /obj/machinery/rnd/production/techfab/ds

/obj/machinery/rnd/production/techfab/ds
	name = "techfab (Deepspace)"
	desc = "An advanced fabricator designed to print out the latest prototypes and circuits researched from Science. Contains hardware to sync to research networks. This one is department-locked and only possesses a limited set of decryption keys."
	allowed_department_flags = DEPARTMENT_BITFLAG_SECURITY | DEPARTMENT_BITFLAG_SERVICE | DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_SCIENCE
	allowed_buildtypes = PROTOLATHE | AWAY_LATHE | IMPRINTER | AWAY_IMPRINTER
	circuit = /obj/item/circuitboard/machine/techfab/ds
	stripe_color = "#96150b"
	payment_department = ACCOUNT_DS2

/obj/item/card/id/departmental_budget/ds2
	budget_name = "Syndicate - Deep Space"
	radio_channel = RADIO_CHANNEL_INTERDYNE //before i add ds2 freq
	departament_access = ACCESS_SYNDICATE_DS
	away = TRUE

//job code
/datum/outfit/ds2
	role_job = /datum/job/ds2

/datum/outfit/ds2/prisoner
	role_job = /datum/job/ds2/prisoner

/datum/outfit/ds2/syndicate_command
	role_job = /datum/job/ds2/command

/datum/job/ds2/mining
	bounty_types = DYNE_JOB_COMMAND
	paycheck_department = ACCOUNT_DS2

/datum/outfit/ds2/syndicate/miner
	role_job = /datum/job/ds2/mining

/obj/effect/mob_spawn/ghost_role/human/ds2/syndicate/miner
	spawner_job_path = /datum/job/ds2/mining

/datum/job/ds2/service
	bounty_types = DS2_JOB_SERVICE
	paycheck_department = ACCOUNT_DS2

/datum/outfit/ds2/syndicate/service
	role_job = /datum/job/ds2/service

/datum/outfit/ds2/syndicate/enginetech
	role_job = /datum/job/ds2/engineer

/datum/outfit/ds2/syndicate/researcher
	role_job = /datum/job/ds2/science

/datum/outfit/ds2/syndicate/stationmed
	role_job = /datum/job/ds2/science

/datum/outfit/ds2/syndicate/brigoff
	role_job = /datum/job/ds2/enforce
