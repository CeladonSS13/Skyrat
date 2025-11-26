/datum/supply_pack/companies/vitezstvi
	group = VITEZSTVI_AMMO_NAME_1984
	special = FALSE // required to be shown in cargo
	special_enabled = TRUE // required to be shown in cargo
	dangerous = FALSE // required to be shown in cargo


// Ammo bench and the lethals disk

/datum/supply_pack/companies/vitezstvi/ammo_bench/bench_itself
	contains = list(/obj/item/flatpack/ammo_workbench)
	cost = PAYCHECK_COMMAND * 5

/datum/supply_pack/companies/vitezstvi/ammo_bench/bullet_drive
	contains = list(/obj/item/flatpack/bullet_drive)
	cost = PAYCHECK_COMMAND * 2

// basic disk
/datum/supply_pack/companies/vitezstvi/ammo_bench/ammo_disk
	contains = list(/obj/item/ammo_workbench_module/lethal)
	cost = PAYCHECK_COMMAND * 3

// disk but with the bits needed for EMP/fire bullets
/datum/supply_pack/companies/vitezstvi/ammo_bench/ammo_disk/lethal_gimmick
	contains = list(/obj/item/ammo_workbench_module/lethal_gimmick)
	cost = PAYCHECK_COMMAND * 5

// disk but it's got HP/AP
/datum/supply_pack/companies/vitezstvi/ammo_bench/ammo_disk/variant
	contains = list(/obj/item/ammo_workbench_module/lethal_variant)
	cost = PAYCHECK_COMMAND * 8

// Weapon accessories

/datum/supply_pack/companies/vitezstvi/accessory
	cost = PAYCHECK_COMMAND * 2

/datum/supply_pack/companies/vitezstvi/accessory/suppressor
	contains = list(/obj/item/suppressor/standard)

/datum/supply_pack/companies/vitezstvi/accessory/small_case
	contains = list(/obj/item/storage/toolbox/guncase/nova/pistol)

/datum/supply_pack/companies/vitezstvi/accessory/large_case
	contains = list(/obj/item/storage/toolbox/guncase/nova)
	cost = PAYCHECK_COMMAND * 4

/datum/supply_pack/companies/vitezstvi/accessory/ntp
	contains = list(/obj/item/storage/toolbox/guncase/nova/ntcase/pistol)
	cost = PAYCHECK_COMMAND * 4

/datum/supply_pack/companies/vitezstvi/accessory/ntl
	contains = list(/obj/item/storage/toolbox/guncase/nova/ntcase)
	cost = PAYCHECK_COMMAND * 6

/datum/supply_pack/companies/vitezstvi/accessory/ntsp
	contains = list(/obj/item/storage/toolbox/guncase/nova/ntspecial/pistol)
	cost = PAYCHECK_COMMAND * 5

/datum/supply_pack/companies/vitezstvi/accessory/ntpl
	contains = list(/obj/item/storage/toolbox/guncase/nova/ntspecial)
	cost = PAYCHECK_COMMAND * 7

/datum/supply_pack/companies/vitezstvi/accessory/bandolier
	contains = list(/obj/item/storage/belt/bandolier)

/datum/supply_pack/companies/vitezstvi/accessory/holster
	contains = list(/obj/item/storage/belt/holster)
	cost = PAYCHECK_COMMAND * 4

/datum/supply_pack/companies/vitezstvi/accessory/pouch
	contains = list(/obj/item/storage/pouch/ammo)
	cost = PAYCHECK_COMMAND * 3

// Boxes of non-shotgun ammo

/datum/supply_pack/companies/vitezstvi/ammo_boxes
	cost = PAYCHECK_CREW

/datum/supply_pack/companies/vitezstvi/ammo_boxes/lethal
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/vitezstvi/ammo_boxes/lethal/cal_9mm
	contains = list(/obj/item/ammo_box/c9mm)

/datum/supply_pack/companies/vitezstvi/ammo_boxes/lethal/hp_9mm
	contains = list(/obj/item/ammo_box/c9mm/hp)
	contraband = TRUE

/datum/supply_pack/companies/vitezstvi/ammo_boxes/rubber_9mm
	contains = list(/obj/item/ammo_box/c9mm/rubber)

/datum/supply_pack/companies/vitezstvi/ammo_boxes/rubber_10mm
	contains = list(/obj/item/ammo_box/c10mm/rubber)

/datum/supply_pack/companies/vitezstvi/ammo_boxes/lethal/cal_10mm
	contains = list(/obj/item/ammo_box/c10mm)

/datum/supply_pack/companies/vitezstvi/ammo_boxes/lethal/hp_10mm
	contains = list(/obj/item/ammo_box/c10mm/hp)
	contraband = TRUE

/datum/supply_pack/companies/vitezstvi/ammo_boxes/lethal/cal_310
	contains = list(/obj/item/ammo_box/c310_cargo_box)

/datum/supply_pack/companies/vitezstvi/ammo_boxes/rubber_310
	contains = list(/obj/item/ammo_box/c310_cargo_box/rubber)

/datum/supply_pack/companies/vitezstvi/ammo_boxes/lethal/ap_310
	contains = list(/obj/item/ammo_box/c310_cargo_box/piercing)
	contraband = TRUE

/datum/supply_pack/companies/vitezstvi/ammo_boxes/lethal/cesarzowa
	contains = list(/obj/item/ammo_box/c27_54cesarzowa)
	contraband = TRUE

/datum/supply_pack/companies/vitezstvi/ammo_boxes/rubber_cesarzowa
	contains = list(/obj/item/ammo_box/c27_54cesarzowa/rubber)
	contraband = TRUE

/datum/supply_pack/companies/vitezstvi/ammo_boxes/lethal/sol35
	contains = list(/obj/item/ammo_box/c35sol)

/datum/supply_pack/companies/vitezstvi/ammo_boxes/sol35_disabler
	contains = list(/obj/item/ammo_box/c35sol/incapacitator)

/datum/supply_pack/companies/vitezstvi/ammo_boxes/lethal/sol35_ripper
	contains = list(/obj/item/ammo_box/c35sol/ripper)
	contraband = TRUE

/datum/supply_pack/companies/vitezstvi/ammo_boxes/lethal/sol40
	contains = list(/obj/item/ammo_box/c40sol)

/datum/supply_pack/companies/vitezstvi/ammo_boxes/sol40_disabler
	contains = list(/obj/item/ammo_box/c40sol/fragmentation)

/datum/supply_pack/companies/vitezstvi/ammo_boxes/lethal/sol40_flame
	contains = list(/obj/item/ammo_box/c40sol/incendiary)
	contraband = TRUE

/datum/supply_pack/companies/vitezstvi/ammo_boxes/lethal/sol40_pierce
	contains = list(/obj/item/ammo_box/c40sol/pierce)
	contraband = TRUE

/datum/supply_pack/companies/vitezstvi/ammo_boxes/lethal/trappiste585
	contains = list(/obj/item/ammo_box/c585trappiste)

/datum/supply_pack/companies/vitezstvi/ammo_boxes/trappiste585_disabler
	contains = list(/obj/item/ammo_box/c585trappiste/incapacitator)

/datum/supply_pack/companies/vitezstvi/ammo_boxes/lethal/trappiste585_incendiary
	contains = list(/obj/item/ammo_box/c585trappiste/incendiary)
	contraband = TRUE

/datum/supply_pack/companies/vitezstvi/ammo_boxes/kineticballs
	contains = list(/obj/item/ammo_box/advanced/kineticballs)

/datum/supply_pack/companies/vitezstvi/ammo_boxes/lethal/pulse_gun_ammo
	contains = list(/obj/item/ammo_box/pulse_cargo_box)
	cost = PAYCHECK_COMMAND * 5
	hidden = TRUE

// Revolver speedloaders

/datum/supply_pack/companies/vitezstvi/speedloader
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/vitezstvi/speedloader/detective_lethal
	contains = list(/obj/item/ammo_box/speedloader/c38)

/datum/supply_pack/companies/vitezstvi/speedloader/detective_dumdum
	contains = list(/obj/item/ammo_box/speedloader/c38/dumdum)

/datum/supply_pack/companies/vitezstvi/speedloader/detective_bouncy
	contains = list(/obj/item/ammo_box/speedloader/c38/match)

// Shotgun boxes

/datum/supply_pack/companies/vitezstvi/shot_shells
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/vitezstvi/shot_shells/lethal
	cost = PAYCHECK_COMMAND * 2
	contraband = TRUE

/datum/supply_pack/companies/vitezstvi/shot_shells/lethal/slugs
	contains = list(/obj/item/ammo_box/advanced/s12gauge)

/datum/supply_pack/companies/vitezstvi/shot_shells/lethal/buckshot
	contains = list(/obj/item/ammo_box/advanced/s12gauge/buckshot)

/datum/supply_pack/companies/vitezstvi/shot_shells/beanbag_slugs
	contains = list(/obj/item/ammo_box/advanced/s12gauge/bean)

/datum/supply_pack/companies/vitezstvi/shot_shells/rubbershot
	contains = list(/obj/item/ammo_box/advanced/s12gauge/rubber)

/datum/supply_pack/companies/vitezstvi/shot_shells/lethal/magnum_buckshot
	contains = list(/obj/item/ammo_box/advanced/s12gauge/magnum)

/datum/supply_pack/companies/vitezstvi/shot_shells/lethal/express_buckshot
	contains = list(/obj/item/ammo_box/advanced/s12gauge/express)

/datum/supply_pack/companies/vitezstvi/shot_shells/lethal/flechettes
	contains = list(/obj/item/ammo_box/advanced/s12gauge/flechette)

/datum/supply_pack/companies/vitezstvi/shot_shells/hunter_slug
	contains = list(/obj/item/ammo_box/advanced/s12gauge/hunter)

/datum/supply_pack/companies/vitezstvi/shot_shells/hornet_nest
	contains = list(/obj/item/ammo_box/advanced/s12gauge/beehive)

/datum/supply_pack/companies/vitezstvi/shot_shells/lighting
	contains = list(/obj/item/ammo_box/advanced/s12gauge/antitide)

/datum/supply_pack/companies/vitezstvi/shot_shells/confetti
	contains = list(/obj/item/ammo_box/advanced/s12gauge/honkshot)

// Boxes of kiboko launcher ammo

/datum/supply_pack/companies/vitezstvi/grenade_shells
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/vitezstvi/grenade_shells/practice
	contains = list(/obj/item/ammo_box/c980grenade)

/datum/supply_pack/companies/vitezstvi/grenade_shells/smoke
	contains = list(/obj/item/ammo_box/c980grenade/smoke)

/datum/supply_pack/companies/vitezstvi/grenade_shells/riot
	contains = list(/obj/item/ammo_box/c980grenade/riot)

/datum/supply_pack/companies/vitezstvi/grenade_shells/shrapnel
	contains = list(/obj/item/ammo_box/c980grenade/shrapnel)
	cost = PAYCHECK_COMMAND * 2
	contraband = TRUE

/datum/supply_pack/companies/vitezstvi/grenade_shells/phosphor
	contains = list(/obj/item/ammo_box/c980grenade/shrapnel/phosphor)
	cost = PAYCHECK_COMMAND * 3
	contraband = TRUE
