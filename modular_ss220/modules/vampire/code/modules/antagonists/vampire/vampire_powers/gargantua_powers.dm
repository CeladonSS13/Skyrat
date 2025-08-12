/datum/action/cooldown/spell/blood_swell
	name = "Кровавый вал"
	desc = "Вы наполняете своё тело кровью, что делает вас очень устойчивым к оглушению и физическому урону, но не даёт использовать оружие дальнего боя."
	cooldown_time = 40 SECONDS
	button_icon_state = "blood_swell"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/blood_swell/create_new_handler()
	. = ..()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 30
	return H

/datum/action/cooldown/spell/blood_swell/cast(list/targets, mob/user)
	. = ..()
	var/mob/living/target = targets[1]
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		H.apply_status_effect(STATUS_EFFECT_BLOOD_SWELL)


/datum/vampire_passive/blood_swell_upgrade
	gain_desc = "Пока действует «Кровавый вал», все ваши атаки в ближнем бою наносят повышенный урон."


/datum/action/cooldown/spell/aoe/stomp
	name = "Ударная волна"
	desc = "Вы бьёте ногой по земле, посылая мощную ударную волну, отчего окружающие разлетаются в разные стороны. Не может быть применено, если ваши ноги скованы или обездвижены."
	button_icon_state = "seismic_stomp"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	cooldown_time = 30 SECONDS
	aoe_radius = 1
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN
	var/max_range = 4

/datum/action/cooldown/spell/aoe/stomp/create_new_handler()
	. = ..()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 25
	return H

/datum/action/cooldown/spell/aoe/stomp/can_cast_spell(feedback)
	var/mob/living/carbon/user = owner
	if(user.legcuffed)
		return FALSE
	return ..()


/datum/action/cooldown/spell/aoe/stomp/cast(list/targets)
	. = ..()
	var/turf/T = get_turf(owner)
	playsound(T, 'sound/effects/meteorimpact.ogg', 100, TRUE)
	addtimer(CALLBACK(src, PROC_REF(hit_check), aoe_radius, T, owner), 0.2 SECONDS)
	new /obj/effect/temp_visual/stomp(T)


/datum/action/cooldown/spell/aoe/stomp/proc/hit_check(range, turf/start_turf, mob/user, safe_targets = list())
	// gets the two outermost turfs in a ring, we get two so people cannot "walk over" the shockwave
	var/list/targets = view(range, start_turf) - view(range - 2, start_turf)
	for(var/turf/flooring in targets)
		if(prob(100 - (range * 20)))
			flooring.ex_act(EXPLODE_LIGHT)

	for(var/mob/living/L in targets)
		if(L in safe_targets)
			continue

		if(L.throwing) // no double hits
			continue

		if(!L.affects_vampire(user))
			continue

		if(L.move_resist > MOVE_FORCE_VERY_STRONG)
			continue

		var/throw_target = get_edge_target_turf(L, get_dir(start_turf, L))
		INVOKE_ASYNC(L, TYPE_PROC_REF(/atom/movable, throw_at), throw_target, 3, 4)
		L.Knockdown(2 SECONDS)
		safe_targets += L

	var/new_range = range + 1
	if(new_range <= max_range)
		addtimer(CALLBACK(src, PROC_REF(hit_check), new_range, start_turf, user, safe_targets), 0.2 SECONDS)


/obj/effect/temp_visual/stomp
	icon = 'modular_ss220/modules/vampire/icons/effects/seismic_stomp_effect.dmi'
	icon_state = "stomp_effect"
	duration = 0.8 SECONDS
	pixel_y = -16
	pixel_x = -16


/obj/effect/temp_visual/stomp/Initialize(mapload)
	. = ..()
	var/matrix/M = matrix() * 0.5
	transform = M
	animate(src, transform = M * 8, time = duration, alpha = 0)

#define DOAFTER_SOURCE_GARGANTUA_INTERACTION

/datum/action/cooldown/spell/overwhelming_force
	name = "Неудержимая сила"
	desc = "При активации вы будете выбивать все шлюзы, на которые наткнётесь, если у вас нет доступа, а также отражать все обездвиживающие предметы."
	cooldown_time = 2 SECONDS
	button_icon_state = "OH_YEAAAAH"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN


/datum/action/cooldown/spell/overwhelming_force/cast(mob/living/carbon/user)
	. = ..()
	to_chat(user, span_userdanger("ВЫ ЧУВСТВУЕТЕ СЕБЯ СИЛЬНЕЕ!"))
	//user.AddElement(/datum/element/door_pryer, pry_time = 0 SECONDS, interaction_key = DOAFTER_SOURCE_GARGANTUA_INTERACTION)
	//user.status_flags &= ~CANPUSH
	//user.move_resist = MOVE_FORCE_STRONG

	// else
	// 	to_chat(user, span_warning("Вы чувствуете себя слабее..."))
	// 	REMOVE_TRAIT(user, TRAIT_FORCE_DOORS, VAMPIRE_TRAIT)
	// 	user.RemoveElement(/datum/element/door_pryer, pry_time = 0 SECONDS, interaction_key = DOAFTER_SOURCE_GARGANTUA_INTERACTION)
	// 	user.move_resist = MOVE_FORCE_DEFAULT
	// 	user.status_flags |= CANPUSH


/datum/action/cooldown/spell/blood_rush
	name = "Кровавый драйв"
	desc = "Напитайте себя магией крови, чтобы увеличить скорость передвижения."
	cooldown_time = 30 SECONDS
	button_icon_state = "blood_rush"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/blood_rush/create_new_handler()
	. = ..()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 15
	return H

/datum/action/cooldown/spell/blood_rush/cast(list/targets, mob/user)
	. = ..()
	var/mob/living/target = targets[1]
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		to_chat(H, span_notice("Вы ощущаете прилив энергии!"))
		H.apply_status_effect(STATUS_EFFECT_BLOOD_RUSH)


/datum/action/cooldown/spell/pointed/projectile/fireball/demonic_grasp
	name = "Демоническая хватка"
	desc = "Выстрелите сгустком демонической энергии, захватывая или отбрасывая цель в зависимости от вашего намерения: «ОБЕЗОРУЖИТЬ» — оттолкнуть, «СХВАТИТЬ» — притянуть."
	cooldown_time = 15 SECONDS
	projectile_type = /obj/projectile/magic/demonic_grasp

	active_msg		= span_notice("Вы поднимаете руку, полную демонической энергии!")
	deactive_msg	= span_notice("Вы возвращаете себе энергию... пока что.")

	button_icon_state = "demonic_grasp"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"

	school = "vampire"
	invocation_type = "none"
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN
	invocation = null
	sound = 'sound/effects/magic/exit_blood.ogg'


/datum/action/cooldown/spell/pointed/projectile/fireball/demonic_grasp/build_button_icon(atom/movable/screen/movable/action_button/button, update_flags, force)
	. = ..()
	update_vampire_spell_name()


/datum/action/cooldown/spell/pointed/projectile/fireball/demonic_grasp/create_new_handler()
	var/datum/spell_handler/vampire/V = new()
	V.required_blood = 10
	return V


/obj/projectile/magic/demonic_grasp
	name = "demonic grasp"
	// parry this you filthy casual
	//reflectability = REFLECTABILITY_NEVER
	icon_state = null


/obj/projectile/magic/demonic_grasp/process_movement(pixels_to_move, hitscan, tile_limit)
	. = ..()
	new /obj/effect/temp_visual/demonic_grasp(loc)


/obj/projectile/magic/demonic_grasp/on_hit(mob/living/target, blocked, hit_zone)
	. = ..()
	if(!istype(target) || !firer || !target.affects_vampire(firer))
		return

	var/target_turf = get_turf(target)
	target.Immobilize(5 SECONDS)
	playsound(target_turf, 'sound/effects/magic/demon_attack1.ogg', 50, TRUE)
	new /obj/effect/temp_visual/demonic_grasp(target_turf)

	var/throw_target
	var/mob/living/user = firer
	if(user.combat_mode)
		throw_target = get_edge_target_turf(target, get_dir(firer, target))
		target.throw_at(throw_target, 2, 5, spin = FALSE, callback = CALLBACK(src, PROC_REF(create_snare), target)) // shove away
	if(!user.combat_mode)
		throw_target = get_step(firer, get_dir(firer, target))
		target.throw_at(throw_target, 2, 5, spin = FALSE, diagonals_first = TRUE, callback = CALLBACK(src, PROC_REF(create_snare), target)) // pull towards
	else
		create_snare(target)


/obj/projectile/magic/demonic_grasp/proc/create_snare(mob/living/target)
	new /obj/effect/temp_visual/demonic_snare(get_turf(target))


/obj/effect/temp_visual/demonic_grasp
	icon = 'modular_ss220/modules/vampire/icons/effects/vampire_effects.dmi'
	icon_state = "demonic_grasp"
	duration = 3.5 SECONDS


/obj/effect/temp_visual/demonic_snare
	icon = 'modular_ss220/modules/vampire/icons/effects/vampire_effects.dmi'
	icon_state = "immobilized"
	duration = 5 SECONDS


/datum/action/cooldown/spell/pointed/charge
	name = "Рывок"
	desc = "Вы резко бросаетесь в выбранное направление, нанося огромный урон, оглушая и разрушая стены и другие объекты."
	cooldown_time = 30 SECONDS
	button_icon_state = "vampire_charge"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	cast_range = 7
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/pointed/charge/can_cast_spell(feedback)
	var/mob/living/carbon/user
	if(user.body_position == LYING_DOWN)
		return FALSE
	return ..()

/datum/action/cooldown/spell/pointed/charge/create_new_handler()
	. = ..()
	var/datum/spell_handler/vampire/V = new()
	V.required_blood = 30
	return V

/datum/action/cooldown/spell/pointed/charge/cast(list/targets, mob/user)
	. = ..()
	var/target = targets[1]
	if(isliving(user))
		var/mob/living/L = user
		L.apply_status_effect(STATUS_EFFECT_CHARGING)
		L.throw_at(target, cast_range, 1, L, FALSE, callback = CALLBACK(L, TYPE_PROC_REF(/mob/living, remove_status_effect), STATUS_EFFECT_CHARGING))

#undef DOAFTER_SOURCE_GARGANTUA_INTERACTION
