/datum/supply_pack/companies/nanotrasen_and_bolt
	group = BOLT_NANOTRASEN_DEFENSE_NAME_1984
	special = FALSE // required to be shown in cargo
	special_enabled = TRUE // required to be shown in cargo
	dangerous = FALSE // required to be shown in cargo

/datum/supply_pack/companies/nanotrasen_and_bolt/misc/nt_flag
	contains = list(/obj/item/sign/flag/nanotrasen)
	cost = PAYCHECK_LOWER

/datum/supply_pack/companies/nanotrasen_and_bolt/helmet
	cost = PAYCHECK_CREW * 5

/datum/supply_pack/companies/nanotrasen_and_bolt/helmet/sec
	contains = list(/obj/item/clothing/head/helmet/sec)

/datum/supply_pack/companies/nanotrasen_and_bolt/helmet/bullet
	contains = list(/obj/item/clothing/head/helmet/alt)
	cost = PAYCHECK_CREW * 7

/datum/supply_pack/companies/nanotrasen_and_bolt/helmet/riot
	contains = list(/obj/item/clothing/head/helmet/toggleable/riot)
	cost = PAYCHECK_CREW * 7

/datum/supply_pack/companies/nanotrasen_and_bolt/helmet/swat
	contains = list(/obj/item/clothing/head/helmet/swat/nanotrasen)
	cost = PAYCHECK_CREW * 9

/datum/supply_pack/companies/nanotrasen_and_bolt/helmet/alarm
	contains = list(/obj/item/clothing/head/helmet/toggleable/justice)
	cost = PAYCHECK_CREW * 6
	contraband = TRUE

/datum/supply_pack/companies/nanotrasen_and_bolt/armor
	cost = PAYCHECK_CREW * 6

/datum/supply_pack/companies/nanotrasen_and_bolt/armor/slim
	name = "type I vest - slim"
	contains = list(/obj/item/clothing/suit/armor/vest)

/datum/supply_pack/companies/nanotrasen_and_bolt/armor/normal
	name = "type I vest - normal"
	contains = list(/obj/item/clothing/suit/armor/vest/alt)

/datum/supply_pack/companies/nanotrasen_and_bolt/armor/bullet
	name = "type III vest - bulletproof"
	contains = list(/obj/item/clothing/suit/armor/bulletproof)
	cost = PAYCHECK_CREW * 7

/datum/supply_pack/companies/nanotrasen_and_bolt/armor/riot
	contains = list(/obj/item/clothing/suit/armor/riot)
	cost = PAYCHECK_CREW * 9

/datum/supply_pack/companies/nanotrasen_and_bolt/armor/swat
	contains = list(/obj/item/clothing/suit/armor/swat)
	cost = PAYCHECK_CREW * 12

/datum/supply_pack/companies/nanotrasen_and_bolt/nonlethal/pepperball
	contains = list(/obj/item/gun/ballistic/automatic/pistol/pepperball)
	cost = PAYCHECK_CREW * 5

/datum/supply_pack/companies/nanotrasen_and_bolt/lethal_sidearm
	access = ACCESS_WEAPONS
	access_view = ACCESS_WEAPONS

/datum/supply_pack/companies/nanotrasen_and_bolt/lethal_sidearm/detective_revolver
	contains = list(/obj/item/gun/ballistic/revolver/c38/detective)
	cost = PAYCHECK_COMMAND * 10

/datum/supply_pack/companies/nanotrasen_and_bolt/lethal_sidearm/detective_revolver
	contains = list(/obj/item/gun/ballistic/automatic/pistol/firefly)
	cost = PAYCHECK_COMMAND * 8

/datum/supply_pack/companies/nanotrasen_and_bolt/lethal_sidearm/m1911
	contains = list(/obj/item/gun/ballistic/automatic/pistol/m1911)
	cost = PAYCHECK_COMMAND * 15
	hidden = TRUE

/datum/supply_pack/companies/nanotrasen_and_bolt/longarm
	access = ACCESS_WEAPONS
	access_view = ACCESS_WEAPONS

/datum/supply_pack/companies/nanotrasen_and_bolt/longarm/riot_shotgun
	contains = list(/obj/item/gun/ballistic/shotgun/riot)
	cost = PAYCHECK_COMMAND * 8

/datum/supply_pack/companies/nanotrasen_and_bolt/longarm/m23
	contains = list(/obj/item/gun/ballistic/shotgun/m23)
	cost = PAYCHECK_COMMAND * 16

/datum/supply_pack/companies/nanotrasen_and_bolt/longarm/wt550
	contains = list(/obj/item/gun/ballistic/automatic/wt550)
	cost = PAYCHECK_COMMAND * 9

/datum/supply_pack/companies/nanotrasen_and_bolt/longarm/br38
	contains = list(/obj/item/gun/ballistic/automatic/battle_rifle)
	cost = PAYCHECK_COMMAND * 40

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines
	cost = PAYCHECK_CREW * 3

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/pepper
	contains = list(/obj/item/ammo_box/magazine/pepperball)
	cost = PAYCHECK_CREW * 2

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/em1911_l
	contains = list(/obj/item/ammo_box/magazine/recharge/m1911)
	cost = PAYCHECK_CREW * 4

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/em1911_d
	contains = list(/obj/item/ammo_box/magazine/recharge/m1911/disabler)
	cost = PAYCHECK_CREW * 4

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/m1911
	contains = list(/obj/item/ammo_box/magazine/m45)
	contraband = TRUE

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/firefly
	contains = list(/obj/item/ammo_box/magazine/multi_sprite/firefly)
	cost = PAYCHECK_CREW * 2

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/firefly_ihdf
	contains = list(/obj/item/ammo_box/magazine/multi_sprite/firefly/ihdf)

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/firefly_r
	contains = list(/obj/item/ammo_box/magazine/multi_sprite/firefly/rubber)

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/firefly_l
	contains = list(/obj/item/ammo_box/magazine/multi_sprite/firefly/lethal)

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/firefly_hp
	contains = list(/obj/item/ammo_box/magazine/multi_sprite/firefly/hp)

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/wt550r
	contains = list(/obj/item/ammo_box/magazine/wt550m9/rub)
	cost = PAYCHECK_CREW * 2

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/wt550l
	contains = list(/obj/item/ammo_box/magazine/wt550m9)

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/cb
	contraband = TRUE

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/cb/wt550p
	contains = list(/obj/item/ammo_box/magazine/wt550m9/wtap)
	cost = PAYCHECK_CREW * 4

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/cb/wt550i
	contains = list(/obj/item/ammo_box/magazine/wt550m9/wtic)
	cost = PAYCHECK_CREW * 6
	hidden = TRUE

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/cmg_empty
	contains = list(/obj/item/ammo_box/magazine/multi_sprite/cmg/empty)
	cost = PAYCHECK_CREW * 2

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/cmg_ihdf
	contains = list(/obj/item/ammo_box/magazine/multi_sprite/cmg/ihdf)

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/cmg_ihdf
	contains = list(/obj/item/ammo_box/magazine/multi_sprite/cmg/rubber)

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/cmg_cb
	cost = PAYCHECK_CREW * 5
	contraband = TRUE

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/cmg_cb/hp
	contains = list(/obj/item/ammo_box/magazine/multi_sprite/cmg/hp)

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/cmg_cb/ap
	contains = list(/obj/item/ammo_box/magazine/multi_sprite/cmg/ap)

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/cmg_cb/fire
	contains = list(/obj/item/ammo_box/magazine/multi_sprite/cmg/fire)
	hidden = TRUE

/datum/supply_pack/companies/nanotrasen_and_bolt/magazines/br38
	contains = list(/obj/item/ammo_box/magazine/m38/empty)
	cost = PAYCHECK_CREW * 6
