/datum/armament_entry/company_import/nri_surplus
	category = NRI_SURPLUS_COMPANY_NAME_1984

// Various NRI clothing items

/datum/armament_entry/company_import/nri_surplus/clothing
	subcategory = "Clothing Supplies"
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/nri_surplus/clothing/uniform
	item_type = /obj/item/clothing/under/syndicate/rus_army/cin_surplus/random_color

/datum/armament_entry/company_import/nri_surplus/clothing/belt
	item_type = /obj/item/storage/belt/military/cin_surplus/random_color

/datum/armament_entry/company_import/nri_surplus/clothing/backpack
	item_type = /obj/item/storage/backpack/industrial/cin_surplus/random_color

/datum/armament_entry/company_import/nri_surplus/clothing/police_uniform
	item_type = /obj/item/clothing/under/colonial/nri_police

/datum/armament_entry/company_import/nri_surplus/clothing/police_cloak
	item_type = /obj/item/clothing/neck/cloak/colonial/nri_police

/datum/armament_entry/company_import/nri_surplus/clothing/police_cap
	item_type = /obj/item/clothing/head/hats/colonial/nri_police

/datum/armament_entry/company_import/nri_surplus/clothing/police_baseball_cap
	item_type = /obj/item/clothing/head/soft/nri_police

/datum/armament_entry/company_import/nri_surplus/clothing/police_mask
	item_type = /obj/item/clothing/mask/gas/nri_police
	cost = PAYCHECK_CREW * 2

/datum/armament_entry/company_import/nri_surplus/space
	subcategory = "Special Supplies"
	contraband = TRUE

/datum/armament_entry/company_import/nri_surplus/space/voskhod_suit
	item_type = /obj/item/clothing/suit/space/voskhod
	cost = PAYCHECK_COMMAND * 10

/datum/armament_entry/company_import/nri_surplus/space/voskhod_helmet
	item_type = /obj/item/clothing/head/helmet/space/voskhod
	cost = PAYCHECK_COMMAND * 5

/datum/armament_entry/company_import/nri_surplus/space/voskhod_refit_kit
	item_type = /obj/item/crafting_conversion_kit/voskhod_refit
	cost = PAYCHECK_COMMAND * 15

/datum/armament_entry/company_import/nri_surplus/space/voskhod_autodoc_refill
	item_type = /obj/item/reagent_containers/cup/glass/waterbottle/large/protozine
	cost = PAYCHECK_COMMAND * 2

/datum/armament_entry/company_import/nri_surplus/space/military_nri_autodoc_refill
	item_type = /obj/item/reagent_containers/cup/glass/waterbottle/large/cryptobiolin
	cost = PAYCHECK_COMMAND * 3
	high_contraband = TRUE

/datum/armament_entry/company_import/nri_surplus/armor
	subcategory = "Armor Supplies"
	cost = PAYCHECK_COMMAND * 3
	restricted = TRUE

/datum/armament_entry/company_import/nri_surplus/armor/cin_helmet
	item_type = /obj/item/clothing/head/helmet/cin_surplus_helmet/random_color

/datum/armament_entry/company_import/nri_surplus/armor/cin_vest
	item_type = /obj/item/clothing/suit/armor/vest/cin_surplus_vest

/datum/armament_entry/company_import/nri_surplus/armor/police_vest
	item_type = /obj/item/clothing/head/helmet/nri_police

/datum/armament_entry/company_import/nri_surplus/armor/police_helmet
	item_type = /obj/item/clothing/suit/armor/vest/nri_police


/datum/armament_entry/company_import/nri_surplus/armor/police_jacket
	item_type = /obj/item/clothing/suit/armor/vest/nri_police_jacket

/datum/armament_entry/company_import/nri_surplus/armor/police_suit_jacket
	item_type = /obj/item/clothing/suit/armor/vest/nri_police_jacket/suit
	description = "A black uniform jacket with Zvirdnyan Colonial Militia's signature white rectangle on its right sleeve and backside. \
	Letters inside the collar usually read the wearer's rank and internal kink. The jacket is of exceptional quality."

// Pouches

/datum/armament_entry/company_import/nri_surplus/pouches
	subcategory = "Pouches"
	cost = PAYCHECK_CREW * 3

/datum/armament_entry/company_import/nri_surplus/pouches/medipen
	item_type = /obj/item/storage/pouch/cin_medipens

/datum/armament_entry/company_import/nri_surplus/pouches/medikit
	item_type = /obj/item/storage/pouch/cin_medkit

/datum/armament_entry/company_import/nri_surplus/pouches/general
	item_type = /obj/item/storage/pouch/cin_general

/datum/armament_entry/company_import/nri_surplus/misc
	subcategory = "Miscellaneous Supplies"
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/nri_surplus/misc/stun_gun //Not a gun but it's only fair to place similar items close to each other
	item_type = /obj/item/melee/baton/security/stun_gun/loaded
	cost = PAYCHECK_COMMAND * 5 //Similarly live action roleplay'iy stun baton lite

/datum/armament_entry/company_import/nri_surplus/misc/flares
	item_type = /obj/item/storage/box/nri_flares
	cost = PAYCHECK_LOWER

/datum/armament_entry/company_import/nri_surplus/misc/binoculars
	item_type = /obj/item/binoculars
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/nri_surplus/misc/screwdriver_pen
	item_type = /obj/item/pen/screwdriver
	cost = PAYCHECK_LOWER * 3

/datum/armament_entry/company_import/nri_surplus/misc/trench_tool
	item_type = /obj/item/trench_tool
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/nri_surplus/misc/nri_food
	item_type = /obj/item/storage/box/colonial_rations
	cost = PAYCHECK_COMMAND * 2

/datum/armament_entry/company_import/nri_surplus/misc/food_replicator
	description = "A widespread technology previously used by far colonies on the NRI's borders, over time being shifted from the foundation of colonies \
	to a simple disaster relief solution. It can turn spoiled or inedible plant matter into food, medical supplies, and other general items. \
	These particular units were displaced during a stock count in an NRI warehouse."
	item_type = /obj/item/circuitboard/machine/biogenerator/food_replicator
	cost = CARGO_CRATE_VALUE * 9

/datum/armament_entry/company_import/nri_surplus/misc/nri_flag
	item_type = /obj/item/sign/flag/nri
	cost = PAYCHECK_LOWER

/datum/armament_entry/company_import/nri_surplus/misc/hc_flag
	item_type = /obj/item/sign/flag/hc
	cost = PAYCHECK_LOWER
	high_contraband = TRUE

/datum/armament_entry/company_import/nri_surplus/sidearm
	subcategory = "Sidearms"
	cost = PAYCHECK_COMMAND * 12
	restricted = TRUE

/datum/armament_entry/company_import/nri_surplus/sidearm/crank_taser
	item_type = /obj/item/gun/energy/taser/crank
	cost = PAYCHECK_COMMAND * 10
	restricted = FALSE

/datum/armament_entry/company_import/nri_surplus/sidearm/cb //contraband start, must be below non contraband items to display correctly
	contraband = TRUE

/datum/armament_entry/company_import/nri_surplus/sidearm/cb/shotgun_revolver
	item_type = /obj/item/gun/ballistic/revolver/shotgun_revolver

/datum/armament_entry/company_import/nri_surplus/sidearm/cb/zashch
	item_type = /obj/item/gun/ballistic/automatic/pistol/zashch
	cost = PAYCHECK_COMMAND * 19

/datum/armament_entry/company_import/nri_surplus/sidearm/cb/plasma_thrower
	item_type = /obj/item/gun/ballistic/automatic/pistol/plasma_thrower
	cost = PAYCHECK_COMMAND * 15

/datum/armament_entry/company_import/nri_surplus/sidearm/cb/plasma_marksman
	item_type = /obj/item/gun/ballistic/automatic/pistol/plasma_marksman
	cost = PAYCHECK_COMMAND * 15

/datum/armament_entry/company_import/nri_surplus/longarm
	subcategory = "Longarms"
	cost = PAYCHECK_COMMAND * 16
	restricted = TRUE

/datum/armament_entry/company_import/nri_surplus/longarm/lanca
	item_type = /obj/item/gun/ballistic/rifle/sporterized/qmr
	cost = PAYCHECK_COMMAND * 20
	restricted = FALSE

/*
/datum/armament_entry/company_import/nri_surplus/longarm/sakhno_rifle
	item_type = /obj/item/gun/ballistic/rifle/boltaction
	cost = PAYCHECK_COMMAND * 20

/datum/armament_entry/company_import/nri_surplus/longarm/lanca
	item_type = /obj/item/gun/ballistic/automatic/lanca
	cost = PAYCHECK_COMMAND * 24
	contraband = TRUE

/datum/armament_entry/company_import/nri_surplus/longarm/miecz
	item_type = /obj/item/gun/ballistic/automatic/miecz
	cost = PAYCHECK_COMMAND * 16
	contraband = TRUE

/datum/armament_entry/company_import/nri_surplus/longarm/napad
	item_type = /obj/item/gun/ballistic/automatic/napad
	cost = PAYCHECK_COMMAND * 19
	contraband = TRUE

/datum/armament_entry/company_import/nri_surplus/longarm/pulse_rifle
	item_type = /obj/item/gun/ballistic/automatic/pulse_rifle
	cost = PAYCHECK_COMMAND * 25
	contraband = TRUE

/datum/armament_entry/company_import/nri_surplus/longarm/pulse_sniper //for other time
	item_type = /obj/item/gun/ballistic/rifle/pulse_sniper
	cost = PAYCHECK_COMMAND * 22
	contraband = TRUE

/datum/armament_entry/company_import/nri_surplus/longarm/anti_materiel_rifle
	item_type = /obj/item/gun/ballistic/automatic/wylom
	cost = PAYCHECK_COMMAND * 36
	contraband = TRUE
*/

/datum/armament_entry/company_import/nri_surplus/firearm_ammo
	subcategory = "Firearm Magazines"
	cost = PAYCHECK_CREW * 2
	restricted = TRUE

/datum/armament_entry/company_import/nri_surplus/firearm_ammo/cb
	contraband = TRUE

/datum/armament_entry/company_import/nri_surplus/firearm_ammo/cb/zashch
	item_type = /obj/item/ammo_box/magazine/zashch
	cost = PAYCHECK_COMMAND * 2

/datum/armament_entry/company_import/nri_surplus/firearm_ammo/cb/miecz
	item_type = /obj/item/ammo_box/magazine/miecz
	cost = PAYCHECK_COMMAND * 3
	high_contraband = TRUE

/datum/armament_entry/company_import/nri_surplus/firearm_ammo/cb/napad
	item_type = /obj/item/ammo_box/magazine/napad
	cost = PAYCHECK_COMMAND * 9
	high_contraband = TRUE

/datum/armament_entry/company_import/nri_surplus/firearm_ammo/sakhno
	item_type = /obj/item/ammo_box/speedloader/strilka310
	cost = PAYCHECK_CREW * 6

/datum/armament_entry/company_import/nri_surplus/firearm_ammo/lanca_qm
	item_type = /obj/item/ammo_box/magazine/lanca/qmr
	cost = PAYCHECK_CREW * 3
	restricted = FALSE

/datum/armament_entry/company_import/nri_surplus/firearm_ammo/cb/lanca
	item_type = /obj/item/ammo_box/magazine/lanca
	cost = PAYCHECK_COMMAND * 6

/datum/armament_entry/company_import/nri_surplus/firearm_ammo/cb/plasma_battery
	item_type = /obj/item/ammo_box/magazine/recharge/plasma_battery
	cost = PAYCHECK_CREW * 3

/datum/armament_entry/company_import/nri_surplus/firearm_ammo/cb/zaibas
	item_type = /obj/item/ammo_box/magazine/pulse
	cost = PAYCHECK_COMMAND * 5
	high_contraband = TRUE

/datum/armament_entry/company_import/nri_surplus/firearm_ammo/cb/amr_magazine
	item_type = /obj/item/ammo_box/magazine/wylom
	cost = PAYCHECK_COMMAND * 7
	high_contraband = TRUE
