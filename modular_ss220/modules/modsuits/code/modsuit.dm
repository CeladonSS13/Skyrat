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
