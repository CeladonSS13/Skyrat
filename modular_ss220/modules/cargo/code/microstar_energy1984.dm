/datum/armament_entry/company_import/microstar
	category = MICROSTAR_ENERGY_NAME
	company_bitflag = CARGO_COMPANY_MICROSTAR

// Basic lethal/disabler beam weapons

/datum/armament_entry/company_import/microstar/basic_energy_weapons
	subcategory = "Basic Energy Smallarms"

/datum/armament_entry/company_import/microstar/basic_energy_weapons/mini_egun
	item_type = /obj/item/gun/energy/e_gun/mini
	cost = PAYCHECK_COMMAND * 10

/datum/armament_entry/company_import/microstar/basic_energy_weapons/advtaser
	item_type = /obj/item/gun/energy/e_gun/advtaser
	cost = PAYCHECK_COMMAND * 12
	contraband = TRUE

/datum/armament_entry/company_import/microstar/basic_energy_weapons/disabler
	item_type = /obj/item/gun/energy/disabler
	cost = PAYCHECK_COMMAND * 9
	restricted = TRUE

/datum/armament_entry/company_import/microstar/basic_energy_weapons/disabler_smg
	item_type = /obj/item/gun/energy/disabler/smg
	cost = PAYCHECK_COMMAND * 15
	restricted = TRUE
