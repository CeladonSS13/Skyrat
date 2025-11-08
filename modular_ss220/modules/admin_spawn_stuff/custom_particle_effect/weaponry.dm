/obj/item/customizable_hfr_blade
	name = "The Black Blade"
	desc = "It seems to be a sword."
	icon = 'icons/obj/weapons/sword.dmi'
	icon_state = "hfrequency0"
	worn_icon_state = "hfrequency0"
	color = COLOR_BLACK // inhand
	icon_angle = -45
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	force = 20
	reach = 2 // attack up from to 2 tiles
	demolition_mod = 2 // for walls and that stuff
	throwforce = 25
	attack_speed = CLICK_CD_SLOW
	block_chance = 50
	block_sound = 'sound/items/weapons/parry.ogg'
	sharpness = SHARP_EDGED
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	actions_types = list(/datum/action/cooldown/spell/pointed/projectile/customizable_slash_wave)
	action_slots = ITEM_SLOT_HANDS

	var/slash_color_primary = COLOR_DARK_RED // used both for slash and particles
	var/slash_sound = 'modular_ss220/modules/admin_spawn_stuff/custom_particle_effect/sound/loud_slash.ogg'
	var/next_attack_time = 0
	var/particle_over_slash = /particles/custom_effect/two_color_darkred_black/intense
	var/particle_for_owner_on_slash = /particles/custom_effect/two_color_darkred_black
	var/particle_duration_for_owner_on_slash = 1 SECONDS
	var/icon_for_slash = 'icons/effects/effects.dmi'
	var/icon_state_for_slash = "highfreq_slash"
	var/fire_effect_on_hit = /datum/status_effect/black_flame

/obj/item/customizable_hfr_blade/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/two_handed, \
		wield_callback = CALLBACK(src, PROC_REF(on_wield)), \
		unwield_callback = CALLBACK(src, PROC_REF(on_unwield)), \
	)
	AddElement(/datum/element/update_icon_updates_onmob)

/obj/item/customizable_hfr_blade/update_icon_state()
	icon_state = "hfrequency[HAS_TRAIT(src, TRAIT_WIELDED)]"
	return ..()

/obj/item/customizable_hfr_blade/hit_reaction(mob/living/carbon/human/owner, atom/movable/hitby, attack_text = "the attack", final_block_chance = 0, damage = 0, attack_type = MELEE_ATTACK, damage_type = BRUTE)
	if(attack_type == PROJECTILE_ATTACK)
		if(HAS_TRAIT(src, TRAIT_WIELDED) || prob(final_block_chance))
			owner.visible_message(span_danger("[owner] deflects [attack_text] with [src]!"))
			playsound(src, SFX_BULLET_MISS, 75, TRUE)
			return TRUE
		return FALSE
	if(prob(final_block_chance * (HAS_TRAIT(src, TRAIT_WIELDED) ? 2 : 1)))
		owner.visible_message(span_danger("[owner] parries [attack_text] with [src]!"))
		return TRUE
	return FALSE

/obj/item/customizable_hfr_blade/pre_attack(atom/target, mob/living/user, list/modifiers, list/attack_modifiers)
	. = ..()
	if(.)
		return .
	if(!HAS_TRAIT(src, TRAIT_WIELDED))
		return . // Default attack
	if(isliving(target) && HAS_TRAIT(src, TRAIT_PACIFISM))
		return . // Default attack (ultimately nothing)
	if (world.time < next_attack_time)
		return . // nothing
	next_attack_time = world.time + attack_speed

	return slash(target, user, modifiers)

/// triggered on wield of two handed item
/obj/item/customizable_hfr_blade/proc/on_wield(obj/item/source, mob/user)
	update_icon(UPDATE_ICON_STATE)

/// triggered on unwield of two handed item
/obj/item/customizable_hfr_blade/proc/on_unwield(obj/item/source, mob/user)
	update_icon(UPDATE_ICON_STATE)

/obj/item/customizable_hfr_blade/proc/slash(atom/target, mob/living/user, list/modifiers)
	user.do_attack_animation(target, "nothing")
	var/damage_mod = 1
	var/x_slashed = text2num(modifiers[ICON_X]) || ICON_SIZE_X/2 //in case we arent called by a client
	var/y_slashed = text2num(modifiers[ICON_Y]) || ICON_SIZE_Y/2 //in case we arent called by a client

	// create slash visible effect

	var/obj/effect/temp_visual/customizable_slash/new_slash = new(get_turf(target), target, x_slashed, y_slashed, slash_color_primary)
	new_slash.icon = icon_for_slash ? icon_for_slash : 'icons/effects/effects.dmi'
	new_slash.icon_state = icon_state_for_slash ? icon_state_for_slash : "highfreq_slash"

	// blank (invisible) effects, that will hold particles (it's used because of easy use of timers & other stuff)

	var/obj/effect/temp_visual/blank_effect_on_user/blank_effect_on_slash_loc = new(get_turf(new_slash), new_slash)

	// particle holders instances creation & assigning references

	new /obj/effect/abstract/particle_holder/timed(user, particle_for_owner_on_slash, NONE, particle_duration_for_owner_on_slash) // effect on user
	var/obj/effect/abstract/particle_holder/special_effects_blank_on_slash_loc = new(blank_effect_on_slash_loc, particle_over_slash) // effect at slash location
	blank_effect_on_slash_loc.special_effects_holder_ref = WEAKREF(special_effects_blank_on_slash_loc)

	// sound

	playsound(src, slash_sound, 100, vary = TRUE)

	if(isliving(target))
		var/mob/living/living_target = target
		living_target.apply_damage(force*damage_mod, BRUTE, sharpness = SHARP_EDGED, wound_bonus = wound_bonus, exposed_wound_bonus = exposed_wound_bonus, def_zone = user.zone_selected)
		living_target.apply_status_effect(fire_effect_on_hit)
		log_combat(user, living_target, "slashed", src)
		if(living_target.stat == DEAD && prob(force*damage_mod*0.5))
			living_target.visible_message(span_danger("[living_target] explodes in a shower of gore!"), blind_message = span_hear("You hear organic matter ripping and tearing!"))
			living_target.investigate_log("has been gibbed by [src].", INVESTIGATE_DEATHS)
			living_target.gib(DROP_ALL_REMAINS)
			log_combat(user, living_target, "gibbed", src)
		return TRUE
	else if(target.uses_integrity)
		target.take_damage(force*damage_mod*3*demolition_mod, BRUTE, MELEE, FALSE, null, 50)
		return TRUE
	else if(iswallturf(target) && prob(force*damage_mod*0.5*demolition_mod))
		var/turf/closed/wall/wall_target = target
		wall_target.dismantle_wall()
		return TRUE
	else if(ismineralturf(target) && prob(force*damage_mod*demolition_mod))
		var/turf/closed/mineral/mineral_target = target
		mineral_target.gets_drilled()
		return TRUE
	return FALSE

/obj/effect/temp_visual/customizable_slash
	icon_state = "highfreq_slash"
	alpha = 150
	duration = 1 SECONDS
	layer = ABOVE_ALL_MOB_LAYER
	plane = ABOVE_GAME_PLANE

/obj/effect/temp_visual/customizable_slash/Initialize(mapload, atom/target, x_slashed, y_slashed, slash_color)
	. = ..()
	if(!target)
		return
	var/matrix/new_transform = matrix()
	new_transform.Turn(rand(1, 360)) // Random slash angle
	var/datum/decompose_matrix/decomp = target.transform.decompose()
	new_transform.Translate((x_slashed - ICON_SIZE_X/2) * decomp.scale_x, (y_slashed - ICON_SIZE_Y/2) * decomp.scale_y) // Move to where we clicked
	//Follow target's transform while ignoring scaling
	new_transform.Turn(decomp.rotation)
	new_transform.Translate(decomp.shift_x, decomp.shift_y)
	new_transform.Translate(target.pixel_x, target.pixel_y) // Follow target's pixel offsets
	transform = new_transform
	//Double the scale of the matrix by doubling the 2x2 part without touching the translation part
	var/matrix/scaled_transform = new_transform + matrix(new_transform.a, new_transform.b, 0, new_transform.d, new_transform.e, 0)
	animate(src, duration*0.5, color = slash_color, transform = scaled_transform, alpha = 255)
