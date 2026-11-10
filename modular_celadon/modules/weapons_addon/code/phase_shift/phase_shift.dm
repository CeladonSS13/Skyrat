#define CALIBER_762PHASE "7.62x39 Phase"

///casings
/obj/item/ammo_casing/a762_phase
    name = "7.62x39mm phase round"
    desc = "A powerful rifle cartridge. Designed specifically for phase Shift T-9."
    icon = 'modular_celadon/modules/weapons_addon/icons/phase_shift.dmi'
    icon_state = "762_casing_phaze"
    caliber = CALIBER_762PHASE
    projectile_type = /obj/projectile/bullet/a762_phase
    harmful = TRUE

/obj/item/ammo_casing/a762_phase/a762_phase_plasma
    name = "7.62x39mm plasma phase round"
    desc = "A powerful rifle cartridge containing plasma instead of a bullet. Designed specifically for Phase Shift T-9."
    icon_state = "762_casing_phaze_plasma"
    projectile_type = /obj/projectile/energy/a762_phase/plasma

/obj/item/ammo_casing/a762_phase/a762_phase_energy
    name = "7.62x39mm energy phase round"
    desc = "A powerful rifle cartridge containing energy instead of a bullet. Designed specifically for Phase Shift T-9."
    icon_state = "762_casing_phaze_energy"
    projectile_type = /obj/projectile/energy/a762_phase/energy

///projectiles
/obj/projectile/bullet/a762_phase
    name = "7.62x39mm bullet"
    damage = 25
    armour_penetration = 15
    icon_state = "bullet"
    wound_bonus = 30

//Energy bullets
/obj/projectile/energy/a762_phase
    icon = 'modular_celadon/modules/weapons_addon/icons/phase_shift.dmi'

/obj/projectile/energy/a762_phase/plasma
    name = "7.62x39mm plasma"
    damage = 20
    armour_penetration = 70
    icon_state = "plasma_jet"
    wound_bonus = 40

/obj/projectile/energy/a762_phase/energy
    name = "7.62x39mm energy"
    damage = 15
    armour_penetration = 10
    wound_bonus= 15
    icon_state = "energy"

///magazine
/obj/item/ammo_box/magazine/m762_phase
	name = "phase Shift magazine (7.62x39mm)"
	desc = "Magazine for phase Shift T-9 with 7.62x39mm rounds."
	icon = 'modular_celadon/modules/weapons_addon/icons/phase_shift.dmi'
	icon_state = "magazine_phaze"
	base_icon_state = "magazine_phaze"
	ammo_type = /obj/item/ammo_casing/a762_phase
	caliber = CALIBER_762PHASE
	multiple_sprite_use_base = TRUE
	max_ammo = 30
//Update magazine icons
/obj/item/ammo_box/magazine/m762_phase/update_icon_state()
	. = ..()
	var/ammo_count = stored_ammo ? stored_ammo.len : 0
	var/rounded_ammo = round(ammo_count, 5)
	var/display_ammo = (rounded_ammo == 0 && ammo_count > 0) ? 5 : rounded_ammo
	icon_state = "[base_icon_state]-[display_ammo]"

/obj/item/ammo_box/b762_phase
    name = "ammo box (7.62x39mm phase)"
    desc = "A box with 7.62x39mm cartridges for phase Shift T-9."
    icon = 'modular_celadon/modules/weapons_addon/icons/phase_shift.dmi'
    icon_state = "box_phaze"
    base_icon_state = "box_phaze"
    multiple_sprites = AMMO_BOX_FULL_EMPTY
    multiple_sprite_use_base = TRUE
    ammo_type = /obj/item/ammo_casing/a762_phase
    caliber = CALIBER_762PHASE
    max_ammo = 60

// ============================================================
// Phase SHIFT T-9
// ============================================================
/obj/item/gun/ballistic/automatic/phase_shift
	name = "Phase Shift T-9"
	desc = "A high-precision automatic rifle equipped with an active heat dissipation system. When a critical temperature is reached in the receiver, the internal mechanism pushes the rod into the groove outside the weapon."
	icon = 'modular_celadon/modules/weapons_addon/icons/phase_shift.dmi'
	icon_state = "automatically"
	base_icon_state = "automatically"
	inhand_icon_state = "Femboy_porno"
	w_class = WEIGHT_CLASS_BULKY
	accepted_magazine_type = /obj/item/ammo_box/magazine/m762_phase
	can_suppress = TRUE
	burst_size = 1
	fire_delay = 0
	actions_types = list()
	bolt_type = BOLT_TYPE_LOCKING
	projectile_damage_multiplier = 1.2
	mag_display = FALSE
	mag_display_ammo = FALSE
	empty_indicator = FALSE
	fire_sound = 'modular_celadon/modules/weapons_addon/sound/phase_shift/bad-explosion.ogg'
	fire_sound_volume = 100
	righthand_file = 'modular_celadon/modules/weapons_addon/icons/phase_shift_righthand.dmi'
	lefthand_file = 'modular_celadon/modules/weapons_addon/icons/phase_shift_lefthand.dmi'

	// System heat
	var/current_heat = 0
	var/max_heat = 100
	var/heat_per_shot = 5
	var/cool_down_per_second = 2
	var/overheated = FALSE
	var/rod_extended = FALSE
	var/cooling_timer = null

	// Magazine overlay reference
	var/image/mag_overlay_ref = null

/obj/item/gun/ballistic/automatic/phase_shift/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.3 SECONDS)
	start_cooling_loop()
	update_overlays()

/obj/item/gun/ballistic/automatic/phase_shift/Destroy()
	if(cooling_timer)
		deltimer(cooling_timer)
	return ..()

/obj/item/gun/ballistic/automatic/phase_shift/proc/start_cooling_loop()
	if(cooling_timer)
		deltimer(cooling_timer)
	cooling_timer = addtimer(CALLBACK(src, PROC_REF(cooling_loop)), 1 SECONDS, TIMER_LOOP|TIMER_STOPPABLE)

/obj/item/gun/ballistic/automatic/phase_shift/proc/cooling_loop()
	if(overheated)
		return
	if(current_heat <= 0)
		stop_cooling_loop()
		return
	current_heat = max(0, current_heat - cool_down_per_second)
	update_heat_state()

/obj/item/gun/ballistic/automatic/phase_shift/proc/stop_cooling_loop()
	if(cooling_timer)
		deltimer(cooling_timer)
		cooling_timer = null

/obj/item/gun/ballistic/automatic/phase_shift/proc/update_heat_state()
	if(overheated)
		return
	if(current_heat >= max_heat)
		overheat()
		return

	var/new_rod_extended = (current_heat >= max_heat * 0.7)
	if(rod_extended != new_rod_extended)
		rod_extended = new_rod_extended
		update_overlays()

/obj/item/gun/ballistic/automatic/phase_shift/update_overlays()
	. = ..()

	// ===== ROD (static) =====
	var/static/image/rod_warning
	var/static/image/rod_overheat
	if(isnull(rod_warning))
		rod_warning = image(icon, "automatically_rod_warning")
		rod_overheat = image(icon, "automatically_rod")
		rod_warning.layer = FLOAT_LAYER
		rod_overheat.layer = FLOAT_LAYER

	cut_overlay(list(rod_warning, rod_overheat))

	if(overheated)
		add_overlay(rod_overheat)
	else if(rod_extended)
		add_overlay(rod_warning)

	// ===== MAGAZINE =====
	if(mag_overlay_ref)
		cut_overlay(mag_overlay_ref)
		mag_overlay_ref = null

	var/desired_state = get_magazine_icon_state(magazine ? magazine.ammo_count(TRUE) : 0, magazine ? TRUE : FALSE)

	if(desired_state)
		mag_overlay_ref = image(icon, desired_state)
		mag_overlay_ref.layer = FLOAT_LAYER
		add_overlay(mag_overlay_ref)

/obj/item/gun/ballistic/automatic/phase_shift/proc/get_magazine_icon_state(ammo, has_magazine)
	if(!has_magazine)
		return null
	if(ammo <= 0)
		return "automatically_mag-0"
	if(ammo >= 30)
		return "automatically_mag-30"
	if(ammo >= 25)
		return "automatically_mag-25"
	if(ammo >= 20)
		return "automatically_mag-20"
	if(ammo >= 15)
		return "automatically_mag-15"
	if(ammo >= 10)
		return "automatically_mag-10"
	return "automatically_mag-5"

/obj/item/gun/ballistic/automatic/phase_shift/can_shoot()
	. = ..()
	if(overheated)
		return FALSE
	return .

/obj/item/gun/ballistic/automatic/phase_shift/shoot_live_shot(mob/living/user, pointblank, atom/target, params, distro, pointblank_zone)
	if(overheated)
		to_chat(user, span_warning("[src] is overheated! Wait for it to cool down."))
		return FALSE
	. = ..()
	if(.)
		current_heat += heat_per_shot
		start_cooling_loop()
		if(current_heat >= max_heat)
			overheat()
			to_chat(user, span_userdanger("[src] overheats! The cooling rod extends. Wait for cooldown!"))
			addtimer(CALLBACK(src, PROC_REF(reset_overheat)), 5 SECONDS)
		else
			update_heat_state()

		update_overlays()

/obj/item/gun/ballistic/automatic/phase_shift/proc/overheat()
	overheated = TRUE
	rod_extended = FALSE
	update_overlays()

/obj/item/gun/ballistic/automatic/phase_shift/proc/reset_overheat()
	overheated = FALSE
	current_heat = 0
	rod_extended = FALSE
	start_cooling_loop()
	update_overlays()
	if(ismob(loc))
		to_chat(loc, span_notice("[src] has cooled down and is ready to fire again."))

/obj/item/gun/ballistic/automatic/phase_shift/examine(mob/user)
	. = ..()
	var/heat_percent = (current_heat / max_heat) * 100
	if(heat_percent > 0)
		. += span_info("The barrel is [round(heat_percent)]% of its maximum temperature.")
	if(overheated)
		. += span_warning("The cooling rod is fully extended! The weapon is too hot to fire.")
	else if(rod_extended)
		. += span_info("The cooling rod is extended. The weapon is hot but still operational.")

///supply pack
/datum/supply_pack/security/armory/phase_shift
	name = "Phase Shift T-9 Rifle Crate"
	desc = "A high-precision automatic rifle equipped with an active heat dissipation system. When a critical temperature is reached in the receiver, the internal mechanism pushes the rod into the groove outside the weapon. Uses 7.62x39mm ammunition. Comes with three 30-round magazines."
	cost = 120000
	contains = list(
		/obj/item/gun/ballistic/automatic/phase_shift,
		/obj/item/ammo_box/magazine/m762_phase = 3,
	)
	crate_name = "phase shift t-9 rifle crate"
	crate_type = /obj/structure/closet/crate/secure/weapon

