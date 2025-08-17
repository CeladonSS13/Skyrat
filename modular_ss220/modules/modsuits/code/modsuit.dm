//inbuilt and not modules

/obj/item/mod/module/headprotector/inbuilt
	name = "Inbuilt MOD safety-first head protection module"
	desc = "A series of dampening plates are installed along the back and upper areas of \
		the helmet. These plates absorb abrupt kinetic shocks delivered to the skull. \
		This module specially created for combat suits, that not capable of armour adjustments,\
		so this is actually the second part of the armour."
	removable = FALSE
	complexity = 0

/obj/item/mod/module/status_readout/operational/inbuilt
	name = "Inbuilt MOD operational status readout module"
	removable = FALSE
	complexity = 0

/obj/item/mod/module/megaphone/inbuild
	name = "inbuild MOD megaphone module"
	desc = "A microchip megaphone linked to a MODsuit, for very important purposes, like: loudness. This one is inbuild and not removable."
	complexity = 0
	removable = FALSE

//surplus military modsuit

/datum/armor/mod_theme_surplus_military
	melee = 45
	bullet = 45
	laser = 30
	energy = 35
	bomb = 25
	bio = 100
	fire = 80
	acid = 80
	wound = 25

/datum/mod_theme/surplus_military
	name = "militarized security"
	desc = "An not official, heavily modified Apadyne Technologies security suit. Based on attempts to create cheap advanced armor technologies, this suit has an increased level of protection, but at the same time it is heavier, and unlike expensive suits it does not have full protection from fire."
	extended_desc = "An not official, heavily modified Apadyne Technologies security suit. This MODsuit represents an ambitious, albeit unofficial, attempt to create a cost-effective advanced armor solution.  Based on a standard Apadyne Technologies security chassis, the suit has undergone significant modifications with the goal of maximizing protection through the use of surplus and experimental materials.  \
		While successful in increasing resistance to ballistic, explosive and energy attacks, these modifications have resulted in a noticeable increase in weight, hindering the wearer's mobility. \
		The improvised upgraded thermal shielding offers user good protection against flame, however, prolonged exposure will melt the suit, potentially resulting in burns for the wearer.  \
		Furthermore, due to the non-standard design and internal rewiring, this MODsuit is incompatible with armor enhancement modules. \
		The internal systems, while functional, are a patchwork of repurposed components, potentially impacting module compatibility and overall system reliability. This MODsuit is a testament to ingenuity and resourcefulness, offering enhanced protection at a compromise, but at a cost."
	default_skin = "militarized"
	armor_type = /datum/armor/mod_theme_surplus_military
	complexity_max = DEFAULT_MAX_COMPLEXITY - 3
	charge_drain = DEFAULT_CHARGE_DRAIN * 1.5
	siemens_coefficient = 0
	resistance_flags = FLAMMABLE
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	slowdown_deployed = 0.7
	inbuilt_modules = list(
		/obj/item/mod/module/headprotector/inbuilt,
	)
	allowed_suit_storage = list(
		/obj/item/flashlight,
		/obj/item/tank/internals,
		/obj/item/ammo_box,
		/obj/item/ammo_casing,
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash,
		/obj/item/melee/baton,
		/obj/item/knife/combat,
		/obj/item/shield/riot,
		/obj/item/gun,
		/obj/item/reagent_containers/spray/pepper,
	)
	variants = list(
		"militarized" = list(
			MOD_ICON_OVERRIDE = 'modular_ss220/modules/modsuits/icons/mod_obj.dmi',
			MOD_WORN_ICON_OVERRIDE = 'modular_ss220/modules/modsuits/icons/mod_worn.dmi',
			/obj/item/clothing/head/mod = list(
				UNSEALED_CLOTHING = SNUG_FIT|THICKMATERIAL|HEADINTERNALS,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				UNSEALED_INVISIBILITY = HIDEFACIALHAIR|HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDESNOUT,
				UNSEALED_COVER = HEADCOVERSMOUTH|HEADCOVERSEYES|PEPPERPROOF,
				UNSEALED_MESSAGE = HELMET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = HELMET_SEAL_MESSAGE,
			),
			/obj/item/clothing/suit/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				SEALED_INVISIBILITY = HIDEJUMPSUIT,
				UNSEALED_MESSAGE = CHESTPLATE_UNSEAL_MESSAGE,
				SEALED_MESSAGE = CHESTPLATE_SEAL_MESSAGE,
			),
			/obj/item/clothing/gloves/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = GAUNTLET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = GAUNTLET_SEAL_MESSAGE,
			),
			/obj/item/clothing/shoes/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = BOOT_UNSEAL_MESSAGE,
				SEALED_MESSAGE = BOOT_SEAL_MESSAGE,
			),
		),
	)

/obj/item/mod/control/pre_equipped/surplus_military
	theme = /datum/mod_theme/surplus_military
	applied_modules = list(
		/obj/item/mod/module/quick_cuff,
		/obj/item/mod/module/status_readout/operational/inbuilt,
	)
	applied_cell = /obj/item/stock_parts/power_store/cell/super/empty

/datum/crafting_recipe/surplus_military_mod
	name = "Surplus Military MODSuit Construction"
	desc = "While rich companies have been designing high-quality or not MOD suits for years, you can create your own based on the safeguard MOD from the head of security and some security platings, it seems like it should turn out better, but the assistant from the PDA said that the suit has problems with fire protection. But it doesn't seems very bad, right?"
	result = /obj/effect/spawner/random/surplus_military_mod
	reqs = list(
		/obj/item/clothing/head/utility/hardhat/red = 1,
		/obj/item/clothing/gloves/color/yellow = 1,
		/obj/item/mod/construction/shell = 1,
		/obj/item/clothing/suit/utility/fire/firefighter = 1,
		/obj/item/clothing/shoes/jackboots = 1,
		/obj/item/mod/construction/plating/security = 2,
		/obj/item/mod/core/standard = 1,
		/obj/item/stock_parts/power_store/cell/super = 1,
		/obj/item/stack/cable_coil = 15,
		/obj/item/healthanalyzer = 1,
		/obj/item/stack/sheet/durathread = 10,
		/obj/item/stack/sheet/plasteel = 5,
		/obj/item/stack/sheet/plastic = 5,
		/obj/item/stack/sheet/plastitaniumglass = 2,
		/obj/item/stack/sheet/mineral/plastitanium = 10,
		/obj/item/stack/sheet/mineral/gold = 2,
		/obj/item/stack/sheet/mineral/silver = 3,
		/obj/item/stack/sheet/mineral/diamond = 1,
	)
	tool_behaviors = list(TOOL_WELDER, TOOL_WRENCH, TOOL_SCREWDRIVER, TOOL_CROWBAR, TOOL_MULTITOOL)
	tool_paths = list(/obj/item/mod/control/pre_equipped/safeguard)
	time = 60 SECONDS
	category = CAT_CLOTHING

/obj/effect/spawner/random/surplus_military_mod
	name = "surplus military MODsuit spawner"
	spawn_all_loot = TRUE
	spawn_loot_count = 1
	icon = 'modular_ss220/modules/modsuits/icons/mod_obj.dmi'
	icon_state = "militarized-control"
	loot = list(/obj/item/mod/control/pre_equipped/surplus_military)

// this for craft menu

/obj/item/mod/control/pre_equipped/safeguard
	name = "safeguard MOD control unit"
	icon_state = "safeguard-control"

/obj/item/mod/control/pre_equipped/safeguard/Initialize(mapload)
	. = ..()

	name = "safeguard MOD control unit"

/obj/item/mod/construction/plating/security
	name = "MOD security external plating"
	icon_state = "security-plating"

//ntr corporate

/datum/armor/mod_theme_corporate_official
	melee = 20
	bullet = 20
	laser = 15
	energy = 15
	bomb = 25
	bio = 100
	fire = 75
	acid = 75
	wound = 30

/datum/mod_theme/corporate/ntr
	name = "corporate official"
	desc = "A fancy, high-tech suit for Nanotrasen's high ranking officials."
	extended_desc = "An even more costly version of the Magnate model, the corporate suit is a electricity insulated, \
		anti-corrosion coated suit for high-ranking CentCom Officials, deploying good layer of protective armor and \
		advanced actuators, feeling practically weightless when turned on. Scraping the paint of this suit is \
		counted as a war-crime and reason for immediate execution in over fifty Nanotrasen space stations. \
		This is the newest V2 paperwork revision, which has \
		advanced stamp module and some other premium modules. Sources say that some of the armor \
		is ripped straight from an newbie intern's modsuit."
	armor_type = /datum/armor/mod_theme_corporate_official
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	charge_drain = DEFAULT_CHARGE_DRAIN
	complexity_max = DEFAULT_MAX_COMPLEXITY - 5
	slowdown_deployed = 0.35
	allowed_suit_storage = list(
		/obj/item/assembly/flash,
		/obj/item/melee/baton,
		/obj/item/restraints/handcuffs,
		/obj/item/gun/energy,
		/obj/item/gun/ballistic,
		/obj/item/gun/microfusion,
		/obj/item/megaphone,
		/obj/item/paper,
		/obj/item/stamp,
		/obj/item/folder,
		/obj/item/clipboard,
	)

/obj/item/mod/control/pre_equipped/corporate_official
	theme = /datum/mod_theme/corporate/ntr
	starting_frequency = MODLINK_FREQ_NANOTRASEN
	applied_core = /obj/item/mod/core/standard
	applied_cell = /obj/item/stock_parts/power_store/cell/high
	req_access = list(ACCESS_CENT_LIVING)
	applied_modules = list(
		/obj/item/mod/module/headprotector/inbuilt,
		/obj/item/mod/module/megaphone/inbuild,
		/obj/item/mod/module/stamp_advanced/inbuild,
		/obj/item/mod/module/paper_dispenser_carbon/inbuild,
		/obj/item/mod/module/thermal_regulator,
		/obj/item/mod/module/hat_stabilizer,
		/obj/item/mod/module/storage/large_capacity,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/tether,
	)

/obj/item/mod/module/stamp_advanced
	name = "MOD advanced stamper module"
	desc = "A module installed into the wrist of the suit, this functions as a high-power stamp, \
		able to switch between a lot bureaucratic modes."
	icon_state = "stamp"
	module_type = MODULE_ACTIVE
	complexity = 1
	active_power_cost = DEFAULT_CHARGE_DRAIN * 0.3
	device = /obj/item/stamp/mod_advanced
	incompatible_modules = list(/obj/item/mod/module/stamp, /obj/item/mod/module/stamp_advanced)
	cooldown_time = 0.5 SECONDS
	required_slots = list(ITEM_SLOT_GLOVES)

/obj/item/stamp/mod_advanced
	name = "MOD advanced electronic stamp"
	desc = "A high-power stamp, able to switch between some modules when used."

/obj/item/stamp/mod_advanced/attack_self(mob/user, modifiers)
	. = ..()
	if(icon_state == "stamp-ok")
		icon_state = "stamp-law"
		balloon_alert(user, "switched mode: law")
	else if(icon_state == "stamp-law")
		icon_state = "stamp-cap"
		balloon_alert(user, "switched mode: captain")
	else if(icon_state == "stamp-cap")
		icon_state = "stamp-centcom"
		balloon_alert(user, "switched mode: centcom")
	else if(icon_state == "stamp-centcom")
		icon_state = "stamp-deny"
		balloon_alert(user, "switched mode: deny")
	else if(icon_state == "stamp-deny")
		icon_state = "stamp-void"
		balloon_alert(user, "switched mode: void")
	else if(icon_state == "stamp-void")
		icon_state = "stamp-ok"
		balloon_alert(user, "switched mode: approve")

/obj/item/mod/module/stamp_advanced/inbuild
	name = "Inbuild MOD advanced stamper module"
	desc = "A module installed into the wrist of the suit, this functions as a high-power stamp, \
		able to switch between a lot bureaucratic modes. This one is integrated and not removable."
	complexity = 0
	removable = FALSE

/obj/item/mod/module/paper_dispenser_carbon
	name = "MOD advanced paper dispenser module"
	desc = "A simple module designed by the bureaucrats of Torch Bay. \
		It dispenses 'warm, clean, and crisp sheets of paper' onto a nearby table. This version had fixed dispence system, no more fire and also this module can print carbon paper."
	icon_state = "paper_maker"
	module_type = MODULE_USABLE
	complexity = 1
	use_energy_cost = DEFAULT_CHARGE_DRAIN * 0.5
	incompatible_modules = list(/obj/item/mod/module/paper_dispenser,/obj/item/mod/module/paper_dispenser_carbon)
	cooldown_time = 5 SECONDS
	required_slots = list(ITEM_SLOT_GLOVES)
	var/carbon = FALSE
	var/printed_paper = null

/obj/item/mod/module/paper_dispenser_carbon/on_use()
	if(!do_after(mod.wearer, 1 SECONDS, target = mod))
		return FALSE

	if(carbon)
		printed_paper = new /obj/item/paper/carbon(src)
		var/atom/crisp_paper = printed_paper
		crisp_paper.desc = "It's crisp and warm to the touch. Must be fresh."
	else
		printed_paper = new /obj/item/paper(src)
		var/atom/crisp_paper = printed_paper
		crisp_paper.desc = "It's crisp and warm to the touch. Must be fresh."

	var/obj/structure/table/nearby_table = locate() in range(1, mod.wearer)
	playsound(get_turf(src), 'sound/machines/click.ogg', 50, TRUE)
	balloon_alert(mod.wearer, "dispensed paper[nearby_table ? " onto table":""]")

	mod.wearer.put_in_hands(printed_paper)
	if(nearby_table)
		mod.wearer.transferItemToLoc(printed_paper, nearby_table.drop_location(), silent = FALSE)

	drain_power(use_energy_cost)

/obj/item/mod/module/paper_dispenser_carbon/get_configuration()
	. = ..()
	.["carbon"] = add_ui_configuration("Carbon", "bool", carbon)

/obj/item/mod/module/paper_dispenser_carbon/configure_edit(key, value)
	switch(key)
		if("carbon")
			carbon = text2num(value)

/obj/item/mod/module/paper_dispenser_carbon/inbuild
	name = "Inbuild MOD paper dispenser module"
	desc = "A simple module designed by the bureaucrats of Naval Intern Bay. \
		It dispenses 'warm, clean, and crisp sheets of paper' onto a nearby table. This version had fixed dispence system, no more fire and also this module can print carbon paper. This one is inbuild and not removable."
	complexity = 0
	removable = FALSE


