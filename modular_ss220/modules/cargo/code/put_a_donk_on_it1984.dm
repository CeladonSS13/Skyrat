/datum/supply_pack/companies/donk
	group = DONK_CO_NAME_1984
	special = FALSE // required to be shown in cargo
	special_enabled = TRUE // required to be shown in cargo
	dangerous = FALSE // required to be shown in cargo

// Donk Co foods, like donk pockets and ready donk

/datum/supply_pack/companies/donk/food
	cost = PAYCHECK_CREW

/datum/supply_pack/companies/donk/food/ready_donk
	contains = list(/obj/item/food/ready_donk)

/datum/supply_pack/companies/donk/food/ready_donkhiladas
	contains = list(/obj/item/food/ready_donk/donkhiladas)

/datum/supply_pack/companies/donk/food/ready_donk_n_cheese
	contains = list(/obj/item/food/ready_donk/mac_n_cheese)

/datum/supply_pack/companies/donk/food/pockets
	contains = list(/obj/item/storage/box/donkpockets)
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/donk/food/berry_pockets
	contains = list(/obj/item/storage/box/donkpockets/donkpocketberry)
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/donk/food/honk_pockets
	contains = list(/obj/item/storage/box/donkpockets/donkpockethonk)
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/donk/food/pizza_pockets
	contains = list(/obj/item/storage/box/donkpockets/donkpocketpizza)
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/donk/food/spicy_pockets
	contains = list(/obj/item/storage/box/donkpockets/donkpocketspicy)
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/donk/food/teriyaki_pockets
	contains = list(/obj/item/storage/box/donkpockets/donkpocketteriyaki)
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/donk/pet_food
	cost = PAYCHECK_CREW * 2

/datum/supply_pack/companies/donk/pet_food/void
	contains = list(/obj/item/pet_food/pet_space_treat)

// Random donk toy items, fake jumpsuits, balloons, so on

/datum/supply_pack/companies/donk/merch
	cost = PAYCHECK_CREW

/datum/supply_pack/companies/donk/merch/vendors
	contains = list(/obj/item/summon_beacon/vendors)
	cost = PAYCHECK_CREW * 12

/datum/supply_pack/companies/donk/merch/flag
	contains = list(/obj/item/sign/flag/syndicate)
	cost = PAYCHECK_LOWER
	hidden = TRUE

/datum/supply_pack/companies/donk/merch/donk_carpet
	contains = list(/obj/item/stack/tile/carpet/donk/thirty)

/datum/supply_pack/companies/donk/merch/tacticool_turtleneck
	contains = list(/obj/item/clothing/under/syndicate/tacticool)

/datum/supply_pack/companies/donk/merch/tacticool_turtleneck_skirt
	contains = list(/obj/item/clothing/under/syndicate/tacticool/skirt)

/datum/supply_pack/companies/donk/merch/fake_centcom_turtleneck
	contains = list(/obj/item/clothing/under/rank/centcom/officer/replica)

/datum/supply_pack/companies/donk/merch/fake_centcom_turtleneck_skirt
	contains = list(/obj/item/clothing/under/rank/centcom/officer_skirt/replica)

/datum/supply_pack/companies/donk/merch/snack_rig
	contains = list(/obj/item/storage/belt/military/snack)
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/donk/merch/fake_syndie_suit
	contains = list(/obj/item/storage/box/fakesyndiesuit)

/datum/supply_pack/companies/donk/merch/valid_bloon
	contains = list(/obj/item/toy/balloon/arrest)

/datum/supply_pack/companies/donk/merch/neuroware
	cost = PAYCHECK_COMMAND
	contraband = TRUE

/datum/supply_pack/companies/donk/merch/neuroware/blastoff
	contains = list(/obj/item/disk/neuroware/blastoff)

/datum/supply_pack/companies/donk/merch/neuroware/mindbreaker
	contains = list(/obj/item/disk/neuroware/mindbreaker)

/datum/supply_pack/companies/donk/merch/neuroware/mushroomhallucinogen
	contains = list(/obj/item/disk/neuroware/mushroomhallucinogen)

/datum/supply_pack/companies/donk/merch/neuroware/space_drugs
	contains = list(/obj/item/disk/neuroware/space_drugs)

/datum/supply_pack/companies/donk/merch/neuroware/thc
	contains = list(/obj/item/disk/neuroware/thc)

// Donksoft weapons

/datum/supply_pack/companies/donk/foamforce/foam_shotgun
	contains = list(/obj/item/gun/ballistic/shotgun/toy)
	cost = PAYCHECK_LOWER * 5

/datum/supply_pack/companies/donk/foamforce/foam_crossbow
	contains = list(/obj/item/gun/ballistic/shotgun/toy/crossbow)
	cost = PAYCHECK_COMMAND * 2

/datum/supply_pack/companies/donk/foamforce/foam_pistol
	contains = list(/obj/item/gun/ballistic/automatic/pistol/toy)
	cost = PAYCHECK_COMMAND * 4

/datum/supply_pack/companies/donk/foamforce/cb //contraband start, must be below non contraband items to display correctly
	contraband = TRUE

/datum/supply_pack/companies/donk/foamforce/cb/foam_smg
	contains = list(/obj/item/gun/ballistic/automatic/toy)
	cost = PAYCHECK_COMMAND * 5

/datum/supply_pack/companies/donk/foamforce/cb/foam_c20
	contains = list(/obj/item/gun/ballistic/automatic/c20r/toy/unrestricted)
	cost = PAYCHECK_COMMAND * 5

/datum/supply_pack/companies/donk/foamforce/cb/foam_turret
	contains = list(/obj/item/storage/toolbox/emergency/turret/mag_fed/toy/pre_filled)
	cost = PAYCHECK_COMMAND * 6

/datum/supply_pack/companies/donk/foamforce/cb/foam_lmg
	contains = list(/obj/item/gun/ballistic/automatic/l6_saw/toy/unrestricted)
	cost = PAYCHECK_COMMAND * 10
	hidden = TRUE

/datum/supply_pack/companies/donk/mod_modules/dart_collector_safe
	contains = list(/obj/item/mod/module/recycler/donk/safe)
	cost = PAYCHECK_COMMAND * 2

/datum/supply_pack/companies/donk/mod_modules/dart_collector
	contains = list(/obj/item/mod/module/recycler/donk)
	cost = PAYCHECK_COMMAND * 4

/datum/supply_pack/companies/donk/foamforce_ammo
	cost = PAYCHECK_CREW

/datum/supply_pack/companies/donk/foamforce_ammo/darts
	contains = list(/obj/item/ammo_box/foambox)
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/donk/foamforce_ammo/riot_darts
	contains = list(/obj/item/ammo_box/foambox/riot)
	cost = PAYCHECK_COMMAND * 2

/datum/supply_pack/companies/donk/foamforce_ammo/cb
	contraband = TRUE

/datum/supply_pack/companies/donk/foamforce_ammo/pistol_mag
	contains = list(/obj/item/ammo_box/magazine/toy/pistol)

/datum/supply_pack/companies/donk/foamforce_ammo/cb/smg_mag
	contains = list(/obj/item/ammo_box/magazine/toy/smg)
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/donk/foamforce_ammo/cb/smgm45_mag
	contains = list(/obj/item/ammo_box/magazine/toy/smgm45)
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/donk/foamforce_ammo/cb/m762_mag
	contains = list(/obj/item/ammo_box/magazine/toy/m762)
	cost = PAYCHECK_COMMAND * 2
	hidden = TRUE
