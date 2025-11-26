/datum/supply_pack/companies/nri_surplus
	group = NRI_SURPLUS_COMPANY_NAME_1984
	special = FALSE // required to be shown in cargo
	special_enabled = TRUE // required to be shown in cargo
	dangerous = FALSE // required to be shown in cargo

// Various NRI clothing items

/datum/supply_pack/companies/nri_surplus/clothing
	cost = PAYCHECK_CREW

/datum/supply_pack/companies/nri_surplus/clothing/uniform
	contains = list(/obj/item/clothing/under/syndicate/rus_army/cin_surplus/random_color)

/datum/supply_pack/companies/nri_surplus/clothing/belt
	contains = list(/obj/item/storage/belt/military/cin_surplus/random_color)

/datum/supply_pack/companies/nri_surplus/clothing/backpack
	contains = list(/obj/item/storage/backpack/industrial/cin_surplus/random_color)

/datum/supply_pack/companies/nri_surplus/clothing/police_uniform
	contains = list(/obj/item/clothing/under/colonial/nri_police)

/datum/supply_pack/companies/nri_surplus/clothing/police_cloak
	contains = list(/obj/item/clothing/neck/cloak/colonial/nri_police)

/datum/supply_pack/companies/nri_surplus/clothing/police_cap
	contains = list(/obj/item/clothing/head/hats/colonial/nri_police)

/datum/supply_pack/companies/nri_surplus/clothing/police_baseball_cap
	contains = list(/obj/item/clothing/head/soft/nri_police)

/datum/supply_pack/companies/nri_surplus/clothing/police_mask
	contains = list(/obj/item/clothing/mask/gas/nri_police)
	cost = PAYCHECK_CREW * 2

/datum/supply_pack/companies/nri_surplus/space
	contraband = TRUE

/datum/supply_pack/companies/nri_surplus/space/voskhod_suit
	contains = list(/obj/item/clothing/suit/space/voskhod)
	cost = PAYCHECK_COMMAND * 10

/datum/supply_pack/companies/nri_surplus/space/voskhod_helmet
	contains = list(/obj/item/clothing/head/helmet/space/voskhod)
	cost = PAYCHECK_COMMAND * 5

/datum/supply_pack/companies/nri_surplus/space/voskhod_refit_kit
	contains = list(/obj/item/crafting_conversion_kit/voskhod_refit)
	cost = PAYCHECK_COMMAND * 15

/datum/supply_pack/companies/nri_surplus/space/voskhod_autodoc_refill
	contains = list(/obj/item/reagent_containers/cup/glass/waterbottle/large/protozine)
	cost = PAYCHECK_COMMAND * 2

/datum/supply_pack/companies/nri_surplus/space/military_nri_autodoc_refill
	contains = list(/obj/item/reagent_containers/cup/glass/waterbottle/large/cryptobiolin)
	cost = PAYCHECK_COMMAND * 3
	hidden = TRUE

/datum/supply_pack/companies/nri_surplus/armor
	cost = PAYCHECK_COMMAND * 3

/datum/supply_pack/companies/nri_surplus/armor/cin_helmet
	contains = list(/obj/item/clothing/head/helmet/cin_surplus_helmet/random_color)

/datum/supply_pack/companies/nri_surplus/armor/cin_vest
	contains = list(/obj/item/clothing/suit/armor/vest/cin_surplus_vest)

/datum/supply_pack/companies/nri_surplus/armor/police_vest
	contains = list(/obj/item/clothing/head/helmet/nri_police)

/datum/supply_pack/companies/nri_surplus/armor/police_helmet
	contains = list(/obj/item/clothing/suit/armor/vest/nri_police)


/datum/supply_pack/companies/nri_surplus/armor/police_jacket
	contains = list(/obj/item/clothing/suit/armor/vest/nri_police_jacket)

/datum/supply_pack/companies/nri_surplus/armor/police_suit_jacket
	contains = list(/obj/item/clothing/suit/armor/vest/nri_police_jacket/suit)

// Pouches

/datum/supply_pack/companies/nri_surplus/pouches
	cost = PAYCHECK_CREW * 3

/datum/supply_pack/companies/nri_surplus/pouches/medipen
	contains = list(/obj/item/storage/pouch/cin_medipens)

/datum/supply_pack/companies/nri_surplus/pouches/medikit
	contains = list(/obj/item/storage/pouch/cin_medkit)

/datum/supply_pack/companies/nri_surplus/pouches/general
	contains = list(/obj/item/storage/pouch/cin_general)

/datum/supply_pack/companies/nri_surplus/misc
	cost = PAYCHECK_CREW

/datum/supply_pack/companies/nri_surplus/misc/stun_gun //Not a gun but it's only fair to place similar items close to each other
	contains = list(/obj/item/melee/baton/security/stun_gun/loaded)
	cost = PAYCHECK_COMMAND * 5 //Similarly live action roleplay'iy stun baton lite

/datum/supply_pack/companies/nri_surplus/misc/flares
	contains = list(/obj/item/storage/box/nri_flares)
	cost = PAYCHECK_LOWER

/datum/supply_pack/companies/nri_surplus/misc/binoculars
	contains = list(/obj/item/binoculars)
	cost = PAYCHECK_CREW

/datum/supply_pack/companies/nri_surplus/misc/screwdriver_pen
	contains = list(/obj/item/pen/screwdriver)
	cost = PAYCHECK_LOWER * 3

/datum/supply_pack/companies/nri_surplus/misc/trench_tool
	contains = list(/obj/item/trench_tool)
	cost = PAYCHECK_CREW

/datum/supply_pack/companies/nri_surplus/misc/nri_food
	contains = list(/obj/item/storage/box/colonial_rations)
	cost = PAYCHECK_COMMAND * 2

/datum/supply_pack/companies/nri_surplus/misc/food_replicator
	contains = list(/obj/item/circuitboard/machine/biogenerator/food_replicator)
	cost = CARGO_CRATE_VALUE * 9

/datum/supply_pack/companies/nri_surplus/misc/nri_flag
	contains = list(/obj/item/sign/flag/nri)
	cost = PAYCHECK_LOWER

/datum/supply_pack/companies/nri_surplus/misc/hc_flag
	contains = list(/obj/item/sign/flag/hc)
	cost = PAYCHECK_LOWER
	hidden = TRUE

/datum/supply_pack/companies/nri_surplus/sidearm
	cost = PAYCHECK_COMMAND * 12
	access = ACCESS_WEAPONS
	access_view = ACCESS_WEAPONS

/datum/supply_pack/companies/nri_surplus/sidearm/crank_taser
	contains = list(/obj/item/gun/energy/taser/crank)
	cost = PAYCHECK_COMMAND * 10

/datum/supply_pack/companies/nri_surplus/sidearm/cb //contraband start, must be below non contraband items to display correctly
	contraband = TRUE

/datum/supply_pack/companies/nri_surplus/sidearm/cb/shotgun_revolver
	contains = list(/obj/item/gun/ballistic/revolver/shotgun_revolver)

/datum/supply_pack/companies/nri_surplus/sidearm/cb/zashch
	contains = list(/obj/item/gun/ballistic/automatic/pistol/zashch)
	cost = PAYCHECK_COMMAND * 19

/datum/supply_pack/companies/nri_surplus/sidearm/cb/plasma_thrower
	contains = list(/obj/item/gun/ballistic/automatic/pistol/plasma_thrower)
	cost = PAYCHECK_COMMAND * 15

/datum/supply_pack/companies/nri_surplus/sidearm/cb/plasma_marksman
	contains = list(/obj/item/gun/ballistic/automatic/pistol/plasma_marksman)
	cost = PAYCHECK_COMMAND * 15

/datum/supply_pack/companies/nri_surplus/longarm
	cost = PAYCHECK_COMMAND * 16
	access = ACCESS_WEAPONS
	access_view = ACCESS_WEAPONS

/datum/supply_pack/companies/nri_surplus/longarm/lanca
	contains = list(/obj/item/gun/ballistic/rifle/sporterized/qmr)
	cost = PAYCHECK_COMMAND * 20

/*
/datum/supply_pack/companies/nri_surplus/longarm/sakhno_rifle
	contains = list(/obj/item/gun/ballistic/rifle/boltaction)
	cost = PAYCHECK_COMMAND * 20

/datum/supply_pack/companies/nri_surplus/longarm/lanca
	contains = list(/obj/item/gun/ballistic/automatic/lanca)
	cost = PAYCHECK_COMMAND * 24
	contraband = TRUE

/datum/supply_pack/companies/nri_surplus/longarm/miecz
	contains = list(/obj/item/gun/ballistic/automatic/miecz)
	cost = PAYCHECK_COMMAND * 16
	contraband = TRUE

/datum/supply_pack/companies/nri_surplus/longarm/napad
	contains = list(/obj/item/gun/ballistic/automatic/napad)
	cost = PAYCHECK_COMMAND * 19
	contraband = TRUE

/datum/supply_pack/companies/nri_surplus/longarm/pulse_rifle
	contains = list(/obj/item/gun/ballistic/automatic/pulse_rifle)
	cost = PAYCHECK_COMMAND * 25
	contraband = TRUE

/datum/supply_pack/companies/nri_surplus/longarm/pulse_sniper //for other time
	contains = list(/obj/item/gun/ballistic/rifle/pulse_sniper)
	cost = PAYCHECK_COMMAND * 22
	contraband = TRUE

/datum/supply_pack/companies/nri_surplus/longarm/anti_materiel_rifle
	contains = list(/obj/item/gun/ballistic/automatic/wylom)
	cost = PAYCHECK_COMMAND * 36
	contraband = TRUE
*/

/datum/supply_pack/companies/nri_surplus/firearm_ammo
	cost = PAYCHECK_CREW * 2

/datum/supply_pack/companies/nri_surplus/firearm_ammo/cb
	contraband = TRUE

/datum/supply_pack/companies/nri_surplus/firearm_ammo/cb/zashch
	contains = list(/obj/item/ammo_box/magazine/zashch)
	cost = PAYCHECK_COMMAND * 2

/datum/supply_pack/companies/nri_surplus/firearm_ammo/cb/miecz
	contains = list(/obj/item/ammo_box/magazine/miecz)
	cost = PAYCHECK_COMMAND * 3
	hidden = TRUE

/datum/supply_pack/companies/nri_surplus/firearm_ammo/cb/napad
	contains = list(/obj/item/ammo_box/magazine/napad)
	cost = PAYCHECK_COMMAND * 9
	hidden = TRUE

/datum/supply_pack/companies/nri_surplus/firearm_ammo/sakhno
	contains = list(/obj/item/ammo_box/speedloader/strilka310)
	cost = PAYCHECK_CREW * 6

/datum/supply_pack/companies/nri_surplus/firearm_ammo/lanca_qm
	contains = list(/obj/item/ammo_box/magazine/lanca/qmr)
	cost = PAYCHECK_CREW * 3

/datum/supply_pack/companies/nri_surplus/firearm_ammo/cb/lanca
	contains = list(/obj/item/ammo_box/magazine/lanca)
	cost = PAYCHECK_COMMAND * 6

/datum/supply_pack/companies/nri_surplus/firearm_ammo/cb/plasma_battery
	contains = list(/obj/item/ammo_box/magazine/recharge/plasma_battery)
	cost = PAYCHECK_CREW * 3

/datum/supply_pack/companies/nri_surplus/firearm_ammo/cb/zaibas
	contains = list(/obj/item/ammo_box/magazine/pulse)
	cost = PAYCHECK_COMMAND * 5
	hidden = TRUE

/datum/supply_pack/companies/nri_surplus/firearm_ammo/cb/amr_magazine
	contains = list(/obj/item/ammo_box/magazine/wylom)
	cost = PAYCHECK_COMMAND * 7
	hidden = TRUE
