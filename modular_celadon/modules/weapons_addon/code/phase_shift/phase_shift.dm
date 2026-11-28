// ============================================================
// Phase SHIFT T-9
// ============================================================
/obj/item/gun/ballistic/automatic/phase_shift
	name = "Phase Shift T-9"
	desc = "A high-precision automatic rifle equipped with an active heat dissipation system. When a critical temperature is reached in the receiver, the internal mechanism pushes the rod into the groove outside the weapon."
	icon = 'modular_celadon/modules/weapons_addon/icons/phase_shift.dmi'
	icon_state = "phase_shift"
	base_icon_state = "phase_shift"
	inhand_icon_state = "phase_shift"
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

	// System heat
	var/current_heat = 0
	var/max_heat = 100
	var/heat_per_shot = 5
	/// Пассивное охлаждение (единиц в секунду). Полный сброс с 95 займет ~8 сек.
	var/cool_down_per_second = 12
	/// Порог предупреждения (70% тепла — выдвигается индикаторный стержень)
	var/warning_heat_ratio = 0.7
	/// Время полной блокировки при перегреве до 100% (штраф за перегрев)
	var/overheat_duration = 12 SECONDS
	/// Сколько тепла остается после аварийного сброса перегрева (50%)
	var/post_overheat_heat_ratio = 0.5
	var/overheated = FALSE
	var/rod_extended = FALSE
	var/overheat_timer_id

/obj/item/gun/ballistic/automatic/phase_shift/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.3 SECONDS)
	update_appearance()

/obj/item/gun/ballistic/automatic/phase_shift/Destroy()
	STOP_PROCESSING(SSobj, src)
	if(overheat_timer_id)
		deltimer(overheat_timer_id)
		overheat_timer_id = null
	return ..()

/obj/item/gun/ballistic/automatic/phase_shift/process(seconds_per_tick)
	if(overheated)
		return PROCESS_KILL

	if(current_heat <= 0)
		current_heat = 0
		return PROCESS_KILL

	current_heat = max(0, current_heat - (cool_down_per_second * seconds_per_tick))
	update_heat_state()

/obj/item/gun/ballistic/automatic/phase_shift/proc/update_heat_state()
	if(overheated)
		return

	if(current_heat >= max_heat)
		trigger_overheat()
		return

	var/new_rod_extended = (current_heat >= (max_heat * warning_heat_ratio))
	if(rod_extended != new_rod_extended)
		rod_extended = new_rod_extended
		update_appearance()

/obj/item/gun/ballistic/automatic/phase_shift/update_overlays()
	. = ..()

	if(overheated)
		. += mutable_appearance(icon, "automatically_rod")
	else if(rod_extended)
		. += mutable_appearance(icon, "automatically_rod_warning")

	var/mag_state = get_magazine_icon_state()
	if(mag_state)
		. += mutable_appearance(icon, mag_state)

/obj/item/gun/ballistic/automatic/phase_shift/proc/get_magazine_icon_state()
	if(!magazine)
		return null
	var/ammo = magazine.ammo_count(TRUE)
	if(ammo <= 0)
		return "automatically_mag-0"
	var/rounded_ammo = clamp(FLOOR(ammo, 5), 5, 30)
	return "automatically_mag-[rounded_ammo]"

/obj/item/gun/ballistic/automatic/phase_shift/can_shoot()
	if(overheated)
		return FALSE
	return ..()

/obj/item/gun/ballistic/automatic/phase_shift/shoot_live_shot(mob/living/user, pointblank, atom/target, params, distro, pointblank_zone)
	// Страховка на случай прямого вызова выстрела в обход can_shoot()
	if(overheated)
		if(user)
			to_chat(user, span_warning("[src] is overheated! Wait for it to cool down."))
		return FALSE

	. = ..()
	if(!.)
		return

	current_heat = min(max_heat, current_heat + heat_per_shot)
	START_PROCESSING(SSobj, src)
	update_heat_state()

/obj/item/gun/ballistic/automatic/phase_shift/proc/trigger_overheat()
	if(overheated)
		return

	overheated = TRUE
	rod_extended = FALSE
	STOP_PROCESSING(SSobj, src)
	update_appearance()

	if(ismob(loc))
		to_chat(loc, span_userdanger("[src] overheats! The cooling rod extends. Wait for cooldown!"))

	overheat_timer_id = addtimer(CALLBACK(src, PROC_REF(reset_overheat)), overheat_duration, TIMER_STOPPABLE)

/obj/item/gun/ballistic/automatic/phase_shift/proc/reset_overheat()
	overheat_timer_id = null
	overheated = FALSE
	current_heat = max_heat * post_overheat_heat_ratio
	rod_extended = (current_heat >= (max_heat * warning_heat_ratio))
	START_PROCESSING(SSobj, src)
	update_appearance()

	if(ismob(loc))
		to_chat(loc, span_notice("[src] has cooled down enough to fire again."))

/obj/item/gun/ballistic/automatic/phase_shift/examine(mob/user)
	. = ..()
	var/heat_percent = round((current_heat / max_heat) * 100)
	if(heat_percent > 0)
		. += span_info("The barrel is at [heat_percent]% of its maximum temperature.")
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
