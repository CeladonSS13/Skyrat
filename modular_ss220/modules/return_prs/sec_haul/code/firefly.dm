/*
*	FIREFLY
*/
/obj/item/gun/ballistic/automatic/pistol/firefly
	name = "\improper P-92 pistol"
	desc = "A simple sidearm made by Armadyne's Medical Directive, with a heavy front for weak wrists. Due to the lightweight structure, bullets fired from this pistol have less stopping power. A small warning label on the back says it's not fit for surgical work, and chambered for 9x25mm."
	icon = 'modular_ss220/modules/return_prs/sec_haul/icons/guns.dmi'
	righthand_file = 'modular_ss220/modules/return_prs/sec_haul/icons/inhands/righthand.dmi'
	lefthand_file = 'modular_ss220/modules/return_prs/sec_haul/icons/inhands/lefthand.dmi'
	icon_state = "firefly"
	inhand_icon_state = "firefly"
	fire_delay = 1.95
	w_class = WEIGHT_CLASS_NORMAL
	accepted_magazine_type = /obj/item/ammo_box/magazine/multi_sprite/firefly
	can_suppress = FALSE
	projectile_damage_multiplier = 0.5

/obj/item/gun/ballistic/automatic/pistol/firefly/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_ARMADYNE)

/obj/item/gun/ballistic/automatic/pistol/firefly/add_seclight_point()
	AddComponent(/datum/component/seclite_attachable, \
		light_overlay_icon = 'icons/obj/weapons/guns/flashlights.dmi', \
		light_overlay = "flight")

/obj/item/ammo_box/magazine/multi_sprite/firefly
	name = "\improper P-92 magazine"
	desc = "A ten-round magazine for the P-92 pistol, chambered in 9x25mm."
	icon = 'modular_ss220/modules/return_prs/sec_haul/icons/mags.dmi'
	icon_state = "pdh"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = CALIBER_9MM
	max_ammo = 10
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/obj/item/ammo_box/magazine/multi_sprite/firefly/lethal
	icon_state = "pdh_lethal"

/obj/item/ammo_box/magazine/multi_sprite/firefly/hp
	icon_state = "pdh_hp"
	ammo_type = /obj/item/ammo_casing/c9mm/hp

/obj/item/ammo_box/magazine/multi_sprite/firefly/rubber
	icon_state = "pdh_rubber"
	ammo_type = /obj/item/ammo_casing/c9mm/rubber

/obj/item/ammo_box/magazine/multi_sprite/firefly/ihdf
	icon_state = "pdh_ihdf"
	ammo_type = /obj/item/ammo_casing/c9mm/ihdf

/obj/item/gun/ballistic/automatic/pistol/firefly/nomag
	spawnwithmagazine = FALSE

//	SEC MEDIC
/obj/item/storage/toolbox/guncase/nova/pistol/firefly
	name = "9x19mm special pistol supply box"
	desc = "Ideally contains a special 9x19mm Pistol."
	w_class = WEIGHT_CLASS_NORMAL


/obj/item/storage/toolbox/guncase/nova/pistol/firefly/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol/firefly/nomag(src)
	new /obj/item/ammo_box/magazine/multi_sprite/firefly/lethal(src)
	new /obj/item/ammo_box/magazine/multi_sprite/firefly/lethal(src)
	new /obj/item/ammo_box/magazine/multi_sprite/firefly/rubber(src)
	new /obj/item/ammo_box/magazine/multi_sprite/firefly/rubber(src)

