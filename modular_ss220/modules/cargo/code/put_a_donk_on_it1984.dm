/datum/armament_entry/company_import/donk
	category = DONK_CO_NAME
	company_bitflag = CARGO_COMPANY_DONK

// Donk Co foods, like donk pockets and ready donk

/datum/armament_entry/company_import/donk/food
	subcategory = "Microwave Foods"
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/donk/food/ready_donk
	item_type = /obj/item/food/ready_donk

/datum/armament_entry/company_import/donk/food/ready_donkhiladas
	item_type = /obj/item/food/ready_donk/donkhiladas

/datum/armament_entry/company_import/donk/food/ready_donk_n_cheese
	item_type = /obj/item/food/ready_donk/mac_n_cheese

/datum/armament_entry/company_import/donk/food/pockets
	item_type = /obj/item/storage/box/donkpockets
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/donk/food/berry_pockets
	item_type = /obj/item/storage/box/donkpockets/donkpocketberry
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/donk/food/honk_pockets
	item_type = /obj/item/storage/box/donkpockets/donkpockethonk
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/donk/food/pizza_pockets
	item_type = /obj/item/storage/box/donkpockets/donkpocketpizza
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/donk/food/spicy_pockets
	item_type = /obj/item/storage/box/donkpockets/donkpocketspicy
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/donk/food/teriyaki_pockets
	item_type = /obj/item/storage/box/donkpockets/donkpocketteriyaki
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/donk/pet_food
	subcategory = "Pet Food"
	cost = PAYCHECK_CREW * 2

/datum/armament_entry/company_import/donk/pet_food/void
	item_type = /obj/item/pet_food/pet_space_treat

// Random donk toy items, fake jumpsuits, balloons, so on

/datum/armament_entry/company_import/donk/merch
	subcategory = "Donk Co. Merchandise"
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/donk/merch/vendors
	item_type = /obj/item/summon_beacon/vendors
	cost = PAYCHECK_CREW * 12

/datum/armament_entry/company_import/donk/merch/donk_carpet
	item_type = /obj/item/stack/tile/carpet/donk/thirty

/datum/armament_entry/company_import/donk/merch/tacticool_turtleneck
	item_type = /obj/item/clothing/under/syndicate/tacticool

/datum/armament_entry/company_import/donk/merch/tacticool_turtleneck_skirt
	item_type = /obj/item/clothing/under/syndicate/tacticool/skirt

/datum/armament_entry/company_import/donk/merch/fake_centcom_turtleneck
	item_type = /obj/item/clothing/under/rank/centcom/officer/replica

/datum/armament_entry/company_import/donk/merch/fake_centcom_turtleneck_skirt
	item_type = /obj/item/clothing/under/rank/centcom/officer_skirt/replica

/datum/armament_entry/company_import/donk/merch/snack_rig
	item_type = /obj/item/storage/belt/military/snack
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/donk/merch/fake_syndie_suit
	item_type = /obj/item/storage/box/fakesyndiesuit

/datum/armament_entry/company_import/donk/merch/valid_bloon
	item_type = /obj/item/toy/balloon/arrest

// Donksoft weapons

/datum/armament_entry/company_import/donk/foamforce
	subcategory = "Foam Force (TM) Blasters"

/datum/armament_entry/company_import/donk/foamforce/foam_shotgun
	item_type = /obj/item/gun/ballistic/shotgun/toy
	cost = PAYCHECK_LOWER * 5

/datum/armament_entry/company_import/donk/foamforce/foam_crossbow
	item_type = /obj/item/gun/ballistic/shotgun/toy/crossbow
	cost = PAYCHECK_COMMAND * 2

/datum/armament_entry/company_import/donk/foamforce/foam_pistol
	item_type = /obj/item/gun/ballistic/automatic/pistol/toy
	cost = PAYCHECK_COMMAND * 4

/datum/armament_entry/company_import/donk/foamforce/foam_smg
	item_type = /obj/item/gun/ballistic/automatic/toy
	cost = PAYCHECK_COMMAND * 5
	contraband = TRUE

/datum/armament_entry/company_import/donk/foamforce/foam_c20
	item_type = /obj/item/gun/ballistic/automatic/c20r/toy/unrestricted
	cost = PAYCHECK_COMMAND * 5
	contraband = TRUE

/datum/armament_entry/company_import/donk/foamforce/foam_turret
	item_type = /obj/item/storage/toolbox/emergency/turret/mag_fed/toy/pre_filled
	cost = PAYCHECK_COMMAND * 6
	contraband = TRUE

/datum/armament_entry/company_import/donk/foamforce/foam_lmg
	item_type = /obj/item/gun/ballistic/automatic/l6_saw/toy/unrestricted
	contraband = TRUE
	restricted = TRUE
	cost = PAYCHECK_COMMAND * 10

/datum/armament_entry/company_import/donk/mod_modules
	subcategory = "Donk Co. MOD modules"

/datum/armament_entry/company_import/donk/mod_modules/dart_collector_safe
	item_type = /obj/item/mod/module/recycler/donk/safe
	cost = PAYCHECK_COMMAND * 2

/datum/armament_entry/company_import/donk/mod_modules/dart_collector
	item_type = /obj/item/mod/module/recycler/donk
	contraband = TRUE
	restricted = TRUE
	cost = PAYCHECK_COMMAND * 4

/datum/armament_entry/company_import/donk/foamforce_ammo
	subcategory = "Foam Force (TM) Dart Accessories"
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/donk/foamforce_ammo/darts
	item_type = /obj/item/ammo_box/foambox
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/donk/foamforce_ammo/riot_darts
	item_type = /obj/item/ammo_box/foambox/riot
	contraband = TRUE
	restricted = TRUE
	cost = PAYCHECK_COMMAND * 2

/datum/armament_entry/company_import/donk/foamforce_ammo/pistol_mag
	item_type = /obj/item/ammo_box/magazine/toy/pistol

/datum/armament_entry/company_import/donk/foamforce_ammo/smg_mag
	item_type = /obj/item/ammo_box/magazine/toy/smg
	cost = PAYCHECK_COMMAND
	contraband = TRUE

/datum/armament_entry/company_import/donk/foamforce_ammo/smgm45_mag
	item_type = /obj/item/ammo_box/magazine/toy/smgm45
	cost = PAYCHECK_COMMAND
	contraband = TRUE

/datum/armament_entry/company_import/donk/foamforce_ammo/m762_mag
	item_type = /obj/item/ammo_box/magazine/toy/m762
	cost = PAYCHECK_COMMAND * 2
	contraband = TRUE
