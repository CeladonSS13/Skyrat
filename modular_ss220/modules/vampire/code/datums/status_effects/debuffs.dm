
/**
 * Vampire mark.
 */
/datum/status_effect/mark_prey
	id = "mark_prey"
	duration = 5 SECONDS
	tick_interval = 1 SECONDS
	alert_type = null
	var/mutable_appearance/marked_overlay
	var/datum/antagonist/vampire/vamp
	var/t_eyes
	var/t_hearts
	var/static/list/trash_talk = list("СКАЖИ ПРИВЕТ МОЕМУ МАЛЕНЬКОМУ ДРУГУ!!!",
									"АРРРРРГГГГГХХХ!!!",
									"МОЯ ГОЛОВА!!!",
									"ПОМОГИТЕ! МОИ РУКИ ДВИГАЮТСЯ САМИ ПО СЕБЕ!!!",
									"ЭТО ДЕЛАЕТ [pick("МОЙ БРАТ БЛИЗНЕЦ", "БОРЕР", "СИНДИКАТ", "ВОЛШЕБНИК")]!!!",
									"ОН УКРАЛ МОЙ СЛАДКИЙ РУЛЕТ!!!",
									"Я ПРОСТО ДОЖЕВАЛ ЖВАЧКУ!!!",
									"ПРИШЕЛ ДЕНЬ РАСПЛАТЫ!!!",
									"ЖИВОТНЫЕ НЕ ЧЛЕНЫ ЭКИПАЖА!!!")


/datum/status_effect/mark_prey/on_creation(mob/living/new_owner, datum/antagonist/vampire/antag_datum)
	if(antag_datum)
		vamp = antag_datum
		var/t_kidneys = vamp.get_trophies(ORGAN_SLOT_STOMACH)
		duration += t_kidneys SECONDS	// 15s. MAX
		t_eyes = vamp.get_trophies(ORGAN_SLOT_EYES)
		t_hearts = vamp.get_trophies(ORGAN_SLOT_HEART)
	return ..()


/datum/status_effect/mark_prey/Destroy()
	if(owner)
		owner.cut_overlay(marked_overlay)
	QDEL_NULL(marked_overlay)
	vamp = null
	return ..()


/datum/status_effect/mark_prey/on_apply()
	if(owner.stat == DEAD || !vamp)
		return FALSE

	owner.adjust_staggered(duration)
	to_chat(owner, span_danger("Вы чувствуете невыносимую тяжесть бытия..."))
	new /obj/effect/temp_visual/cult/sparks(get_turf(owner))

	marked_overlay = mutable_appearance('icons/effects/effects.dmi', "cult_halo1")
	marked_overlay.pixel_y = 3
	owner.add_overlay(marked_overlay)
	return ..()


/datum/status_effect/mark_prey/tick(seconds_between_ticks)
	if(owner.stat == DEAD)
		qdel(src)
		return

	if(owner.resting)	// abuses are not allowed
		owner.set_resting(FALSE, instant = TRUE)

	if(t_hearts && prob(t_hearts * 10))	// 60% on MAX
		owner.adjustFireLoss(t_hearts)	// 6 MAX

	if(!HAS_TRAIT(owner, TRAIT_INCAPACITATED) && !HAS_TRAIT(owner, TRAIT_HANDS_BLOCKED) && prob(30 + t_eyes * 7))	// 100% on MAX

		var/obj/item/gun/found_gun

		owner.is_holding_item_of_type(found_gun)

		// now we will find the target
		var/new_range = found_gun ? 7 : 1	// we need to check close range only if no guns found
		var/mob/living/target
		for(var/mob/living/check in (view(new_range, owner) - owner))
			if(!check.mind || check.stat == DEAD || isvampire(check) || isvampirethrall(check))
				continue
			target = check
			if(target)
				if(prob(30))
					owner.say(pick(trash_talk))
				break

		// if nothing is found we are the target
		if(!target)
			target = owner

		// if no gun found or target is owner we will attack ourselves in HARM intent
		if(!found_gun || target == owner)
			if(target != owner)
				owner.face_atom(target)

			if(!owner.combat_mode)
				owner.combat_mode = TRUE

			// empty hands or not a human = unarmed attack
			if(!ishuman(owner))
				owner.UnarmedAttack(target)
				return

		// here goes nothing!
		if(found_gun)
			owner.face_atom(target)
			if(!owner.combat_mode)
				owner.combat_mode = TRUE
			found_gun.process_fire(target, owner, zone_override = BODY_ZONE_HEAD)	// hell yeah! few headshots for mr. vampire!
			found_gun.attack(owner, owner)	// attack ourselves also in case gun has no ammo

/datum/status_effect/pacifism
	id = "pacifism_debuff"
	alert_type = null
	duration = 40 SECONDS


/datum/status_effect/pacifism/on_apply()
	ADD_TRAIT(owner, TRAIT_PACIFISM, id)
	return ..()


/datum/status_effect/pacifism/on_remove()
	REMOVE_TRAIT(owner, TRAIT_PACIFISM, id)
