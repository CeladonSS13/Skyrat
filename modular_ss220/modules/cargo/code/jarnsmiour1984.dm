/datum/supply_pack/companies/blacksteel
	group = BLACKSTEEL_FOUNDATION_NAME_1984
	special = FALSE // required to be shown in cargo
	special_enabled = TRUE // required to be shown in cargo
	dangerous = FALSE // required to be shown in cargo

// A collection of melee weapons fitting the company's more exotic feeling weapon selection

/datum/supply_pack/companies/blacksteel/blade/hunting_knife
	contains = list(/obj/item/knife/hunting)
	cost = PAYCHECK_CREW * 4

/datum/supply_pack/companies/blacksteel/blade/survival_knife
	contains = list(/obj/item/knife/combat/survival)
	cost = PAYCHECK_CREW * 6

/datum/supply_pack/companies/blacksteel/blade/switchblade
	contains = list(/obj/item/switchblade)
	cost = PAYCHECK_COMMAND * 13

/datum/supply_pack/companies/blacksteel/blade/bowie_knife
	contains = list(/obj/item/storage/belt/bowie_sheath)
	cost = PAYCHECK_COMMAND * 12
	access = ACCESS_WEAPONS
	access_view = ACCESS_WEAPONS
	contraband = TRUE

/datum/supply_pack/companies/blacksteel/blade/throwing_knife
	contains = list(/obj/item/knife/combat/throwing)
	cost = PAYCHECK_COMMAND * 14
	access = ACCESS_WEAPONS
	access_view = ACCESS_WEAPONS
	contraband = TRUE

/datum/supply_pack/companies/blacksteel/blade/combat_knife
	contains = list(/obj/item/knife/combat)
	cost = PAYCHECK_COMMAND * 20
	access = ACCESS_WEAPONS
	access_view = ACCESS_WEAPONS
	contraband = TRUE

/datum/supply_pack/companies/blacksteel/blade/tomahawk
	contains = list(/obj/item/melee/tomahawk)
	cost = PAYCHECK_COMMAND * 25
	access = ACCESS_WEAPONS
	access_view = ACCESS_WEAPONS
	contraband = TRUE

/datum/supply_pack/companies/blacksteel/blade/shamshir_sabre
	contains = list(/obj/item/storage/belt/sheath/sabre/cargo)
	cost = PAYCHECK_COMMAND * 18
	access = ACCESS_WEAPONS
	access_view = ACCESS_WEAPONS

// Shields.

/datum/supply_pack/companies/blacksteel/shield
	cost = PAYCHECK_COMMAND * 5

/datum/supply_pack/companies/blacksteel/shield/buckler
	contains = list(/obj/item/shield/buckler)

/datum/supply_pack/companies/blacksteel/shield/kite
	contains = list(/obj/item/shield/kite)

// Medieval Equipment

/datum/supply_pack/companies/blacksteel/equipment
	cost = PAYCHECK_COMMAND * 3

/datum/supply_pack/companies/blacksteel/equipment/belt
	contains = list(/obj/item/storage/belt/crusader)
	cost = PAYCHECK_COMMAND * 8

/datum/supply_pack/companies/blacksteel/equipment/cuirass
	contains = list(/obj/item/clothing/suit/armor/vest/cuirass)

/datum/supply_pack/companies/blacksteel/equipment/quiver
	contains = list(/obj/item/storage/bag/quiver/full)
	cost = PAYCHECK_COMMAND * 6

// Ranged Weaponry

/datum/supply_pack/companies/blacksteel/ranged/longbow
	contains = list(/obj/item/gun/ballistic/bow/longbow)
	cost = PAYCHECK_COMMAND * 8

// Forging tools, blacksteel company sells the tools and materials they use as well!

/datum/supply_pack/companies/blacksteel/forging_tools
	cost = PAYCHECK_LOWER

/datum/supply_pack/companies/blacksteel/forging_tools/billows
	contains = list(/obj/item/forging/billow)

/datum/supply_pack/companies/blacksteel/forging_tools/hammer
	contains = list(/obj/item/forging/hammer)

/datum/supply_pack/companies/blacksteel/forging_tools/tongs
	contains = list(/obj/item/forging/tongs)

// Fancy sounding and looking bars of metal that most definitely aren't just common metals with a fancy sounding name

/datum/supply_pack/companies/blacksteel/forging_metals
	cost = PAYCHECK_CREW

/datum/supply_pack/companies/blacksteel/forging_metals/fake_cobalt
	contains = list(/obj/item/stack/sheet/cobolterium/three)

/datum/supply_pack/companies/blacksteel/forging_metals/fake_copper
	contains = list(/obj/item/stack/sheet/copporcitite/three)

/datum/supply_pack/companies/blacksteel/forging_metals/fake_really_blue_aluminum
	contains = list(/obj/item/stack/sheet/tinumium/three)

/datum/supply_pack/companies/blacksteel/forging_metals/fake_brass
	contains = list(/obj/item/stack/sheet/brussite/three)
