/datum/supply_pack/companies/kahraman
	group = KAHRAMAN_INDUSTRIES_NAME_1984
	special = FALSE // required to be shown in cargo
	special_enabled = TRUE // required to be shown in cargo
	dangerous = FALSE // required to be shown in cargo

/datum/supply_pack/companies/kahraman/basic
	cost = PAYCHECK_COMMAND * 3

/datum/supply_pack/companies/kahraman/basic/compact_drill
	contains = list(/obj/item/pickaxe/drill/compact)

/datum/supply_pack/companies/kahraman/basic/gps
	contains = list(/obj/item/gps)
	cost = PAYCHECK_LOWER * 3

/datum/supply_pack/companies/kahraman/basic/fireproof_spray
	contains = list(/obj/item/fireproof_spray)
	cost = PAYCHECK_COMMAND * 4

/// Kahraman-made machines

/datum/supply_pack/companies/kahraman/machinery/ore_thumper
	contains = list(/obj/item/flatpacked_machine/ore_thumper)
	cost = CARGO_CRATE_VALUE * 12

/datum/supply_pack/companies/kahraman/machinery/gps_beacon
	contains = list(/obj/item/flatpacked_machine/gps_beacon)
	cost = PAYCHECK_LOWER * 6

// Occupational health and safety? Never heard of her.

/datum/supply_pack/companies/kahraman/ppe/hazard_mod
	name = "Frontier Hazard Compressed Belt-type Modsuit"
	contains = list(/obj/item/mod/control/pre_equipped/frontier_colonist)
	cost = PAYCHECK_COMMAND * 15

/datum/supply_pack/companies/kahraman/ppe/gas_mask
	contains = list(/obj/item/clothing/mask/gas/atmos/frontier_colonist)
	cost = PAYCHECK_COMMAND * 3

/datum/supply_pack/companies/kahraman/ppe/headset
	contains = list(/obj/item/radio/headset/headset_frontier_colonist)
	cost = PAYCHECK_COMMAND * 2

/datum/supply_pack/companies/kahraman/ppe/flak_vest
	contains = list(/obj/item/clothing/suit/frontier_colonist_flak)
	cost = PAYCHECK_CREW * 3

/datum/supply_pack/companies/kahraman/ppe/tanker_helmet
	contains = list(/obj/item/clothing/head/frontier_colonist_helmet)
	cost = PAYCHECK_CREW * 3

// Work clothing

/datum/supply_pack/companies/kahraman/work_clothing
	cost = PAYCHECK_CREW

/datum/supply_pack/companies/kahraman/work_clothing/jumpsuit
	contains = list(/obj/item/clothing/under/frontier_colonist)
	cost = PAYCHECK_LOWER

/datum/supply_pack/companies/kahraman/work_clothing/jacket
	contains = list(/obj/item/clothing/suit/jacket/frontier_colonist)
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/kahraman/work_clothing/jacket_short
	contains = list(/obj/item/clothing/suit/jacket/frontier_colonist/short)
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/kahraman/work_clothing/med_jacket
	contains = list(/obj/item/clothing/suit/jacket/frontier_colonist/medical)
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/kahraman/work_clothing/ballcap
	contains = list(/obj/item/clothing/head/soft/frontier_colonist)

/datum/supply_pack/companies/kahraman/work_clothing/med_ballcap
	contains = list(/obj/item/clothing/head/soft/frontier_colonist/medic)

/datum/supply_pack/companies/kahraman/work_clothing/booties
	contains = list(/obj/item/clothing/shoes/jackboots/frontier_colonist)
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/kahraman/work_clothing/gloves
	contains = list(/obj/item/clothing/gloves/frontier_colonist)

// "Equipment", so storage items and whatnot

/datum/supply_pack/companies/kahraman/storage_equipment
	cost = PAYCHECK_CREW

/datum/supply_pack/companies/kahraman/storage_equipment/backpack
	contains = list(/obj/item/storage/backpack/industrial/frontier_colonist)

/datum/supply_pack/companies/kahraman/storage_equipment/satchel
	contains = list(/obj/item/storage/backpack/industrial/frontier_colonist/satchel)

/datum/supply_pack/companies/kahraman/storage_equipment/messenger
	contains = list(/obj/item/storage/backpack/industrial/frontier_colonist/messenger)

/datum/supply_pack/companies/kahraman/storage_equipment/belt
	contains = list(/obj/item/storage/belt/utility/frontier_colonist)
	cost = PAYCHECK_LOWER * 3

/datum/supply_pack/companies/kahraman/storage_equipment/vest
	contains = list(/obj/item/clothing/accessory/webbing/colonial)
	cost = PAYCHECK_COMMAND
