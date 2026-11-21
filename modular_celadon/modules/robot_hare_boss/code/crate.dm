/obj/structure/closet/crate/large/soviet
	name = "green large crate"
	desc = "A deeply scratched wooden crate with erased markings. You'll need a crowbar to get it open."
	icon = 'modular_celadon/modules/robot_hare_boss/icons/crates.dmi'
	icon_state = "largecrate_soviet"
	base_icon_state = "largecrate_soviet"

/**
 * Robot Hare Loot Crate
 * Contains useful robotics and electronics components
 */
/obj/structure/closet/crate/necropolis/robothare
	name = "robotic containment crate"
	desc = "A reinforced crate containing salvaged parts from the defeated Robot Hare."
	icon_state = "robust"
	base_icon_state = "robust"
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	can_install_electronics = FALSE
	paint_jobs = null
	can_weld_shut = FALSE

/obj/structure/closet/crate/necropolis/robothare/PopulateContents()
	var/loot = rand(1, 5)
	switch(loot)
		if(1)
			new /obj/item/dnainjector/shock(src)
		if(2)
			new	/obj/item/clothing/under/costume/soviet(src)
			new /obj/item/clothing/head/costume/ushanka(src)
		if(3)
			new /obj/item/gun/ballistic/automatic/pistol(src)
		if(4)
			new /obj/item/food/grown/carrot(src, 33) // carrotisole u got while fight, dont get it?
		if(5)
			new /obj/item/storage/toolbox/syndicate(src)

/**
 * Crusher variant - bonus loot for defeating without taking damage (or minimal damage)
 */
/obj/structure/closet/crate/necropolis/robothare/crusher
	name = "robotic containment crate (pristine)"
	desc = "A reinforced crate containing pristine parts from the Robot Hare, barely damaged."

/obj/structure/closet/crate/necropolis/robothare/crusher/PopulateContents()
	..()
	// Bonus: trophy and rare component
	new /obj/item/crusher_trophy/robot_hare_hand(src)
