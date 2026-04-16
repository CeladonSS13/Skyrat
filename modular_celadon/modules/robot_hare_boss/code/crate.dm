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
/obj/structure/closet/crate/robothare
	name = "robotic containment crate"
	desc = "A reinforced crate containing salvaged parts from the defeated Robot Hare."
	icon_state = "necrocrate"
	base_icon_state = "necrocrate"
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	can_install_electronics = FALSE
	paint_jobs = null
	can_weld_shut = FALSE

/obj/structure/closet/crate/robothare/PopulateContents()
	var/loot = rand(1, 5)
	switch(loot)
		if(1)
			// High-capacity power cell
			new /obj/item/stock_parts/power_store/cell/high(src)
		if(2)
			// Advanced stock parts
			new /obj/item/stock_parts/matter_bin/super(src)
			new /obj/item/stock_parts/capacitor/super(src)
		if(3)
			// Welding equipment
			new /obj/item/weldingtool/hugetank(src)
		if(4)
			// Robotics components
			new /obj/item/stack/cable_coil(src)
		if(5)
			// Electronics
			new /obj/item/storage/toolbox/mechanical(src)

/**
 * Crusher variant - bonus loot for defeating without taking damage (or minimal damage)
 */
/obj/structure/closet/crate/robothare/crusher
	name = "robotic containment crate (pristine)"
	desc = "A reinforced crate containing pristine parts from the Robot Hare, barely damaged."

/obj/structure/closet/crate/robothare/crusher/PopulateContents()
	..()
	// Bonus: trophy and rare component
	new /obj/item/crusher_trophy/robot_hare_ear(src)
