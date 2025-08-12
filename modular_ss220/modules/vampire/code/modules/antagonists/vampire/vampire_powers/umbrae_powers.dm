/datum/action/cooldown/spell/cloak
	name = "Покров тьмы"
	desc = "Включает или выключает маскировку в темноте. Если вы замаскированы и находитесь в темноте, то ваша скорость увеличивается."
	button_icon_state = "vampire_cloak"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	cooldown_time = 2 SECONDS
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN


/datum/action/cooldown/spell/cloak/cloak/update_vampire_spell_name(mob/user = usr)
	var/datum/antagonist/vampire/V = user?.mind?.has_antag_datum(/datum/antagonist/vampire)
	if(!V)
		return

	var/new_name = "[initial(name)] ([V.iscloaking ? "Деактивировать" : "Активировать"])"
	name = new_name
	build_button_icon()


/datum/action/cooldown/spell/cloak/cloak/cast(mob/living/cast_on)
	. = ..()
	var/datum/antagonist/vampire/V = cast_on.mind.has_antag_datum(/datum/antagonist/vampire)
	V.iscloaking = !V.iscloaking
	if(ishuman(cast_on))
		var/mob/living/carbon/human/H = cast_on
		if(V.iscloaking)
			H.physiology.burn_mod *= 1.3
			cast_on.RegisterSignal(cast_on, COMSIG_LIVING_IGNITED, TYPE_PROC_REF(/mob/living, update_vampire_cloak))
		else
			cast_on.UnregisterSignal(cast_on, COMSIG_LIVING_IGNITED)
			H.physiology.burn_mod /= 1.3

	update_vampire_spell_name(cast_on)
	to_chat(cast_on, span_notice("Теперь вы будете <b>[V.iscloaking ? "скрыты" : "видимы"]</b> в темноте."))


/mob/living/proc/update_vampire_cloak()
	SIGNAL_HANDLER
	var/datum/antagonist/vampire/V = mind.has_antag_datum(/datum/antagonist/vampire)
	V.handle_vampire_cloak()


/datum/action/cooldown/spell/pointed/shadow_snare
	name = "Теневая ловушка"
	desc = "Вы вызываете ловушку на земле. Когда её пересекут, она ослепит цель, погасит все имеющиеся у неё источники света и захватит её в капкан."
	cooldown_time = 10 SECONDS
	button_icon_state = "shadow_snare"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/pointed/shadow_snare/create_new_handler()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 20
	return H

/datum/action/cooldown/spell/pointed/shadow_snare/cast(list/targets, mob/user)
	. = ..()
	var/turf/target = targets[1]
	new /obj/item/restraints/legcuffs/beartrap/shadow_snare(target)


/obj/item/restraints/legcuffs/beartrap/shadow_snare
	name = "shadow snare"
	desc = "Почти прозрачная ловушка, которая тает в тени."
	alpha = 60
	armed = TRUE
	anchored = TRUE
	breakouttime = 5 SECONDS
	item_flags = DROPDEL


/obj/item/restraints/legcuffs/beartrap/shadow_snare/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)


/obj/item/restraints/legcuffs/beartrap/shadow_snare/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()


/obj/item/restraints/legcuffs/beartrap/shadow_snare/process()
	var/turf/T = get_turf(src)
	var/lighting_count = T.get_lumcount() * 10
	if(lighting_count > 2)
		atom_integrity -= 50

	if(atom_integrity <= 0)
		visible_message(span_notice("[src] исчезает."))
		qdel(src)


/obj/item/restraints/legcuffs/beartrap/shadow_snare/spring_trap(mob/living/carbon/victim)
	if(!armed || !iscarbon(victim))
		return

	if(!victim.affects_vampire()) // no parameter here so holy always protects
		return

	if(victim.movement_type & MOVETYPES_NOT_TOUCHING_GROUND)
		return

	victim.set_light(0, 0, null, l_on = FALSE)
	victim.adjust_temp_blindness(20 SECONDS)
	STOP_PROCESSING(SSobj, src) // won't wither away once you are trapped

	. = ..()

	if(loc != victim && !QDELETED(src)) // if it fails to latch onto someone for whatever reason, delete itself, we don't want unarmed ones lying around.
		qdel(src)


/obj/item/restraints/legcuffs/beartrap/shadow_snare/attack_hand(mob/user)
	spring_trap(user)


/obj/item/restraints/legcuffs/beartrap/shadow_snare/attack_tk(mob/user)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		to_chat(user, span_userdanger("Ловушка посылает обратную связь с помощью психического сигнала!"))
		C.adjust_temp_blindness(20 SECONDS)


/obj/item/restraints/legcuffs/beartrap/shadow_snare/attackby(obj/item/I, mob/user, params)
	var/obj/item/assembly/flash/flash = I
	if(!istype(flash) || !flash.try_use_flash(user))
		return ..()
	user.do_attack_animation(src)
	user.visible_message(
		span_danger("[user] наводит [I] на [src], и она исчезает!"),
		span_danger("Наведите [I] на [src], и она исчезнет!"),
	)
	qdel(src)


/datum/action/cooldown/spell/soul_anchor
	name = "Теневой якорь"
	desc = "Вы вызываете затемнённый якорь после задержки, повторное заклинание телепортирует вас обратно к якорю. Вы будете вынуждены вернуться назад через 2 минуты, если не произнесли повторное заклинание."
	cooldown_time = 130 SECONDS
	button_icon_state = "shadow_anchor"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	var/obj/structure/shadow_anchor/anchor
	/// Are we making an anchor?
	var/making_anchor = FALSE
	/// Holds a reference to the timer until the caster is forced to recall
	var/timer
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/soul_anchor/create_new_handler()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 30
	H.deduct_blood_on_cast = FALSE
	return H


/datum/action/cooldown/spell/touch/before_cast(atom/cast_on)
	return ..() | SPELL_NO_FEEDBACK | SPELL_NO_IMMEDIATE_COOLDOWN

/datum/action/cooldown/spell/soul_anchor/cast(mob/cast_on)
	. = ..()
	if(making_anchor) // second cast, but we are impatient
		cast_on.balloon_alert(cast_on, "якорь не готов!")
		return

	if(!making_anchor && !anchor) // first cast, setup the anchor
		var/turf/anchor_turf = get_turf(cast_on)
		making_anchor = TRUE
		if(do_after(cast_on, 5 SECONDS, cast_on, ALL)) // no checks, cant fail
			make_anchor(cast_on, anchor_turf)
			making_anchor = FALSE
			return

	if(anchor) // second cast, teleport us back
		recall(cast_on)


/datum/action/cooldown/spell/soul_anchor/proc/make_anchor(mob/user, turf/anchor_turf)
	anchor = new(anchor_turf)
	timer = addtimer(CALLBACK(src, PROC_REF(recall), user), 2 MINUTES, TIMER_STOPPABLE)


/datum/action/cooldown/spell/soul_anchor/proc/recall(mob/user)
	if(timer)
		deltimer(timer)
		timer = null

	var/turf/start_turf = get_turf(user)
	var/turf/end_turf = get_turf(anchor)
	QDEL_NULL(anchor)
	if(end_turf.z != start_turf.z)
		return
	if(is_secret_level(end_turf.z))
		return

	user.forceMove(end_turf)

	if(end_turf.z == start_turf.z)
		shadow_to_animation(start_turf, end_turf, user)

	var/datum/spell_handler/vampire/V = custom_handler
	var/datum/antagonist/vampire/vampire = user.mind.has_antag_datum(/datum/antagonist/vampire)
	var/blood_cost = V.calculate_blood_cost(vampire)
	vampire.bloodusable -= blood_cost
	StartCooldown()

/proc/shadow_to_animation(turf/start_turf, turf/end_turf, mob/user)
	var/x_difference = end_turf.x - start_turf.x
	var/y_difference = end_turf.y - start_turf.y
	var/distance = sqrt(x_difference ** 2 + y_difference ** 2) // pythag baby

	var/obj/effect/immortality_talisman/effect = new(start_turf)
	effect.dir = user.dir

	var/animation_time = distance
	animate(effect, time = animation_time, alpha = 0, pixel_x = x_difference * 32, pixel_y = y_difference * 32) //each turf is 32 pixels long
	QDEL_IN(effect, animation_time)


// an indicator that shows where the vampire will land
/obj/structure/shadow_anchor
	name = "shadow anchor"
	desc = "При взгляде на эту штуку вам становится не по себе..."
	icon = 'icons/obj/antags/cult/structures.dmi'
	icon_state = "pylon"
	alpha = 120
	color = "#545454"
	density = TRUE
	opacity = FALSE
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE


/datum/action/cooldown/spell/pointed/dark_passage
	name = "Шаг в тень"
	desc = "Вы телепортируетесь на указанную площадку."
	cooldown_time = 15 SECONDS
	button_icon_state = "dark_passage"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	sound = 'sound/effects/magic/teleport_app.ogg'
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/pointed/dark_passage/create_new_handler()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 30
	H.deduct_blood_on_cast = FALSE
	return H

/datum/action/cooldown/spell/pointed/dark_passage/cast(mob/cast_on)
	. = ..()
	var/list/targets = list()
	var/turf/target = get_turf(targets[1])
	new /obj/effect/temp_visual/vamp_mist_out(get_turf(cast_on))
	cast_on.forceMove(target)
	new /obj/effect/temp_visual/vamp_mist_in(get_turf(cast_on))


/obj/effect/temp_visual/vamp_mist_out
	duration = 2 SECONDS
	icon = 'modular_ss220/modules/vampire/icons/effects/vampire_effects.dmi'
	icon_state = "mist"


/obj/effect/temp_visual/vamp_mist_in
	duration = 1 SECONDS
	icon = 'modular_ss220/modules/vampire/icons/effects/vampire_effects.dmi'
	icon_state = "mist_reappear"


/datum/action/cooldown/spell/aoe/vamp_extinguish
	name = "Погасить"
	desc = "Вы гасите любой источник света в области вокруг себя."
	cooldown_time = 30 SECONDS
	button_icon_state = "vampire_extinguish"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN


/datum/action/cooldown/spell/aoe/vamp_extinguish/cast(mob/cast_on)
	. = ..()
	var/list/targets = list()
	for(var/turf/T in targets)
		T.set_light(0, 0, null, l_on = FALSE)
		for(var/atom/A in T.contents)
			A.set_light(0, 0, null, l_on = FALSE)


/datum/action/cooldown/spell/pointed/shadow_boxing
	name = "Бой с тенью"
	desc = "Нацельтесь на кого-нибудь, чтобы ваша тень избила его. Чтобы это сработало, вы должны находиться в пределах двух тайлов."
	cooldown_time = 30 SECONDS
	button_icon_state = "shadow_boxing"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	cast_range = 2
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN
	var/target_UID

/datum/action/cooldown/spell/pointed/shadow_boxing/create_new_handler()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 30
	H.deduct_blood_on_cast = FALSE
	return H


/datum/action/cooldown/spell/pointed/shadow_boxing/cast(mob/cast_on)
	. = ..()
	var/list/targets = list()
	var/mob/living/target = targets[1]
	target.apply_status_effect(STATUS_EFFECT_SHADOW_BOXING, cast_on)


/datum/action/cooldown/spell/eternal_darkness
	name = "Вечная тьма"
	desc = "При включении вы окутываете пространство вокруг себя темнотой и медленно понижаете температуру тела находящихся рядом гуманоидов."
	cooldown_time = 10 SECONDS
	button_icon_state = "eternal_darkness"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN
	var/shroud_power = -4

/datum/action/cooldown/spell/eternal_darkness/create_new_handler()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 5
	H.deduct_blood_on_cast = FALSE
	return H


/datum/action/cooldown/spell/eternal_darkness/cast(mob/cast_on)
	. = ..()
	var/list/targets = list()
	var/datum/antagonist/vampire/V = cast_on.mind.has_antag_datum(/datum/antagonist/vampire)
	var/mob/target = targets[1]
	if(!V.get_ability(/datum/vampire_passive/eternal_darkness))
		V.force_add_ability(/datum/vampire_passive/eternal_darkness)
		target.set_light(6, shroud_power, "#AAD84B")
	else
		for(var/datum/vampire_passive/eternal_darkness/E in V.powers)
			V.remove_ability(E)


/datum/vampire_passive/eternal_darkness
	gain_desc = "Вы окружаете себя неестественной тьмой, замораживая окружающих."


/datum/vampire_passive/eternal_darkness/New()
	..()
	START_PROCESSING(SSobj, src)


/datum/vampire_passive/eternal_darkness/Destroy(force)
	owner.set_light(0, 0, null, l_on = FALSE)
	STOP_PROCESSING(SSobj, src)
	return ..()


/datum/vampire_passive/eternal_darkness/process()
	var/datum/antagonist/vampire/V = owner.mind.has_antag_datum(/datum/antagonist/vampire)

	for(var/mob/living/L in view(6, owner))
		if(L.affects_vampire(owner))
			L.adjust_bodytemperature(-40 * TEMPERATURE_DAMAGE_COEFFICIENT)

	V.bloodusable = max(V.bloodusable - 5, 0)

	if(!V.bloodusable || owner.stat == DEAD)
		V.remove_ability(src)


/datum/vampire_passive/xray
	gain_desc = "Теперь вы можете видеть сквозь стены, если вы не заметили."

