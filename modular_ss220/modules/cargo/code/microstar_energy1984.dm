/datum/supply_pack/companies/microstar
	group = MICROSTAR_ENERGY_NAME_1984
	special = FALSE // required to be shown in cargo
	special_enabled = TRUE // required to be shown in cargo
	dangerous = FALSE // required to be shown in cargo

// Basic lethal/disabler beam weapons

/datum/supply_pack/companies/microstar/basic_energy_weapons
	access = ACCESS_WEAPONS
	access_view = ACCESS_WEAPONS

/datum/supply_pack/companies/microstar/basic_energy_weapons/disabler
	contains = list(/obj/item/gun/energy/disabler)
	cost = PAYCHECK_COMMAND * 9

/datum/supply_pack/companies/microstar/basic_energy_weapons/disabler_smg
	contains = list(/obj/item/gun/energy/disabler/smg)
	cost = PAYCHECK_COMMAND * 14
	contraband = TRUE

/datum/supply_pack/companies/microstar/basic_energy_weapons/advtaser
	contains = list(/obj/item/gun/energy/e_gun/advtaser)
	cost = PAYCHECK_COMMAND * 10

/datum/supply_pack/companies/microstar/basic_energy_weapons/mini_egun
	contains = list(/obj/item/gun/energy/e_gun/mini)
	cost = PAYCHECK_COMMAND * 10

/datum/supply_pack/companies/microstar/basic_energy_long_weapons
	access = ACCESS_WEAPONS
	access_view = ACCESS_WEAPONS

/datum/supply_pack/companies/microstar/basic_energy_long_weapons/laser
	contains = list(/obj/item/gun/energy/laser)
	cost = PAYCHECK_COMMAND * 5

/datum/supply_pack/companies/microstar/basic_energy_long_weapons/laser_carbine
	contains = list(/obj/item/gun/energy/laser/carbine)
	cost = PAYCHECK_COMMAND * 13
	contraband = TRUE

/datum/supply_pack/companies/microstar/basic_energy_long_weapons/egun
	contains = list(/obj/item/gun/energy/e_gun)
	cost = PAYCHECK_COMMAND * 15

// Preset 'loadout' kits built around a barrel attachment

/datum/supply_pack/companies/microstar/mcr_attachments
	cost = PAYCHECK_COMMAND * 20

/datum/supply_pack/companies/microstar/mcr_attachments/hellfire
	name = "microfusion hellfire kit"
	contains = list(/obj/item/storage/briefcase/secure/white/mcr_loadout/hellfire)

/datum/supply_pack/companies/microstar/mcr_attachments/scatter
	name = "microfusion scatter kit"
	contains = list(/obj/item/storage/briefcase/secure/white/mcr_loadout/scatter)

/datum/supply_pack/companies/microstar/mcr_attachments/lance
	name = "microfusion lance kit"
	contains = list(/obj/item/storage/briefcase/secure/white/mcr_loadout/lance)

/datum/supply_pack/companies/microstar/mcr_attachments/repeater
	name = "microfusion repeater kit"
	contains = list(/obj/item/storage/briefcase/secure/white/mcr_loadout/repeater)

/datum/supply_pack/companies/microstar/mcr_attachments/tacticool
	name = "microfusion suppressor kit"
	contains = list(/obj/item/storage/briefcase/secure/white/mcr_loadout/tacticool)
	contraband = TRUE

// Improved phase emitters, cells, and cell attachments

/datum/supply_pack/companies/microstar/mcr_upgrades/enhanced_part_kit
	name = "microfusion enhanced parts"
	contains = list(/obj/item/storage/briefcase/secure/white/mcr_parts/enhanced)
	cost = PAYCHECK_COMMAND * 5

/datum/supply_pack/companies/microstar/mcr_upgrades/capacity_booster
	contains = list(/obj/item/microfusion_cell_attachment/overcapacity)
	cost = PAYCHECK_COMMAND * 4
