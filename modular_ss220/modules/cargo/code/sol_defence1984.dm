/datum/armament_entry/company_import/sol_defense
	category = SOL_DEFENSE_DEFENSE_NAME
	company_bitflag = CARGO_COMPANY_SOL_DEFENSE

// Beautiful SolFed clothing

/datum/armament_entry/company_import/sol_defense/clothing
	subcategory = "Surplus Clothing"
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/sol_defense/clothing/peacekeeper
	item_type = /obj/item/clothing/under/sol_peacekeeper

/datum/armament_entry/company_import/sol_defense/clothing/emt
	item_type = /obj/item/clothing/under/sol_emt

/datum/armament_entry/company_import/sol_defense/clothing/hecu_mask
	item_type = /obj/item/clothing/mask/gas/hecu
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/sol_defense/clothing/mil_gloves
	item_type = /obj/item/clothing/gloves/military

/datum/armament_entry/company_import/sol_defense/clothing/combat_boots // armored boots
	name = "Combat Boots"
	item_type = /obj/item/clothing/shoes/combat
	cost = PAYCHECK_COMMAND * 4

/datum/armament_entry/company_import/sol_defense/misc
	subcategory = "Miscellaneous Supplies"

/datum/armament_entry/company_import/sol_defense/misc/hecu_food
	item_type = /obj/item/storage/box/hecu_rations
	cost = PAYCHECK_COMMAND * 2

/datum/armament_entry/company_import/sol_defense/misc/sol_flag
	item_type = /obj/item/sign/flag/terragov
	cost = PAYCHECK_LOWER

/datum/armament_entry/company_import/sol_defense/armor
	subcategory = "Ballistic Armor"
	contraband = TRUE
	cost = PAYCHECK_CREW * 6

/datum/armament_entry/company_import/sol_defense/armor/slim_vest
	name = "type I vest - slim"
	item_type = /obj/item/clothing/suit/armor/vest

/datum/armament_entry/company_import/sol_defense/armor/ballistic_helmet
	item_type = /obj/item/clothing/head/helmet/sf_peacekeeper/debranded

/datum/armament_entry/company_import/sol_defense/armor/sf_ballistic_helmet
	item_type = /obj/item/clothing/head/helmet/sf_peacekeeper

/datum/armament_entry/company_import/sol_defense/armor/soft_vest
	item_type = /obj/item/clothing/suit/armor/sf_peacekeeper/debranded

/datum/armament_entry/company_import/sol_defense/armor/sf_soft_vest
	item_type = /obj/item/clothing/suit/armor/sf_peacekeeper

/datum/armament_entry/company_import/sol_defense/armor/flak_jacket
	item_type = /obj/item/clothing/suit/armor/vest/sol

/datum/armament_entry/company_import/sol_defense/case
	subcategory = "Weapon Cases"
	cost = PAYCHECK_COMMAND * 3

/datum/armament_entry/company_import/sol_defense/case/trappiste
	item_type = /obj/item/storage/toolbox/guncase/nova/pistol/trappiste_small_case

/datum/armament_entry/company_import/sol_defense/case/carwo
	item_type = /obj/item/storage/toolbox/guncase/nova/carwo_large_case
	cost = PAYCHECK_COMMAND * 5

/datum/armament_entry/company_import/sol_defense/sidearm
	subcategory = "Sidearms"
	cost = PAYCHECK_COMMAND * 5
	contraband = TRUE
	restricted = TRUE

/datum/armament_entry/company_import/sol_defense/sidearm/eland
	item_type = /obj/item/gun/ballistic/revolver/sol
	cost = PAYCHECK_COMMAND * 8

/datum/armament_entry/company_import/sol_defense/sidearm/wespe
	item_type = /obj/item/gun/ballistic/automatic/pistol/sol
	cost = PAYCHECK_COMMAND * 10

/datum/armament_entry/company_import/sol_defense/sidearm/type207
	item_type = /obj/item/gun/ballistic/automatic/pistol/type207
	contraband = FALSE
	restricted = FALSE

/datum/armament_entry/company_import/sol_defense/sidearm/skild
	item_type = /obj/item/gun/ballistic/automatic/pistol/trappiste
	cost = PAYCHECK_COMMAND * 12

/datum/armament_entry/company_import/sol_defense/sidearm/takbok
	item_type = /obj/item/gun/ballistic/revolver/takbok
	cost = PAYCHECK_COMMAND * 12


/datum/armament_entry/company_import/sol_defense/longarm
	subcategory = "Longarms"
	cost = PAYCHECK_COMMAND * 8
	restricted = TRUE
	contraband = TRUE

/datum/armament_entry/company_import/sol_defense/longarm/renoster
	item_type = /obj/item/gun/ballistic/shotgun/riot/sol
	cost = PAYCHECK_COMMAND * 12

/datum/armament_entry/company_import/sol_defense/longarm/sindano
	item_type = /obj/item/gun/ballistic/automatic/sol_smg
	cost = PAYCHECK_COMMAND * 11

/datum/armament_entry/company_import/sol_defense/longarm/type213
	item_type = /obj/item/gun/ballistic/automatic/type213
	restricted = FALSE
	contraband = FALSE

/datum/armament_entry/company_import/sol_defense/longarm/jager
	item_type = /obj/item/gun/ballistic/shotgun/katyusha/jager
	cost = PAYCHECK_COMMAND * 22

/datum/armament_entry/company_import/sol_defense/longarm/kiboko
	item_type = /obj/item/gun/ballistic/automatic/sol_grenade_launcher
	cost = PAYCHECK_COMMAND * 50


/datum/armament_entry/company_import/sol_defense/magazines
	subcategory = "Magazines"
	cost = PAYCHECK_CREW * 2
	contraband = TRUE
	restricted = TRUE

/datum/armament_entry/company_import/sol_defense/magazines/c35_mag
	item_type = /obj/item/ammo_box/magazine/c35sol_pistol/starts_empty
	cost = PAYCHECK_CREW * 3

/datum/armament_entry/company_import/sol_defense/magazines/c35_extended
	item_type = /obj/item/ammo_box/magazine/c35sol_pistol/stendo/starts_empty
	cost = PAYCHECK_CREW * 4

/datum/armament_entry/company_import/sol_defense/magazines/c585_mag
	item_type = /obj/item/ammo_box/magazine/c585trappiste_pistol/spawns_empty
	cost = PAYCHECK_CREW * 3

/datum/armament_entry/company_import/sol_defense/magazines/br38
	item_type = /obj/item/ammo_box/magazine/m38/empty
	cost = PAYCHECK_CREW * 4

/datum/armament_entry/company_import/sol_defense/magazines/kineticballs
	item_type = /obj/item/ammo_box/magazine/kineticballs/starts_empty
	contraband = FALSE
	restricted = FALSE

/datum/armament_entry/company_import/sol_defense/magazines/kineticballsbig
	item_type = /obj/item/ammo_box/magazine/kineticballsbig/starts_empty
	contraband = FALSE
	restricted = FALSE

/datum/armament_entry/company_import/sol_defense/magazines/sol_rifle_short
	item_type = /obj/item/ammo_box/magazine/c40sol_rifle/starts_empty
	cost = PAYCHECK_CREW * 2

/datum/armament_entry/company_import/sol_defense/magazines/sol_rifle_standard
	item_type = /obj/item/ammo_box/magazine/c40sol_rifle/standard/starts_empty
	cost = PAYCHECK_CREW * 3

/datum/armament_entry/company_import/sol_defense/magazines/jager_shotgun_regular
	item_type = /obj/item/ammo_box/magazine/jager/empty
	cost = PAYCHECK_COMMAND * 2

/datum/armament_entry/company_import/sol_defense/magazines/jager_shotgun_Large
	item_type = /obj/item/ammo_box/magazine/jager/large/empty
	cost = PAYCHECK_COMMAND * 3

/datum/armament_entry/company_import/sol_defense/magazines/sol_grenade_standard
	item_type = /obj/item/ammo_box/magazine/c980_grenade/starts_empty
	cost = PAYCHECK_CREW * 4

/datum/armament_entry/company_import/sol_defense/magazines/sol_grenade_drum
	item_type = /obj/item/ammo_box/magazine/c980_grenade/drum/starts_empty
	cost = PAYCHECK_CREW * 6

