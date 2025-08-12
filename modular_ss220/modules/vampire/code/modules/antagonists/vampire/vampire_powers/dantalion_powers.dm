/datum/vampire_passive/increment_thrall_cap/on_apply(datum/antagonist/vampire/V)
	V.subclass.thrall_cap++
	gain_desc = "Теперь вы можете подчинить себе ещё одного гуманоида, вплоть до <b>[V.subclass.thrall_cap]</b> ."


/datum/vampire_passive/increment_thrall_cap/two


/datum/vampire_passive/increment_thrall_cap/three


/datum/action/cooldown/spell/pointed/enthrall
	name = "Порабощение"
	desc = "Вы используете значительную часть своей силы, чтобы поработить разум другого гуманоида."
	button_icon_state = "vampire_enthrall"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	cast_range = 1
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/pointed/enthrall/create_new_handler()
	. = ..()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 150
	H.deduct_blood_on_cast = FALSE
	return H

/datum/action/cooldown/spell/pointed/enthrall/cast(mob/living/cast_on)
	. = ..()
	var/list/targets = list()
	var/datum/antagonist/vampire/vampire = cast_on.mind.has_antag_datum(/datum/antagonist/vampire)
	var/mob/living/target = targets[1]
	cast_on.visible_message(span_warning("[cast_on] кусает [target] за шею!"), \
						span_warning("Вы кусаете [target] за шею и впускаете поток силы."))
	to_chat(target, span_warning("Вы чувствуете, как в ваш разум проникают потоки нечистой силы."))
	if(do_after(cast_on, 15 SECONDS, target, NONE))
		if(can_enthrall(cast_on, target))
			handle_enthrall(cast_on, target)
			var/datum/spell_handler/vampire/V = custom_handler
			var/blood_cost = V.calculate_blood_cost(vampire)
			vampire.bloodusable -= blood_cost //we take the blood after enthralling, not before
	else
		to_chat(cast_on, span_warning("Вы или ваша цель сдвинулись с места."))
		return SPELL_CANCEL_CAST



/datum/action/cooldown/spell/pointed/enthrall/proc/can_enthrall(mob/living/user, mob/living/carbon/C)
	. = FALSE
	if(!C)
		CRASH("target was null while trying to vampire enthrall, attacker is [user] [user.key] \ref[user]")

	if(!ishuman(C))
		to_chat(user, span_warning("Вы можете поработить только разумных гуманоидов!"))
		return

	if(!C.mind)
		to_chat(user, span_warning("Разум [C.name] не предназначен для порабощения."))
		return

	var/datum/antagonist/vampire/V = user.mind.has_antag_datum(/datum/antagonist/vampire)
	if(V.subclass.thrall_cap <= length(V.thralls))
		to_chat(user, span_warning("У вас не хватит сил, чтобы поработить ещё больше гуманоидов!"))
		return

	if(HAS_TRAIT(C, TRAIT_MINDSHIELD) || isvampire(C) || isvampirethrall(C))
		C.visible_message(span_warning("Похоже, [C] сопротивляется захвату!"), \
						span_notice("Вы чувствуете знакомое ощущение в черепе, которое быстро проходит."))
		return

	if(C.mind.holy_role >= HOLY_ROLE_DEACON)
		C.visible_message(span_warning("Похоже, [C] сопротивляется захвату!"))
		return

	return TRUE


/datum/action/cooldown/spell/pointed/enthrall/proc/handle_enthrall(mob/living/user, mob/living/carbon/human/H)
	if(!istype(H))
		return FALSE

	H.mind.add_antag_datum(/datum/antagonist/thrall)
	if(is_banned_from(H.ckey, ROLE_VAMPIRE) || is_banned_from(H.ckey, BAN_ANTAGONIST))
		var/mob/chosen_one = SSpolling.poll_ghosts_for_target("Do you want to play as [span_notice(H.real_name)]?", check_jobban = ROLE_VAMPIRE, role = ROLE_VAMPIRE, poll_time = 5 SECONDS, checked_target = H, alert_pic = H, role_name_text = "vampire thrall")
		H.ghostize(FALSE)
		H.PossessByPlayer(chosen_one.ckey)
	H.Stun(4 SECONDS)


/datum/action/cooldown/spell/thrall_commune
	name = "Телепатическая связь"
	desc = "Общайтесь со своими рабами с помощью блюспейс-телепатии."
	button_icon_state = "vamp_communication"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	cooldown_time = 2 SECONDS
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN


/datum/action/cooldown/spell/thrall_commune/create_new_handler() //so thralls can use it
	return


/datum/action/cooldown/spell/thrall_commune/cast(cast_on)
	. = ..()
	var/mob/living/user = cast_on
	var/input = tgui_input_text(cast_on, "Введите сообщение для передачи другим рабам", "Сообщение рабам")
	if(!input)
		return SPELL_CANCEL_CAST

	// if admins give this to a non vampire/thrall it is not my problem
	var/is_thrall = isvampirethrall(user)
	var/title = is_thrall ? "(Раб Вампира) [user.real_name]" : "<span class='dantalion'><font size='3'>(Мастер Вампир) [user.real_name]</font></span>"
	var/message = is_thrall ? "<span class='dantalion'>[input]</span>" : "<span class='dantalion'><font size='3'><b>[input]</b></font></span>"
	var/datum/antagonist/vampire/V = user.mind.has_antag_datum(/datum/antagonist/vampire)


	for(var/mob/listener in V.thralls)
		to_chat(listener, "<i><span class='game say'>Рабская телепатия, <span class='name'>[title]</span> телепатезирует, [message]</span><i>")

	for(var/mob/ghost in GLOB.dead_mob_list)
		var/link = FOLLOW_LINK(ghost, cast_on)
		to_chat(ghost, "<i><span class='game say'>Рабская телепатия, <span class='name'>[title]</span> ([link]) телепатезирует, [message]</span><i>")

	log_say("(DANTALION) [input]", cast_on)


/datum/action/cooldown/spell/pointed/pacify
	name = "Умиротворение"
	desc = "Временно умиротворяет цель, делая её неспособной причинить вред."
	button_icon_state = "pacify"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	cooldown_time = 10 SECONDS
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN


/datum/action/cooldown/spell/pointed/pacify/create_new_handler()
	. = ..()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 10
	return H


/datum/action/cooldown/spell/pointed/pacify/cast(cast_on)
	. = ..()
	var/list/targets = list()
	for(var/mob/living/carbon/human/H as anything in targets)
		to_chat(H, span_notice("Вы вдруг почувствовали себя очень спокойно..."))
		SEND_SOUND(H, 'sound/effects/hallucinations/i_see_you1.ogg')
		H.apply_status_effect(STATUS_EFFECT_PACIFIED)


/datum/action/cooldown/spell/pointed/switch_places
	name = "Подпространственный обмен"
	desc = "Поменяйтесь местами с целью. Также замедляет жертву и вызывает у нее галлюцинации."
	button_icon_state = "subspace_swap"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	cooldown_time = 5 SECONDS
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/pointed/switch_places/create_new_handler()
	. = ..()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 15
	return H

/datum/action/cooldown/spell/pointed/switch_places/cast(cast_on)
	. = ..()
	var/mob/living/user = owner
	var/mob/living/target = cast_on
	var/turf/user_turf = get_turf(cast_on)
	var/turf/target_turf = get_turf(target)
	target.forceMove(user_turf)
	user.forceMove(target_turf)

	if(target.affects_vampire(cast_on))
		target.adjust_staggered(4 SECONDS)
		SEND_SOUND(target, 'sound/effects/hallucinations/behind_you1.ogg')
		target.flash_act(2, TRUE, affect_silicon = TRUE) // flash to give them a second to lose track of who is who
		target.cause_hallucination( \
			get_random_valid_hallucination_subtype(/datum/hallucination/delusion/preset), \
			src, \
			duration = 15 SECONDS, \
			affects_us = FALSE, \
			affects_others = TRUE, \
			skip_nearby = FALSE, \
		)


/datum/action/cooldown/spell/decoy
	name = "Приманка"
	desc = "На короткое время станьте невидимым и создайте иллюзию для обмана, чтобы провести свою жертву."
	button_icon_state = "decoy"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	cooldown_time = 20 SECONDS
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN
	var/duration = 6 SECONDS

/datum/action/cooldown/spell/decoy/create_new_handler()
	. = ..()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 20
	return H


/datum/action/cooldown/spell/decoy/cast(cast_on)
	. = ..()
	var/mob/living/user = cast_on
	var/user_turf = get_turf(user)
	var/mob/living/simple_animal/hostile/illusion/escape/E = new(user_turf)
	E.Copy_Parent(user, duration, 20)
	E.GiveTarget(user) //so it starts running right away
	E.Goto(user, E.move_to_delay, E.minimum_distance)
	user.make_invisible()
	playsound(user_turf, 'sound/effects/hallucinations/look_up1.ogg', 50, TRUE)
	addtimer(CALLBACK(user, TYPE_PROC_REF(/mob/living, reset_visibility)), duration)


/datum/action/cooldown/spell/aoe/rally_thralls
	name = "Сплотить рабов"
	desc = "Снимает все обездвиживающие эффекты с находящихся рядом с вами рабов."
	button_icon_state = "thralls_up"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	cooldown_time = 30 SECONDS
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/aoe/rally_thralls/create_new_handler()
	. = ..()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 40
	return H

/datum/action/cooldown/spell/aoe/rally_thralls/cast(cast_on)
	. = ..()
	for(var/mob/living/carbon/human/H as anything in get_things_to_cast_on(cast_on))
		var/image/I = image('modular_ss220/modules/vampire/icons/effects/vampire_effects.dmi', "rallyoverlay", layer = EFFECTS_LAYER)
		playsound(H, 'sound/effects/magic/staff_healing.ogg', 50)
		H.SetAllImmobility(0)
		H.add_overlay(I)
		addtimer(CALLBACK(H, TYPE_PROC_REF(/atom, cut_overlay), I), 6 SECONDS) // this makes it obvious who your thralls are for a while.


/datum/action/cooldown/spell/share_damage
	name = "Кровавые узы"
	desc = "Создает сеть между вами и ближайшими рабами, которая равномерно распределяет весь получаемый урон."
	button_icon_state = "blood_bond"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/share_damage/create_new_handler()
	. = ..()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 5
	return H

/datum/action/cooldown/spell/share_damage/cast(cast_on)
	. = ..()
	var/mob/living/user = cast_on
	var/datum/status_effect/thrall_net/T = user.has_status_effect(STATUS_EFFECT_THRALL_NET)
	if(!T)
		user.apply_status_effect(STATUS_EFFECT_THRALL_NET, user.mind.has_antag_datum(/datum/antagonist/vampire))
		return
	qdel(T)


/datum/action/cooldown/spell/aoe/hysteria
	name = "Массовая истерия"
	desc = "Накладывает мощную иллюзию, заставляющую всех, кто находится поблизости, воспринимать окружающих как случайных животных после кратковременного ослепления. Также замедляет пострадавших."
	button_icon_state = "hysteria"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	cooldown_time = 60 SECONDS
	aoe_radius = 8
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/aoe/hysteria/create_new_handler()
	. = ..()
	var/datum/spell_handler/vampire/H = new
	H.required_blood = 40
	return H


/datum/action/cooldown/spell/aoe/hysteria/cast(cast_on)
	. = ..()
	for(var/mob/living/carbon/human/target in get_things_to_cast_on(cast_on))
		if(!target.affects_vampire(cast_on))
			continue

		SEND_SOUND(target, 'sound/effects/hallucinations/over_here1.ogg')
		target.adjust_staggered(4 SECONDS)
		target.flash_act(2, TRUE) // flash to give them a second to lose track of who is who
		target.cause_hallucination( \
			get_random_valid_hallucination_subtype(/datum/hallucination/delusion/preset), \
			src, \
			duration = 15 SECONDS, \
			affects_us = FALSE, \
			affects_others = TRUE, \
			skip_nearby = FALSE, \
		)

