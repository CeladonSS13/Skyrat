/obj/item/ammo_casing/energy/electrode
	e_cost = LASER_SHOTS(15, STANDARD_CELL_CHARGE)
	delay = 15

/obj/item/ammo_casing/energy/electrode/old_electrode
	e_cost = LASER_SHOTS(5, STANDARD_CELL_CHARGE)
	projectile_type = /obj/item/ammo_casing/energy/electrode/old_electrode
	delay = 0

/obj/projectile/energy/electrode
	apply_tase_effect = FALSE
	show_beam_effect = FALSE
	stamina = 15
	range = 7
	paralyze = 0.2 SECONDS // Kind of microstun
	stutter = 8 SECONDS // Weaker than stunslug
	jitter = 30 SECONDS // Weaker than stunslug

/obj/projectile/energy/electrode/old_electrode
	apply_tase_effect = TRUE
	show_beam_effect = TRUE
	stamina = 0 // handled by tase effect
	range = 5
	paralyze = 0 SECONDS // all that stuff handled by tase effect
	stutter = 0 SECONDS
	jitter = 0 SECONDS
