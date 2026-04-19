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
	req_access = list(ACCESS_SYNDICATE)

/obj/item/circuitboard/computer/id_upgrader/ds
	name = "syndicate access upgrader console circuit"
	greyscale_colors = CIRCUIT_COLOR_SECURITY
	build_path = /obj/machinery/computer/id_upgrader/ds

/obj/item/card/id/departmental_budget/ds2
	budget_name = "Syndicate - Deep Space"
	radio_channel = RADIO_CHANNEL_INTERDYNE //before i add ds2 freq
	departament_access = ACCESS_SYNDICATE_DS
	away = TRUE

//modsuits override

/datum/armor/mod_theme_syndicate/deepspace
	melee = 40
	bullet = 50
	laser = 40
	energy = 40
	bomb = 35
	bio = 100
	fire = 80
	acid = 90
	wound = 25

/datum/mod_theme/syndicate/deepspace
	armor_type = /datum/armor/mod_theme_syndicate/deepspace

/obj/item/mod/control/pre_equipped/deepspace
	starting_frequency = MODLINK_FREQ_SYNDICATE
	locked = 1
	req_access = null
	req_one_access = list(ACCESS_SYNDICATE_IP, ACCESS_SYNDICATE_DS)
	applied_cell = /obj/item/stock_parts/power_store/cell/hyper
	applied_modules = list(
		/obj/item/mod/module/storage/syndicate,
		/obj/item/mod/module/quick_cuff,
		/obj/item/mod/module/shock_absorber,
		/obj/item/mod/module/emp_shield,
		/obj/item/mod/module/hat_stabilizer/syndicate,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/jetpack/advanced,
		/obj/item/mod/module/jump_jet,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/criminalcapture,
		/obj/item/mod/module/chameleon,
	)
	default_pins = list(
		/obj/item/mod/module/jetpack/advanced,
		/obj/item/mod/module/jump_jet,
		/obj/item/mod/module/chameleon,
		/obj/item/mod/module/criminalcapture,
	)
	theme = /datum/mod_theme/syndicate/deepspace

/datum/armor/mod_theme_elite/admiral
	melee = 60
	bullet = 60
	laser = 60
	energy = 60
	bomb = 55
	bio = 100
	fire = 100
	acid = 100
	wound = 25

/datum/mod_theme/elite/admiral
	armor_type = /datum/armor/mod_theme_elite/admiral
	complexity_max = DEFAULT_MAX_COMPLEXITY + 5 //same as deepspace

/obj/item/mod/control/pre_equipped/deepspace_admiral
	starting_frequency = MODLINK_FREQ_SYNDICATE
	applied_cell = /obj/item/stock_parts/power_store/cell/bluespace
	locked = 1
	req_access = list(ACCESS_SYNDICATE_DS, ACCESS_SYNDICATE_LEADER)
	applied_modules = list(
		/obj/item/mod/module/storage/syndicate,
		/obj/item/mod/module/shock_absorber,
		/obj/item/mod/module/emp_shield,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/jetpack/advanced,
		/obj/item/mod/module/jump_jet,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/pathfinder,
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/hat_stabilizer/syndicate,
		/obj/item/mod/module/quick_cuff,
		/obj/item/mod/module/criminalcapture,
	)
	default_pins = list(
		/obj/item/mod/module/pathfinder,
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/jetpack/advanced,
		/obj/item/mod/module/jump_jet,
		/obj/item/mod/module/criminalcapture,
	)
	theme = /datum/mod_theme/elite/admiral

