/datum/armament_entry/company_import/blacksteel
	category = BLACKSTEEL_FOUNDATION_NAME
	company_bitflag = CARGO_COMPANY_BLACKSTEEL

// A collection of melee weapons fitting the company's more exotic feeling weapon selection

/datum/armament_entry/company_import/blacksteel/blade
	subcategory = "Bladed Weapons"

/datum/armament_entry/company_import/blacksteel/blade/hunting_knife
	item_type = /obj/item/knife/hunting
	cost = PAYCHECK_CREW * 4

/datum/armament_entry/company_import/blacksteel/blade/survival_knife
	item_type = /obj/item/knife/combat/survival
	cost = PAYCHECK_CREW * 6

/datum/armament_entry/company_import/blacksteel/blade/throwing_knife
	item_type = /obj/item/knife/combat/throwing
	contraband = TRUE
	restricted = TRUE
	cost = PAYCHECK_COMMAND * 10

/datum/armament_entry/company_import/blacksteel/blade/bowie_knife
	item_type = /obj/item/storage/belt/bowie_sheath
	contraband = TRUE
	restricted = TRUE
	cost = PAYCHECK_COMMAND * 10

/datum/armament_entry/company_import/blacksteel/blade/combat_knide
	item_type = /obj/item/knife/combat
	contraband = TRUE
	restricted = TRUE
	cost = PAYCHECK_COMMAND * 20

/datum/armament_entry/company_import/blacksteel/blade/tomahawk
	item_type = /obj/item/melee/tomahawk
	contraband = TRUE
	restricted = TRUE
	cost = PAYCHECK_COMMAND * 25

/datum/armament_entry/company_import/blacksteel/blade/shamshir_sabre
	item_type = /obj/item/storage/belt/sheath/sabre/cargo
	restricted = TRUE
	cost = PAYCHECK_COMMAND * 18

// Shields.

/datum/armament_entry/company_import/blacksteel/shield
	subcategory = "Shields"
	cost = PAYCHECK_COMMAND * 5

/datum/armament_entry/company_import/blacksteel/shield/buckler
	item_type = /obj/item/shield/buckler

/datum/armament_entry/company_import/blacksteel/shield/kite
	item_type = /obj/item/shield/kite

// Medieval Equipment

/datum/armament_entry/company_import/blacksteel/equipment
	subcategory = "Medieval Equipment"

/datum/armament_entry/company_import/blacksteel/equipment/belt
	item_type = /obj/item/storage/belt/crusader
	cost = PAYCHECK_COMMAND * 8

/datum/armament_entry/company_import/blacksteel/equipment/cuirass
	item_type = /obj/item/clothing/suit/armor/vest/cuirass
	cost = PAYCHECK_COMMAND * 3

/datum/armament_entry/company_import/blacksteel/equipment/quiver
	item_type = /obj/item/storage/bag/quiver/full
	restricted = TRUE
	cost = PAYCHECK_COMMAND * 6

// Ranged Weaponry

/datum/armament_entry/company_import/blacksteel/ranged
	subcategory = "Ranged Weaponry"

/datum/armament_entry/company_import/blacksteel/ranged/longbow
	item_type = /obj/item/gun/ballistic/bow/longbow
	description = "Holds arrows for your bow. Good, because while pocketing arrows is possible, it surely can't be pleasant. Comes with 10 arrows!"
	cost = PAYCHECK_COMMAND * 8

// Forging tools, blacksteel company sells the tools and materials they use as well!

/datum/armament_entry/company_import/blacksteel/forging_tools
	subcategory = "Premium Forging Equipment"
	cost = PAYCHECK_LOWER

/datum/armament_entry/company_import/blacksteel/forging_tools/billows
	item_type = /obj/item/forging/billow

/datum/armament_entry/company_import/blacksteel/forging_tools/hammer
	item_type = /obj/item/forging/hammer

/datum/armament_entry/company_import/blacksteel/forging_tools/tongs
	item_type = /obj/item/forging/tongs

// Fancy sounding and looking bars of metal that most definitely aren't just common metals with a fancy sounding name

/datum/armament_entry/company_import/blacksteel/forging_metals
	subcategory = "Premium Metal Supplies"
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/blacksteel/forging_metals/fake_cobalt
	item_type = /obj/item/stack/sheet/cobolterium/three
	description = "A three-pack of our finest cobolterium alloy, with an unmatched regal blue color for creating the strongest metalworks from."

/datum/armament_entry/company_import/blacksteel/forging_metals/fake_copper
	item_type = /obj/item/stack/sheet/copporcitite/three
	description = "A three-pack of our finest copporcitite alloy, with a powerful, fiery orange color for creating the strongest metalworks from."

/datum/armament_entry/company_import/blacksteel/forging_metals/fake_really_blue_aluminum
	item_type = /obj/item/stack/sheet/tinumium/three
	description = "A three-pack of our finest tinumium alloy, with a mystical faded blue color for creating the strongest metalworks from."

/datum/armament_entry/company_import/blacksteel/forging_metals/fake_brass
	item_type = /obj/item/stack/sheet/brussite/three
	description = "A three-pack of our finest brussite alloy, with a robust yellow color for creating the strongest metalworks from."
