/datum/armament_entry/company_import/nakamura_modsuits
	category = NAKAMURA_ENGINEERING_MODSUITS_NAME
	company_bitflag = CARGO_COMPANY_NAKAMURA_MODSUITS

/datum/armament_entry/company_import/nakamura_modsuits/mod
	subcategory = "MOD Suits"

/datum/armament_entry/company_import/nakamura_modsuits/mod/civilian_mod
	name = "Civilian Miniaturized Belt Modsuit"
	item_type = /obj/item/mod/control/pre_equipped/civilian
	description = "A non spaceproof belt Modsuit made for civilian operations and Modsuit training \
		this convenient frame allows the user to enjoy most Modsuit Modules without having to rely \
		on a heavy backpack control unit, making its operation less taxing and convenient for the \
		average user."
	cost = PAYCHECK_COMMAND * 5

/datum/armament_entry/company_import/nakamura_modsuits/mod/standart_mod
	name = "Standart Civilian Modsuit"
	item_type = /obj/item/mod/control/pre_equipped/standard
	description = "A third-generation, modular civilian class suit. \
		These suits are oxygenated, spaceworthy, resistant to fire and chemical threats, and are immunized against everything between a sneeze and a bioweapon. \
		However, their combat applications are incredibly minimal due to the amount of armor plating being installed \
		by default."
	cost = PAYCHECK_COMMAND * 10

// MOD cores

/datum/armament_entry/company_import/nakamura_modsuits/core
	subcategory = "MOD Core Modules"
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/nakamura_modsuits/core/standard
	item_type = /obj/item/mod/core/standard
	cost = PAYCHECK_COMMAND * 2

/datum/armament_entry/company_import/nakamura_modsuits/core/plasma
	item_type = /obj/item/mod/core/plasma

/datum/armament_entry/company_import/nakamura_modsuits/core/ethereal
	item_type = /obj/item/mod/core/ethereal

// MOD plating

/datum/armament_entry/company_import/nakamura_modsuits/plating
	subcategory = "MOD External Plating"
	cost = PAYCHECK_COMMAND * 2

/datum/armament_entry/company_import/nakamura_modsuits/plating/standard
	name = "MOD Standard Plating"
	item_type = /obj/item/mod/construction/plating
	cost = PAYCHECK_LOWER * 3

/datum/armament_entry/company_import/nakamura_modsuits/plating/medical
	name = "MOD Medical Plating"
	item_type = /obj/item/mod/construction/plating/medical

/datum/armament_entry/company_import/nakamura_modsuits/plating/engineering
	name = "MOD Engineering Plating"
	item_type = /obj/item/mod/construction/plating/engineering

/datum/armament_entry/company_import/nakamura_modsuits/plating/atmospherics
	name = "MOD Atmospherics Plating"
	item_type = /obj/item/mod/construction/plating/atmospheric

/datum/armament_entry/company_import/nakamura_modsuits/plating/security
	name = "MOD Security Plating"
	item_type = /obj/item/mod/construction/plating/security
	cost = PAYCHECK_COMMAND * 2

/datum/armament_entry/company_import/nakamura_modsuits/plating/clown
	name = "MOD CosmoHonk (TM) Plating"
	item_type = /obj/item/mod/construction/plating/cosmohonk
	cost = PAYCHECK_COMMAND * 2
	contraband = TRUE

// MOD modules

// Protection, so shielding and whatnot

/datum/armament_entry/company_import/nakamura_modsuits/protection_modules
	subcategory = "MOD Protection Modules"
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/nakamura_modsuits/protection_modules/welding
	item_type = /obj/item/mod/module/welding
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/nakamura_modsuits/protection_modules/longfall
	item_type = /obj/item/mod/module/longfall

/datum/armament_entry/company_import/nakamura_modsuits/protection_modules/rad_protection
	item_type = /obj/item/mod/module/rad_protection

/datum/armament_entry/company_import/nakamura_modsuits/protection_modules/emp_shield
	item_type = /obj/item/mod/module/emp_shield

// TODO: uncomment when return retractives
// /datum/armament_entry/company_import/nakamura_modsuits/protection_modules/armor_plates
// 	item_type = /obj/item/mod/module/armor_booster/retractplates
// 	cost = PAYCHECK_COMMAND * 9
// 	restricted = TRUE
// 	contraband = TRUE

// Utility modules, general purpose stuff that really anyone might want

/datum/armament_entry/company_import/nakamura_modsuits/utility_modules
	subcategory = "MOD Utility Modules"

/datum/armament_entry/company_import/nakamura_modsuits/utility_modules/flashlight
	item_type = /obj/item/mod/module/flashlight
	cost = PAYCHECK_LOWER

/datum/armament_entry/company_import/nakamura_modsuits/utility_modules/regulator
	item_type = /obj/item/mod/module/thermal_regulator
	cost = PAYCHECK_LOWER * 2

/datum/armament_entry/company_import/nakamura_modsuits/utility_modules/mouthhole
	item_type = /obj/item/mod/module/mouthhole
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/nakamura_modsuits/utility_modules/signlang
	item_type = /obj/item/mod/module/signlang_radio
	cost = PAYCHECK_LOWER * 3

/datum/armament_entry/company_import/nakamura_modsuits/utility_modules/plasma_stabilizer
	item_type = /obj/item/mod/module/plasma_stabilizer
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/nakamura_modsuits/utility_modules/basic_storage
	item_type = /obj/item/mod/module/storage
	cost = PAYCHECK_LOWER * 3

/datum/armament_entry/company_import/nakamura_modsuits/utility_modules/expanded_storage
	item_type = /obj/item/mod/module/storage/large_capacity
	cost = PAYCHECK_COMMAND * 2

/datum/armament_entry/company_import/nakamura_modsuits/utility_modules/retract_plates
	item_type = /obj/item/mod/module/plate_compression
	cost = PAYCHECK_COMMAND * 3

/datum/armament_entry/company_import/nakamura_modsuits/utility_modules/magnetic_deploy
	item_type = /obj/item/mod/module/springlock/contractor
	cost = PAYCHECK_COMMAND * 5

// Mobility modules, jetpacks and stuff

/datum/armament_entry/company_import/nakamura_modsuits/mobility_modules
	subcategory = "MOD Mobility Modules"
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/nakamura_modsuits/mobility_modules/tether
	item_type = /obj/item/mod/module/tether
	cost = PAYCHECK_LOWER * 3

/datum/armament_entry/company_import/nakamura_modsuits/mobility_modules/magboot
	item_type = /obj/item/mod/module/magboot
	cost = PAYCHECK_CREW * 3

/datum/armament_entry/company_import/nakamura_modsuits/mobility_modules/jetpack
	item_type = /obj/item/mod/module/jetpack
	cost = PAYCHECK_COMMAND * 3

/datum/armament_entry/company_import/nakamura_modsuits/mobility_modules/pathfinder
	item_type = /obj/item/mod/module/pathfinder
	cost = PAYCHECK_COMMAND * 2

/datum/armament_entry/company_import/nakamura_modsuits/mobility_modules/disposals
	item_type = /obj/item/mod/module/disposal_connector
	cost = PAYCHECK_LOWER * 5

/datum/armament_entry/company_import/nakamura_modsuits/mobility_modules/sphere
	item_type = /obj/item/mod/module/sphere_transform
	cost = PAYCHECK_COMMAND * 4

/datum/armament_entry/company_import/nakamura_modsuits/mobility_modules/atrocinator
	item_type = /obj/item/mod/module/atrocinator
	cost = PAYCHECK_COMMAND * 6
	contraband = TRUE

// Novelty modules, goofy stuff that's rare/unprintable, but doesn't fit in any of the above categories

/datum/armament_entry/company_import/nakamura_modsuits/novelty_modules
	subcategory = "MOD Novelty Modules"
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/nakamura_modsuits/novelty_modules/waddle
	item_type = /obj/item/mod/module/waddle
	cost = PAYCHECK_LOWER

/datum/armament_entry/company_import/nakamura_modsuits/novelty_modules/bike_horn
	item_type = /obj/item/mod/module/bikehorn
	cost = PAYCHECK_LOWER

/datum/armament_entry/company_import/nakamura_modsuits/novelty_modules/microwave_beam
	item_type = /obj/item/mod/module/microwave_beam

/datum/armament_entry/company_import/nakamura_modsuits/novelty_modules/tanner
	item_type = /obj/item/mod/module/tanner
	cost = PAYCHECK_LOWER * 5
	contraband = TRUE

/datum/armament_entry/company_import/nakamura_modsuits/novelty_modules/rave
	item_type = /obj/item/mod/module/visor/rave
	cost = PAYCHECK_CREW
	contraband = TRUE

/datum/armament_entry/company_import/nakamura_modsuits/novelty_modules/hat_stabilizer
	item_type = /obj/item/mod/module/hat_stabilizer
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/nakamura_modsuits/novelty_modules/kinesis
	item_type = /obj/item/mod/module/anomaly_locked/kinesis/prebuilt/locked
	cost = PAYCHECK_COMMAND * 20

/datum/armament_entry/company_import/nakamura_modsuits/novelty_modules/antigrav
	item_type = /obj/item/mod/module/anomaly_locked/antigrav/prebuilt/locked
	cost = PAYCHECK_COMMAND * 20

/datum/armament_entry/company_import/nakamura_modsuits/novelty_modules/teleporter
	item_type = /obj/item/mod/module/anomaly_locked/teleporter/prebuilt/locked
	cost = PAYCHECK_COMMAND * 30
