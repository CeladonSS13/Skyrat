/datum/supply_pack/companies/nakamura_modsuits
	group = NAKAMURA_ENGINEERING_MODSUITS_NAME_1984
	special = FALSE // required to be shown in cargo
	special_enabled = TRUE // required to be shown in cargo
	dangerous = FALSE // required to be shown in cargo

/datum/supply_pack/companies/nakamura_modsuits/mod/civilian_mod
	name = "Civilian Miniaturized Belt Modsuit"
	contains = list(/obj/item/mod/control/pre_equipped/civilian)
	cost = PAYCHECK_COMMAND * 5

/datum/supply_pack/companies/nakamura_modsuits/mod/standart_mod
	name = "Standart Civilian Modsuit"
	contains = list(/obj/item/mod/control/pre_equipped/standard)
	cost = PAYCHECK_COMMAND * 10

// MOD cores

/datum/supply_pack/companies/nakamura_modsuits/core
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/nakamura_modsuits/core/standard
	contains = list(/obj/item/mod/core/standard)
	cost = PAYCHECK_COMMAND * 2

/datum/supply_pack/companies/nakamura_modsuits/core/plasma
	contains = list(/obj/item/mod/core/plasma)
	cost = PAYCHECK_COMMAND * 1.5

/datum/supply_pack/companies/nakamura_modsuits/core/ethereal
	contains = list(/obj/item/mod/core/ethereal)

// MOD plating

/datum/supply_pack/companies/nakamura_modsuits/plating
	cost = PAYCHECK_COMMAND * 2

/datum/supply_pack/companies/nakamura_modsuits/plating/standard
	name = "MOD Standard Plating"
	contains = list(/obj/item/mod/construction/plating)
	cost = PAYCHECK_LOWER * 3

/datum/supply_pack/companies/nakamura_modsuits/plating/medical
	name = "MOD Medical Plating"
	contains = list(/obj/item/mod/construction/plating/medical)

/datum/supply_pack/companies/nakamura_modsuits/plating/engineering
	name = "MOD Engineering Plating"
	contains = list(/obj/item/mod/construction/plating/engineering)

/datum/supply_pack/companies/nakamura_modsuits/plating/atmospherics
	name = "MOD Atmospherics Plating"
	contains = list(/obj/item/mod/construction/plating/atmospheric)

/datum/supply_pack/companies/nakamura_modsuits/plating/security
	name = "MOD Security Plating"
	contains = list(/obj/item/mod/construction/plating/security)
	cost = PAYCHECK_COMMAND * 3

/datum/supply_pack/companies/nakamura_modsuits/plating/clown
	name = "MOD CosmoHonk (TM) Plating"
	contains = list(/obj/item/mod/construction/plating/cosmohonk)
	cost = PAYCHECK_COMMAND * 4
	contraband = TRUE

// MOD modules

// Protection, so shielding and whatnot

/datum/supply_pack/companies/nakamura_modsuits/protection_modules
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/nakamura_modsuits/protection_modules/welding
	contains = list(/obj/item/mod/module/welding)
	cost = PAYCHECK_CREW

/datum/supply_pack/companies/nakamura_modsuits/protection_modules/longfall
	contains = list(/obj/item/mod/module/longfall)

/datum/supply_pack/companies/nakamura_modsuits/protection_modules/rad_protection
	contains = list(/obj/item/mod/module/rad_protection)

/datum/supply_pack/companies/nakamura_modsuits/protection_modules/emp_shield
	contains = list(/obj/item/mod/module/emp_shield)

// TODO: uncomment when return retractives
// /datum/supply_pack/companies/nakamura_modsuits/protection_modules/armor_plates
// 	contains = list(/obj/item/mod/module/armor_booster/retractplates)
// 	cost = PAYCHECK_COMMAND * 9
// 	restricted = TRUE
// 	contraband = TRUE

// Utility modules, general purpose stuff that really anyone might want

/datum/supply_pack/companies/nakamura_modsuits/utility_modules/flashlight
	contains = list(/obj/item/mod/module/flashlight)
	cost = PAYCHECK_LOWER

/datum/supply_pack/companies/nakamura_modsuits/utility_modules/regulator
	contains = list(/obj/item/mod/module/thermal_regulator)
	cost = PAYCHECK_CREW

/datum/supply_pack/companies/nakamura_modsuits/utility_modules/mouthhole
	contains = list(/obj/item/mod/module/mouthhole)
	cost = PAYCHECK_CREW

/datum/supply_pack/companies/nakamura_modsuits/utility_modules/signlang
	contains = list(/obj/item/mod/module/signlang_radio)
	cost = PAYCHECK_LOWER * 3

/datum/supply_pack/companies/nakamura_modsuits/utility_modules/plasma_stabilizer
	contains = list(/obj/item/mod/module/plasma_stabilizer)
	cost = PAYCHECK_CREW

/datum/supply_pack/companies/nakamura_modsuits/utility_modules/basic_storage
	contains = list(/obj/item/mod/module/storage)
	cost = PAYCHECK_LOWER * 3

/datum/supply_pack/companies/nakamura_modsuits/utility_modules/expanded_storage
	contains = list(/obj/item/mod/module/storage/large_capacity)
	cost = PAYCHECK_COMMAND * 2

/datum/supply_pack/companies/nakamura_modsuits/utility_modules/retract_plates
	contains = list(/obj/item/mod/module/plate_compression)
	cost = PAYCHECK_COMMAND * 3

/datum/supply_pack/companies/nakamura_modsuits/utility_modules/magnetic_deploy
	contains = list(/obj/item/mod/module/springlock/contractor)
	cost = PAYCHECK_COMMAND * 5

// Mobility modules, jetpacks and stuff

/datum/supply_pack/companies/nakamura_modsuits/mobility_modules
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/nakamura_modsuits/mobility_modules/tether
	contains = list(/obj/item/mod/module/tether)
	cost = PAYCHECK_LOWER * 3

/datum/supply_pack/companies/nakamura_modsuits/mobility_modules/magboot
	contains = list(/obj/item/mod/module/magboot)
	cost = PAYCHECK_CREW * 3

/datum/supply_pack/companies/nakamura_modsuits/mobility_modules/jetpack
	contains = list(/obj/item/mod/module/jetpack)
	cost = PAYCHECK_COMMAND * 3

/datum/supply_pack/companies/nakamura_modsuits/mobility_modules/pathfinder
	contains = list(/obj/item/mod/module/pathfinder)
	cost = PAYCHECK_COMMAND * 2

/datum/supply_pack/companies/nakamura_modsuits/mobility_modules/disposals
	contains = list(/obj/item/mod/module/disposal_connector)
	cost = PAYCHECK_LOWER * 5

/datum/supply_pack/companies/nakamura_modsuits/mobility_modules/sphere
	contains = list(/obj/item/mod/module/sphere_transform)
	cost = PAYCHECK_COMMAND * 4

/datum/supply_pack/companies/nakamura_modsuits/mobility_modules/atrocinator
	contains = list(/obj/item/mod/module/atrocinator)
	cost = PAYCHECK_COMMAND * 5
	contraband = TRUE

// Novelty modules, goofy stuff that's rare/unprintable, but doesn't fit in any of the above categories

/datum/supply_pack/companies/nakamura_modsuits/novelty_modules
	cost = PAYCHECK_CREW

/datum/supply_pack/companies/nakamura_modsuits/novelty_modules/waddle
	contains = list(/obj/item/mod/module/waddle)
	cost = PAYCHECK_LOWER

/datum/supply_pack/companies/nakamura_modsuits/novelty_modules/bike_horn
	contains = list(/obj/item/mod/module/bikehorn)
	cost = PAYCHECK_LOWER

/datum/supply_pack/companies/nakamura_modsuits/novelty_modules/microwave_beam
	contains = list(/obj/item/mod/module/microwave_beam)

/datum/supply_pack/companies/nakamura_modsuits/novelty_modules/tanner
	contains = list(/obj/item/mod/module/tanner)
	cost = PAYCHECK_LOWER * 5
	contraband = TRUE

/datum/supply_pack/companies/nakamura_modsuits/novelty_modules/rave
	contains = list(/obj/item/mod/module/visor/rave)
	cost = PAYCHECK_CREW
	contraband = TRUE

/datum/supply_pack/companies/nakamura_modsuits/novelty_modules/hat_stabilizer
	contains = list(/obj/item/mod/module/hat_stabilizer)
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/nakamura_modsuits/novelty_modules/kinesis
	contains = list(/obj/item/mod/module/anomaly_locked/kinesis/prebuilt/locked)
	cost = PAYCHECK_COMMAND * 20

/datum/supply_pack/companies/nakamura_modsuits/novelty_modules/antigrav
	contains = list(/obj/item/mod/module/anomaly_locked/antigrav/prebuilt/locked)
	cost = PAYCHECK_COMMAND * 20

/datum/supply_pack/companies/nakamura_modsuits/novelty_modules/teleporter
	contains = list(/obj/item/mod/module/anomaly_locked/teleporter/prebuilt/locked)
	cost = PAYCHECK_COMMAND * 30
