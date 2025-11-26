/datum/supply_pack/companies/sol_defense
	group = SOL_DEFENSE_NAME_1984
	special = FALSE // required to be shown in cargo
	special_enabled = TRUE // required to be shown in cargo
	dangerous = FALSE // required to be shown in cargo

// Beautiful SolFed clothing

/datum/supply_pack/companies/sol_defense/clothing
	cost = PAYCHECK_CREW

/datum/supply_pack/companies/sol_defense/clothing/peacekeeper
	contains = list(/obj/item/clothing/under/sol_peacekeeper)

/datum/supply_pack/companies/sol_defense/clothing/emt
	contains = list(/obj/item/clothing/under/sol_emt)

/datum/supply_pack/companies/sol_defense/clothing/hecu_mask
	contains = list(/obj/item/clothing/mask/gas/hecu)
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/sol_defense/clothing/mil_gloves
	contains = list(/obj/item/clothing/gloves/military)

/datum/supply_pack/companies/sol_defense/clothing/combat_boots // armored boots
	name = "Combat Boots"
	contains = list(/obj/item/clothing/shoes/combat)
	cost = PAYCHECK_COMMAND * 4

/datum/supply_pack/companies/sol_defense/misc/hecu_food
	contains = list(/obj/item/storage/box/hecu_rations)
	cost = PAYCHECK_COMMAND * 2

/datum/supply_pack/companies/sol_defense/misc/sol_flag
	contains = list(/obj/item/sign/flag/terragov)
	cost = PAYCHECK_LOWER

/datum/supply_pack/companies/sol_defense/misc/old_flag
	contains = list(/obj/item/sign/flag/usa)
	cost = PAYCHECK_LOWER
	hidden = TRUE

/datum/supply_pack/companies/sol_defense/armor
	cost = PAYCHECK_CREW * 6

/datum/supply_pack/companies/sol_defense/armor/ballistic_helmet
	contains = list(/obj/item/clothing/head/helmet/sf_peacekeeper/debranded)

/datum/supply_pack/companies/sol_defense/armor/sf_ballistic_helmet
	contains = list(/obj/item/clothing/head/helmet/sf_peacekeeper)

/datum/supply_pack/companies/sol_defense/armor/soft_vest
	contains = list(/obj/item/clothing/suit/armor/sf_peacekeeper/debranded)

/datum/supply_pack/companies/sol_defense/armor/sf_soft_vest
	contains = list(/obj/item/clothing/suit/armor/sf_peacekeeper)

/datum/supply_pack/companies/sol_defense/armor/flak_jacket
	contains = list(/obj/item/clothing/suit/armor/vest/sol)

/datum/supply_pack/companies/sol_defense/case
	cost = PAYCHECK_COMMAND * 3

/datum/supply_pack/companies/sol_defense/case/trappiste
	contains = list(/obj/item/storage/toolbox/guncase/nova/pistol/trappiste_small_case)

/datum/supply_pack/companies/sol_defense/case/carwo
	contains = list(/obj/item/storage/toolbox/guncase/nova/carwo_large_case)
	cost = PAYCHECK_COMMAND * 5

/datum/supply_pack/companies/sol_defense/case/sfp
	contains = list(/obj/item/storage/toolbox/guncase/nova/solfed/pistol)
	cost = PAYCHECK_COMMAND * 4

/datum/supply_pack/companies/sol_defense/case/sfl
	contains = list(/obj/item/storage/toolbox/guncase/nova/solfed)
	cost = PAYCHECK_COMMAND * 6

/datum/supply_pack/companies/sol_defense/case/sfsp
	contains = list(/obj/item/storage/toolbox/guncase/nova/solfedspec/pistol)
	cost = PAYCHECK_COMMAND * 5

/datum/supply_pack/companies/sol_defense/case/sfsl
	contains = list(/obj/item/storage/toolbox/guncase/nova/solfedspec)
	cost = PAYCHECK_COMMAND * 7


/datum/supply_pack/companies/sol_defense/sidearm
	cost = PAYCHECK_COMMAND * 5
	access = ACCESS_WEAPONS
	access_view = ACCESS_WEAPONS

/datum/supply_pack/companies/sol_defense/sidearm/cb
	contraband = TRUE

/datum/supply_pack/companies/sol_defense/sidearm/eland
	contains = list(/obj/item/gun/ballistic/revolver/sol)
	cost = PAYCHECK_COMMAND * 8

/datum/supply_pack/companies/sol_defense/sidearm/wespe
	contains = list(/obj/item/gun/ballistic/automatic/pistol/sol)
	cost = PAYCHECK_COMMAND * 10

/datum/supply_pack/companies/sol_defense/sidearm/type207
	contains = list(/obj/item/gun/ballistic/automatic/pistol/type207)

/datum/supply_pack/companies/sol_defense/sidearm/cb/skild
	contains = list(/obj/item/gun/ballistic/automatic/pistol/trappiste)
	cost = PAYCHECK_COMMAND * 12

/datum/supply_pack/companies/sol_defense/sidearm/cb/takbok
	contains = list(/obj/item/gun/ballistic/revolver/takbok)
	cost = PAYCHECK_COMMAND * 12

/datum/supply_pack/companies/sol_defense/longarm
	cost = PAYCHECK_COMMAND * 8
	access = ACCESS_WEAPONS
	access_view = ACCESS_WEAPONS

/datum/supply_pack/companies/sol_defense/longarm/cb
	contraband = TRUE

/datum/supply_pack/companies/sol_defense/longarm/renoster
	contains = list(/obj/item/gun/ballistic/shotgun/riot/sol)
	cost = PAYCHECK_COMMAND * 12

/datum/supply_pack/companies/sol_defense/longarm/cb/sindano
	contains = list(/obj/item/gun/ballistic/automatic/sol_smg)
	cost = PAYCHECK_COMMAND * 11

/datum/supply_pack/companies/sol_defense/longarm/type213
	contains = list(/obj/item/gun/ballistic/automatic/type213)

/datum/supply_pack/companies/sol_defense/longarm/cb/jager
	contains = list(/obj/item/gun/ballistic/shotgun/katyusha/jager)
	cost = PAYCHECK_COMMAND * 22

/datum/supply_pack/companies/sol_defense/longarm/cb/kiboko
	contains = list(/obj/item/gun/ballistic/automatic/sol_grenade_launcher)
	cost = PAYCHECK_COMMAND * 50

/datum/supply_pack/companies/sol_defense/magazines
	cost = PAYCHECK_CREW * 2

/datum/supply_pack/companies/sol_defense/magazines/kineticballs
	contains = list(/obj/item/ammo_box/magazine/kineticballs/starts_empty)

/datum/supply_pack/companies/sol_defense/magazines/kineticballsbig
	contains = list(/obj/item/ammo_box/magazine/kineticballsbig/starts_empty)

/datum/supply_pack/companies/sol_defense/magazines/c35_mag
	contains = list(/obj/item/ammo_box/magazine/c35sol_pistol/starts_empty)
	cost = PAYCHECK_CREW * 3

/datum/supply_pack/companies/sol_defense/magazines/c35_extended
	contains = list(/obj/item/ammo_box/magazine/c35sol_pistol/stendo/starts_empty)
	cost = PAYCHECK_CREW * 4

/datum/supply_pack/companies/sol_defense/magazines/cb //contraband start, must be below non contraband items to display correctly
	contraband = TRUE

/datum/supply_pack/companies/sol_defense/magazines/cb/c585_mag
	contains = list(/obj/item/ammo_box/magazine/c585trappiste_pistol/spawns_empty)
	cost = PAYCHECK_CREW * 5

/datum/supply_pack/companies/sol_defense/magazines/cb/sol_rifle_short
	contains = list(/obj/item/ammo_box/magazine/c40sol_rifle/starts_empty)
	cost = PAYCHECK_CREW * 2

/datum/supply_pack/companies/sol_defense/magazines/cb/sol_rifle_standard
	contains = list(/obj/item/ammo_box/magazine/c40sol_rifle/standard/starts_empty)
	cost = PAYCHECK_CREW * 3

/datum/supply_pack/companies/sol_defense/magazines/cb/jager_shotgun_regular
	contains = list(/obj/item/ammo_box/magazine/jager/empty)
	cost = PAYCHECK_COMMAND * 3

/datum/supply_pack/companies/sol_defense/magazines/cb/jager_shotgun_Large
	contains = list(/obj/item/ammo_box/magazine/jager/large/empty)
	cost = PAYCHECK_COMMAND * 5

/datum/supply_pack/companies/sol_defense/magazines/sol_grenade_standard
	contains = list(/obj/item/ammo_box/magazine/c980_grenade/starts_empty)
	cost = PAYCHECK_CREW * 4

/datum/supply_pack/companies/sol_defense/magazines/sol_grenade_drum
	contains = list(/obj/item/ammo_box/magazine/c980_grenade/drum/starts_empty)
	cost = PAYCHECK_CREW * 6
