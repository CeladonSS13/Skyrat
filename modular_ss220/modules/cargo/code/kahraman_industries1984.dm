/datum/armament_entry/company_import/kahraman
	category = KAHRAMAN_INDUSTRIES_NAME
	company_bitflag = CARGO_COMPANY_KAHRAMAN

/datum/armament_entry/company_import/kahraman/basic
	subcategory = "Hand-Held Equipment"
	cost = PAYCHECK_COMMAND * 3

/datum/armament_entry/company_import/kahraman/basic/compact_drill
	item_type = /obj/item/pickaxe/drill/compact

/datum/armament_entry/company_import/kahraman/basic/gps
	item_type = /obj/item/gps
	cost = PAYCHECK_LOWER * 3

/datum/armament_entry/company_import/kahraman/basic/fireproof_spray
	item_type = /obj/item/fireproof_spray


/// Kahraman-made machines
/datum/armament_entry/company_import/kahraman/machinery
	subcategory = "Machinery"

/datum/armament_entry/company_import/kahraman/machinery/ore_thumper
	item_type = /obj/item/flatpacked_machine/ore_thumper
	description = "A frame with a heavy block of metal suspended atop a pipe. \
		Must be deployed outdoors and given a wired power connection. \
		Forces pressurized gas into the ground which brings up buried resources."
	cost = CARGO_CRATE_VALUE * 12

/datum/armament_entry/company_import/kahraman/machinery/gps_beacon
	item_type = /obj/item/flatpacked_machine/gps_beacon
	description = "A packed GPS beacon, can be deployed and anchored into the ground to \
		provide and unobstructed homing beacon for wayward travelers across the galaxy."
	cost = PAYCHECK_LOWER * 6

// Occupational health and safety? Never heard of her.

/datum/armament_entry/company_import/kahraman/ppe
	subcategory = "Protective Equipment"

/datum/armament_entry/company_import/kahraman/ppe/hazard_mod
	name = "Frontier Hazard Compressed Belt-type Modsuit"
	item_type = /obj/item/mod/control/pre_equipped/frontier_colonist
	description =  "The pinnacle of frontier cheap technology(spaceproof and shockproof). Suits such as these are made \
		specifically for the rare emergency that creates a hazard environment that other \
		equipment just can't quite handle. Compressed enough to fit on your belt."
	cost = PAYCHECK_COMMAND * 15

/datum/armament_entry/company_import/kahraman/ppe/gas_mask
	item_type = /obj/item/clothing/mask/gas/atmos/frontier_colonist
	cost = PAYCHECK_COMMAND * 3

/datum/armament_entry/company_import/kahraman/ppe/headset
	item_type = /obj/item/radio/headset/headset_frontier_colonist
	cost = PAYCHECK_COMMAND * 2

/datum/armament_entry/company_import/kahraman/ppe/flak_vest
	item_type = /obj/item/clothing/suit/frontier_colonist_flak
	cost = PAYCHECK_CREW * 3

/datum/armament_entry/company_import/kahraman/ppe/tanker_helmet
	item_type = /obj/item/clothing/head/frontier_colonist_helmet
	cost = PAYCHECK_CREW * 3

// Work clothing

/datum/armament_entry/company_import/kahraman/work_clothing
	subcategory = "Clothing"
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/kahraman/work_clothing/jumpsuit
	item_type = /obj/item/clothing/under/frontier_colonist
	cost = PAYCHECK_LOWER

/datum/armament_entry/company_import/kahraman/work_clothing/jacket
	item_type = /obj/item/clothing/suit/jacket/frontier_colonist
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/kahraman/work_clothing/jacket_short
	item_type = /obj/item/clothing/suit/jacket/frontier_colonist/short
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/kahraman/work_clothing/med_jacket
	item_type = /obj/item/clothing/suit/jacket/frontier_colonist/medical
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/kahraman/work_clothing/ballcap
	item_type = /obj/item/clothing/head/soft/frontier_colonist

/datum/armament_entry/company_import/kahraman/work_clothing/med_ballcap
	item_type = /obj/item/clothing/head/soft/frontier_colonist/medic

/datum/armament_entry/company_import/kahraman/work_clothing/booties
	item_type = /obj/item/clothing/shoes/jackboots/frontier_colonist
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/kahraman/work_clothing/gloves
	item_type = /obj/item/clothing/gloves/frontier_colonist

// "Equipment", so storage items and whatnot

/datum/armament_entry/company_import/kahraman/storage_equipment
	subcategory = "Personal Equipment"
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/kahraman/storage_equipment/backpack
	item_type = /obj/item/storage/backpack/industrial/frontier_colonist

/datum/armament_entry/company_import/kahraman/storage_equipment/satchel
	item_type = /obj/item/storage/backpack/industrial/frontier_colonist/satchel

/datum/armament_entry/company_import/kahraman/storage_equipment/messenger
	item_type = /obj/item/storage/backpack/industrial/frontier_colonist/messenger

/datum/armament_entry/company_import/kahraman/storage_equipment/belt
	item_type = /obj/item/storage/belt/utility/frontier_colonist
	cost = PAYCHECK_LOWER * 3

/datum/armament_entry/company_import/kahraman/storage_equipment/vest
	item_type = /obj/item/clothing/accessory/webbing/colonial
	cost = PAYCHECK_COMMAND * 2
