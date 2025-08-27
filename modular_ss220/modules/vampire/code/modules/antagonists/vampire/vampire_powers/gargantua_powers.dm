/datum/action/cooldown/spell/blood_swell
	name = "Кровавый вал"
	desc = "Вы наполняете своё тело кровью, что делает вас очень устойчивым к оглушению и физическому урону, но не даёт использовать оружие дальнего боя."
	cooldown_time = 40 SECONDS
	button_icon_state = "blood_swell"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	overlay_icon_state = null
	school = "vampire"
	spell_requirements = SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/blood_swell/create_new_handler()
	. = ..()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 30
	return H

/datum/action/cooldown/spell/blood_swell/cast(atom/cast_on)
	. = ..()
	var/mob/living/carbon/human/H = cast_on
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
	overlay_icon_state = null
	school = "vampire"
	cooldown_time = 30 SECONDS
	aoe_radius = 4
	spell_requirements = SPELL_REQUIRES_HUMAN
	var/effect_duration = 10 SECONDS
	var/windup_time = 1 SECONDS
	var/effect_timer
	var/casting_cycle = FALSE

/datum/action/cooldown/spell/aoe/stomp/create_new_handler()
	. = ..()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 25
	return H

/datum/action/cooldown/spell/aoe/stomp/Remove(mob/M)
	. = ..()
	stop_cycle()

/datum/action/cooldown/spell/aoe/stomp/cast(atom/cast_on)
	. = ..()
	start_cycle()

/datum/action/cooldown/spell/aoe/stomp/proc/start_cycle()
	if(casting_cycle)
		return

	casting_cycle = TRUE
	to_chat(owner, span_notice("Вы активируете ударную волну! Эффект продлится 10 секунд."))

	effect_timer = addtimer(CALLBACK(src, PROC_REF(stop_cycle)), effect_duration, TIMER_STOPPABLE)

	start_windup()

/datum/action/cooldown/spell/aoe/stomp/proc/stop_cycle()
	if(!casting_cycle)
		return

	casting_cycle = FALSE
	if(effect_timer)
		deltimer(effect_timer)

	to_chat(owner, span_warning("Эффект ударной волны прекращается."))

/datum/action/cooldown/spell/aoe/stomp/proc/start_windup()
	if(!casting_cycle || !owner)
		return

	if(!do_after(owner, windup_time, timed_action_flags = IGNORE_USER_LOC_CHANGE|IGNORE_HELD_ITEM))
		stop_cycle()
		return

	perform_stomp()

/datum/action/cooldown/spell/aoe/stomp/proc/perform_stomp()
	if(!casting_cycle || !owner)
		return

	var/turf/T = get_turf(owner)
	playsound(T, 'sound/effects/meteorimpact.ogg', 80, TRUE)
	new /obj/effect/temp_visual/stomp(T)

	var/list/targets = get_things_to_cast_on(owner)
	for(var/mob/living/target in targets)
		cast_on_thing_in_aoe(target, owner)

	if(casting_cycle)
		addtimer(CALLBACK(src, PROC_REF(start_windup)), 0.5 SECONDS)

/datum/action/cooldown/spell/aoe/stomp/get_things_to_cast_on(atom/center)
	var/list/things = list()
	for(var/mob/living/nearby_mob in view(aoe_radius, center))
		if(nearby_mob == owner)
			continue
		if(!nearby_mob.affects_vampire(owner))
			continue
		things += nearby_mob
	return things

/datum/action/cooldown/spell/aoe/stomp/cast_on_thing_in_aoe(atom/victim, atom/caster)
	if(!isliving(victim))
		return

	var/mob/living/L = victim
	if(!L.affects_vampire(owner))
		return

	L.adjust_staggered(4 SECONDS)
	L.apply_damage(15, BRUTE, spread_damage = TRUE)

/datum/action/cooldown/spell/aoe/stomp/can_cast_spell(feedback = TRUE)
	. = ..()
	if(!.)
		return FALSE

	var/mob/living/carbon/user = owner
	if(user.legcuffed)
		if(feedback)
			to_chat(user, span_warning("Мои ноги скованы, я не могу использовать эту способность!"))
		return FALSE

	if(casting_cycle)
		if(feedback)
			to_chat(user, span_warning("Ударная волна уже активна!"))
		return FALSE

	return TRUE

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
	animate(src, transform = M * 4, time = duration, alpha = 0)

#define DOAFTER_SOURCE_GARGANTUA_INTERACTION

/datum/action/cooldown/spell/overwhelming_force
	name = "Неудержимая сила"
	desc = "При активации вы будете выбивать все шлюзы, на которые наткнётесь, если у вас нет доступа, а также отражать все обездвиживающие предметы."
	cooldown_time = 2 SECONDS
	button_icon_state = "OH_YEAAAAH"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	overlay_icon_state = null
	school = "vampire"
	spell_requirements = SPELL_REQUIRES_HUMAN
	var/active = FALSE


/datum/action/cooldown/spell/overwhelming_force/cast(atom/cast_on)
	. = ..()
	var/mob/living/user = cast_on
	if(!active)
		to_chat(user, span_userdanger("ВЫ ЧУВСТВУЕТЕ СЕБЯ СИЛЬНЕЕ!"))
		user.AddElement(/datum/element/door_pryer, 0, DOAFTER_SOURCE_GARGANTUA_INTERACTION)
		user.status_flags &= ~CANPUSH
		user.move_resist = MOVE_FORCE_STRONG
		active = TRUE
	else
		to_chat(user, span_warning("Вы чувствуете себя слабее..."))
		user.RemoveElement(/datum/element/door_pryer)
		user.move_resist = MOVE_FORCE_DEFAULT
		user.status_flags |= CANPUSH
		active = FALSE


/datum/action/cooldown/spell/blood_rush
	name = "Кровавый драйв"
	desc = "Напитайте себя магией крови, чтобы увеличить скорость передвижения."
	cooldown_time = 30 SECONDS
	button_icon_state = "blood_rush"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	overlay_icon_state = null
	school = "vampire"
	spell_requirements = SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/blood_rush/create_new_handler()
	. = ..()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 15
	return H

/datum/action/cooldown/spell/blood_rush/cast(atom/cast_on)
	. = ..()
	var/mob/living/carbon/human/H = cast_on
	to_chat(H, span_notice("Вы ощущаете прилив энергии!"))
	H.apply_status_effect(STATUS_EFFECT_BLOOD_RUSH)


/datum/action/cooldown/spell/pointed/projectile/demonic_grasp
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
	overlay_icon_state = null
	school = "vampire"
	spell_requirements = SPELL_REQUIRES_HUMAN
	sound = 'sound/effects/magic/exit_blood.ogg'

/datum/action/cooldown/spell/pointed/projectile/demonic_grasp/create_new_handler()
	var/datum/spell_handler/vampire/V = new()
	V.required_blood = 10
	return V


/obj/projectile/magic/demonic_grasp
	name = "demonic grasp"
	reflectable = FALSE
	icon_state = null


/obj/projectile/magic/demonic_grasp/process_movement(pixels_to_move, hitscan, tile_limit)
	. = ..()
	new /obj/effect/temp_visual/demonic_grasp(loc)


/obj/projectile/magic/demonic_grasp/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()
	if(!isliving(target) || !firer)
		return

	var/mob/living/victim = target

	if(!victim.affects_vampire(firer))
		return

	var/target_turf = get_turf(victim)
	victim.Immobilize(5 SECONDS)
	playsound(target_turf, 'sound/effects/magic/demon_attack1.ogg', 50, TRUE)
	new /obj/effect/temp_visual/demonic_grasp(target_turf)

	var/throw_target
	var/mob/living/user = firer
	if(user.combat_mode)
		throw_target = get_edge_target_turf(victim, get_dir(firer, victim))
		victim.throw_at(throw_target, 2, 5, spin = FALSE, callback = CALLBACK(src, PROC_REF(create_snare), victim)) // shove away
	if(!user.combat_mode)
		throw_target = get_step(firer, get_dir(firer, victim))
		victim.throw_at(throw_target, 2, 5, spin = FALSE, diagonals_first = TRUE, callback = CALLBACK(src, PROC_REF(create_snare), victim)) // pull towards
	else
		create_snare(victim)


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

/datum/action/cooldown/mob_cooldown/charge/gargantua_charge
	name = "Рывок"
	desc = "Вы резко бросаетесь в выбранное направление, нанося огромный урон, оглушая и разрушая стены и другие объекты."
	cooldown_time = 20 SECONDS
	button_icon_state = "vampire_charge"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	charge_distance = 7
	charge_delay = 0
	/// Amount of time to knock over an impacted target
	var/knockdown_duration = 4 SECONDS

/datum/action/cooldown/spell/pointed/charge/can_cast_spell(feedback)
	var/mob/living/carbon/user
	if(user.body_position == LYING_DOWN)
		return FALSE
	return ..()

/datum/action/cooldown/mob_cooldown/charge/gargantua_charge/do_charge_indicator(atom/charger, atom/charge_target)
	return

/datum/action/cooldown/mob_cooldown/charge/gargantua_charge/hit_target(atom/movable/source, atom/target, damage_dealt)
	. = ..()
	var/mob/living/living_target = target
	living_target.Knockdown(knockdown_duration)

/datum/action/cooldown/mob_cooldown/charge/gargantua_charge/charge_sequence(atom/movable/charger, atom/target_atom, delay, past)
	. = ..()
	var/datum/antagonist/vampire/V = owner.mind.has_antag_datum(/datum/antagonist/vampire)
	V.bloodusable = max(V.bloodusable - 30, 0)

#undef DOAFTER_SOURCE_GARGANTUA_INTERACTION
