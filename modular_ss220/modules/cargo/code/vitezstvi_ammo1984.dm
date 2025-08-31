/datum/armament_entry/company_import/vitezstvi
	category = VITEZSTVI_AMMO_NAME
	company_bitflag = CARGO_COMPANY_VITEZSTVI_AMMO


// Ammo bench and the lethals disk

/datum/armament_entry/company_import/vitezstvi/ammo_bench
	subcategory = "Ammunition Manufacturing Equipment"

/datum/armament_entry/company_import/vitezstvi/ammo_bench/bench_itself
	item_type = /obj/item/flatpack/ammo_workbench
	cost = PAYCHECK_COMMAND * 5

/datum/armament_entry/company_import/vitezstvi/ammo_bench/bullet_drive
	item_type = /obj/item/flatpack/bullet_drive
	cost = PAYCHECK_COMMAND * 2

// basic disk
/datum/armament_entry/company_import/vitezstvi/ammo_bench/ammo_disk
	item_type = /obj/item/ammo_workbench_module/lethal
	cost = PAYCHECK_COMMAND * 3

// not a disk. adds print points
// /datum/armament_entry/company_import/vitezstvi/ammo_bench/reboot
// 	name = "reusable module reauthenticator"
// 	item_type = /obj/item/ammo_workbench_reboot
// 	cost = PAYCHECK_CREW

// disk but with the bits needed for EMP/fire bullets
/datum/armament_entry/company_import/vitezstvi/ammo_bench/ammo_disk/lethal_gimmick
	item_type = /obj/item/ammo_workbench_module/lethal_gimmick
	cost = PAYCHECK_COMMAND * 5

// disk but it's got HP/AP
/datum/armament_entry/company_import/vitezstvi/ammo_bench/ammo_disk/variant
	item_type = /obj/item/ammo_workbench_module/lethal_variant
	cost = PAYCHECK_COMMAND * 8

// Weapon accessories

/datum/armament_entry/company_import/vitezstvi/accessory
	subcategory = "Weapon Accessories"
	cost = PAYCHECK_COMMAND * 2

/datum/armament_entry/company_import/vitezstvi/accessory/suppressor
	item_type = /obj/item/suppressor/standard

/datum/armament_entry/company_import/vitezstvi/accessory/small_case
	item_type = /obj/item/storage/toolbox/guncase/nova/pistol

/datum/armament_entry/company_import/vitezstvi/accessory/large_case
	item_type = /obj/item/storage/toolbox/guncase/nova
	cost = PAYCHECK_COMMAND * 4

/datum/armament_entry/company_import/vitezstvi/accessory/bandolier
	item_type = /obj/item/storage/belt/bandolier

/datum/armament_entry/company_import/vitezstvi/accessory/holster
	item_type = /obj/item/storage/belt/holster
	cost = PAYCHECK_COMMAND * 4

/datum/armament_entry/company_import/vitezstvi/accessory/pouch
	item_type = /obj/item/storage/pouch/ammo
	cost = PAYCHECK_COMMAND * 3

// Boxes of non-shotgun ammo

/datum/armament_entry/company_import/vitezstvi/ammo_boxes
	subcategory = "Ammunition Boxes"
	cost = PAYCHECK_CREW

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/lethal
	cost = PAYCHECK_COMMAND
	restricted = TRUE

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/lethal/cal_9mm
	item_type = /obj/item/ammo_box/c9mm

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/lethal/hp_9mm
	item_type = /obj/item/ammo_box/c9mm/hp
	contraband = TRUE

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/rubber_9mm
	item_type = /obj/item/ammo_box/c9mm/rubber
	restricted = FALSE

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/lethal/cal_10mm
	item_type = /obj/item/ammo_box/c10mm

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/lethal/hp_10mm
	item_type = /obj/item/ammo_box/c10mm/hp
	contraband = TRUE

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/rubber_10mm
	item_type = /obj/item/ammo_box/c10mm/rubber
	restricted = FALSE

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/lethal/cal_310
	item_type = /obj/item/ammo_box/c310_cargo_box

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/rubber_310
	item_type = /obj/item/ammo_box/c310_cargo_box/rubber
	restricted = FALSE

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/lethal/ap_310
	item_type = /obj/item/ammo_box/c310_cargo_box/piercing
	contraband = TRUE

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/lethal/cesarzowa
	item_type = /obj/item/ammo_box/c27_54cesarzowa
	contraband = TRUE

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/rubber_cesarzowa
	item_type = /obj/item/ammo_box/c27_54cesarzowa/rubber
	contraband = TRUE

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/lethal/sol35
	item_type = /obj/item/ammo_box/c35sol

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/sol35_disabler
	item_type = /obj/item/ammo_box/c35sol/incapacitator
	restricted = FALSE

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/lethal/sol35_ripper
	item_type = /obj/item/ammo_box/c35sol/ripper
	contraband = TRUE

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/lethal/sol40
	item_type = /obj/item/ammo_box/c40sol

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/sol40_disabler
	item_type = /obj/item/ammo_box/c40sol/fragmentation
	restricted = FALSE

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/lethal/sol40_flame
	item_type = /obj/item/ammo_box/c40sol/incendiary
	contraband = TRUE

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/lethal/sol40_pierce
	item_type = /obj/item/ammo_box/c40sol/pierce
	contraband = TRUE

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/lethal/trappiste585
	item_type = /obj/item/ammo_box/c585trappiste

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/trappiste585_disabler
	item_type = /obj/item/ammo_box/c585trappiste/incapacitator
	restricted = FALSE

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/lethal/trappiste585_incendiary
	item_type = /obj/item/ammo_box/c585trappiste/incendiary
	contraband = TRUE

/datum/armament_entry/company_import/vitezstvi/ammo_boxes/kineticballs
	item_type = /obj/item/ammo_box/advanced/kineticballs
	restricted = FALSE

// Revolver speedloaders

/datum/armament_entry/company_import/vitezstvi/speedloader
	subcategory = "Speedloaders"
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/vitezstvi/speedloader/detective_lethal
	item_type = /obj/item/ammo_box/c38

/datum/armament_entry/company_import/vitezstvi/speedloader/detective_dumdum
	item_type = /obj/item/ammo_box/c38/dumdum

/datum/armament_entry/company_import/vitezstvi/speedloader/detective_bouncy
	item_type = /obj/item/ammo_box/c38/match

// Shotgun boxes

/datum/armament_entry/company_import/vitezstvi/shot_shells
	subcategory = "Shotgun Shells"
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/vitezstvi/shot_shells/lethal
	cost = PAYCHECK_COMMAND * 2
	contraband = TRUE

/datum/armament_entry/company_import/vitezstvi/shot_shells/lethal/slugs
	item_type = /obj/item/ammo_box/advanced/s12gauge

/datum/armament_entry/company_import/vitezstvi/shot_shells/lethal/buckshot
	item_type = /obj/item/ammo_box/advanced/s12gauge/buckshot

/datum/armament_entry/company_import/vitezstvi/shot_shells/beanbag_slugs
	item_type = /obj/item/ammo_box/advanced/s12gauge/bean

/datum/armament_entry/company_import/vitezstvi/shot_shells/rubbershot
	item_type = /obj/item/ammo_box/advanced/s12gauge/rubber

/datum/armament_entry/company_import/vitezstvi/shot_shells/lethal/magnum_buckshot
	item_type = /obj/item/ammo_box/advanced/s12gauge/magnum

/datum/armament_entry/company_import/vitezstvi/shot_shells/lethal/express_buckshot
	item_type = /obj/item/ammo_box/advanced/s12gauge/express

/datum/armament_entry/company_import/vitezstvi/shot_shells/lethal/flechettes
	item_type = /obj/item/ammo_box/advanced/s12gauge/flechette

/datum/armament_entry/company_import/vitezstvi/shot_shells/hunter_slug
	item_type = /obj/item/ammo_box/advanced/s12gauge/hunter

/datum/armament_entry/company_import/vitezstvi/shot_shells/hornet_nest
	item_type = /obj/item/ammo_box/advanced/s12gauge/beehive

/datum/armament_entry/company_import/vitezstvi/shot_shells/lighting
	item_type = /obj/item/ammo_box/advanced/s12gauge/antitide

/datum/armament_entry/company_import/vitezstvi/shot_shells/confetti
	item_type = /obj/item/ammo_box/advanced/s12gauge/honkshot

// Boxes of kiboko launcher ammo

/datum/armament_entry/company_import/vitezstvi/grenade_shells
	subcategory = "Grenade Shells"
	cost = PAYCHECK_COMMAND

/datum/armament_entry/company_import/vitezstvi/grenade_shells/practice
	item_type = /obj/item/ammo_box/c980grenade

/datum/armament_entry/company_import/vitezstvi/grenade_shells/smoke
	item_type = /obj/item/ammo_box/c980grenade/smoke

/datum/armament_entry/company_import/vitezstvi/grenade_shells/riot
	item_type = /obj/item/ammo_box/c980grenade/riot

/datum/armament_entry/company_import/vitezstvi/grenade_shells/shrapnel
	item_type = /obj/item/ammo_box/c980grenade/shrapnel
	cost = PAYCHECK_COMMAND * 2
	restricted = TRUE
	contraband = TRUE

/datum/armament_entry/company_import/vitezstvi/grenade_shells/phosphor
	item_type = /obj/item/ammo_box/c980grenade/shrapnel/phosphor
	cost = PAYCHECK_COMMAND * 3
	restricted = TRUE
	contraband = TRUE
