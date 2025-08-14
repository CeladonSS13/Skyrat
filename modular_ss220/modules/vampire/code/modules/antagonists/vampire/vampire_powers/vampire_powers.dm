///This should hold all the vampire related powers
/mob/living/proc/affects_vampire(mob/user)
	//Other vampires and thralls aren't affected
	if(mind?.has_antag_datum(/datum/antagonist/vampire) || mind?.has_antag_datum(/datum/antagonist/thrall))
		return FALSE
	/// Chaplains with their nullrod can block a full power vampire, but a chaplain by themselfs or a crew with a null rod can not.
	if(can_block_magic(MAGIC_RESISTANCE_HOLY) && HAS_MIND_TRAIT(src, TRAIT_HOLY))
		return FALSE
	//Vampires who have reached their full potential can affect nearly everything
	var/datum/antagonist/vampire/V = user?.mind.has_antag_datum(/datum/antagonist/vampire)
	if(V?.get_ability(/datum/vampire_passive/full))
		return TRUE
	//Holy characters are resistant to vampire powers
	if(HAS_MIND_TRAIT(src, TRAIT_HOLY))
		return FALSE
	if(can_block_magic(MAGIC_RESISTANCE_HOLY))
		return FALSE
	return TRUE

/datum/vampire_passive
	var/gain_desc
	var/mob/living/owner = null

/datum/vampire_passive/New()
	..()
	if(!gain_desc)
		gain_desc = "You can now use [src]."

/datum/vampire_passive/Destroy(force, ...)
	owner = null
	return ..()

/datum/vampire_passive/proc/on_apply(datum/antagonist/vampire/V)
	owner.update_sight() // Life updates conditionally, so we need to update sight here in case the vamp gets new vision based on his powers. Maybe one day refactor to be more OOP and on the vampire's ability datum.
	return

/datum/action/cooldown/spell/rejuvenate
	name = "Rejuvenate"
	desc = "Use reserve blood to enliven your body, removing any incapacitating effects."
	button_icon_state = "vampire_rejuvinate"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	cooldown_time = 20 SECONDS
	spell_requirements = SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/rejuvenate/cast(mob/cast_on)
	. = ..()
	var/mob/living/U = cast_on

	U.set_body_position(STANDING_UP)
	U.set_lying_angle(0)
	U.SetAllImmobility(0)
	U.SetSleeping(0)
	U.adjustStaminaLoss(-100)
	to_chat(cast_on, "<span class='notice'>You instill your body with clean blood and remove any incapacitating effects.</span>")
	var/datum/antagonist/vampire/V = U.mind.has_antag_datum(/datum/antagonist/vampire)
	var/rejuv_bonus = V.get_rejuv_bonus()
	if(rejuv_bonus)
		INVOKE_ASYNC(src, PROC_REF(heal), cast_on, rejuv_bonus)

/datum/action/cooldown/spell/rejuvenate/proc/heal(mob/living/user, rejuv_bonus)
	for(var/i in 1 to 5)
		var/update = NONE
		update |= user.heal_overall_damage(2 * rejuv_bonus, 2 * rejuv_bonus, updating_health = FALSE)
		update |= user.adjustToxLoss(-2 * rejuv_bonus, updating_health = FALSE)
		update |= user.adjustOxyLoss(-5 * rejuv_bonus, updating_health = FALSE)
		if(update)
			user.updatehealth()
		for(var/datum/reagent/R in user.reagents.reagent_list)
			user.reagents.remove_reagent(R, 2 * rejuv_bonus)
		sleep(3.5 SECONDS)

/datum/antagonist/vampire/proc/get_rejuv_bonus()
	var/rejuv_multiplier = 0
	if(!get_ability(/datum/vampire_passive/regen))
		return rejuv_multiplier

	if(subclass?.improved_rejuv_healing)
		rejuv_multiplier = clamp((100 - owner.current.health) / 20, 1, 5) // brute and burn healing between 5 and 50
		return rejuv_multiplier

	return TRUE

/datum/action/cooldown/spell/proc/update_vampire_spell_name(mob/user = usr)
	var/datum/spell_handler/vampire/handler = custom_handler
	if(istype(handler))
		var/new_name
		if(handler.required_blood)
			new_name = "[initial(name)] ([handler.required_blood])"
		else
			new_name = "[initial(name)]"

		name = new_name
		build_button_icon()

/datum/action/cooldown/spell/specialize
	name = "Choose Specialization"
	desc = "Choose what sub-class of vampire you want to evolve into."
	cooldown_time = 2 SECONDS
	button_icon_state = "select_class"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/specialize/cast(mob/user)
	. = ..()
	ui_interact(user)

/datum/action/cooldown/spell/specialize/ui_state(mob/user)
	return GLOB.always_state

/datum/action/cooldown/spell/specialize/ui_interact(mob/user, datum/tgui/ui = null)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "VampireSpecMenu", "Specialisation Menu")
		ui.set_autoupdate(FALSE)
		ui.open()

/datum/action/cooldown/spell/specialize/ui_data(mob/user)
	var/datum/antagonist/vampire/vamp = user.mind.has_antag_datum(/datum/antagonist/vampire)
	var/list/data = list("subclasses" = vamp.subclass)
	return data

/datum/action/cooldown/spell/specialize/ui_static_data(mob/user)
	var/list/data = list()
	data["hemomancer"] = list(icon='modular_ss220/modules/vampire/icons/misc/vampire-tgui.dmi', icon_state="hemomancer")
	data["umbrae"] = list(icon='modular_ss220/modules/vampire/icons/misc/vampire-tgui.dmi',  icon_state="umbrae")
	data["gargantua"] = list(icon='modular_ss220/modules/vampire/icons/misc/vampire-tgui.dmi', icon_state="gargantua")
	data["dantalion"] = list(icon='modular_ss220/modules/vampire/icons/misc/vampire-tgui.dmi', icon_state="dantalion")
	data["bestia"] = list(icon='modular_ss220/modules/vampire/icons/misc/vampire-tgui.dmi', icon_state="bestia")

	return data

/datum/action/cooldown/spell/specialize/ui_act(action, list/params)
	if(..())
		return
	var/datum/antagonist/vampire/vamp = usr.mind.has_antag_datum(/datum/antagonist/vampire)

	if(vamp.subclass)
		vamp.upgrade_tiers -= type
		vamp.remove_ability(src)
		return

	switch(action)
		if("umbrae")
			vamp.add_subclass(SUBCLASS_UMBRAE)
			vamp.upgrade_tiers -= type
			vamp.remove_ability(src)
		if("hemomancer")
			vamp.add_subclass(SUBCLASS_HEMOMANCER)
			vamp.upgrade_tiers -= type
			vamp.remove_ability(src)
		if("gargantua")
			vamp.add_subclass(SUBCLASS_GARGANTUA)
			vamp.upgrade_tiers -= type
			vamp.remove_ability(src)
		if("dantalion")
			vamp.add_subclass(SUBCLASS_DANTALION)
			vamp.upgrade_tiers -= type
			vamp.remove_ability(src)
		if("bestia")
			vamp.add_subclass(SUBCLASS_BESTIA)
			vamp.upgrade_tiers -= type
			vamp.remove_ability(src)


/datum/antagonist/vampire/proc/add_subclass(subclass_to_add, announce = TRUE, log_choice = TRUE)
	var/datum/vampire_subclass/new_subclass = new subclass_to_add
	subclass = new_subclass
	check_vampire_upgrade(announce)
	if(log_choice)
		SSblackbox.record_feedback("nested tally", "vampire_subclasses", 1, list("[new_subclass.name]"))

/datum/action/cooldown/spell/aoe/glare
	name = "Glare"
	desc = "Your eyes flash, stunning and silencing anyone in front of you. It has lesser effects for those around you."
	button_icon_state = "vampire_glare"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	aoe_radius = 1
	max_charges = 2
	charge_replenish_time = 30 SECONDS
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/aoe/glare/cast(mob/cast_on)
	. = ..()
	var/mob/living/user = cast_on
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(istype(H.glasses, /obj/item/clothing/glasses/blindfold))
			var/obj/item/clothing/glasses/blindfold/B = H.glasses
			if(B.tint)
				to_chat(user, "<span class='warning'>You're blindfolded!</span>")
				return
	user.mob_light(LIGHT_COLOR_BLOOD_MAGIC, 3, duration = 2)
	user.visible_message("<span class='warning'>[user]'s eyes emit a blinding flash!</span>")

	for(var/mob/living/target in get_things_to_cast_on(user))
		if(!target.affects_vampire(user))
			continue

		var/deviation
		if(user.body_position == LYING_DOWN)
			deviation = DEVIATION_PARTIAL
		else
			deviation = calculate_deviation(target, user)

		if(deviation == DEVIATION_FULL)
			target.adjust_confusion(6 SECONDS)
			target.apply_damage(20, STAMINA)
		else if(deviation == DEVIATION_PARTIAL)
			target.Knockdown(5 SECONDS)
			target.adjust_confusion(6 SECONDS)
			target.apply_damage(40, STAMINA)
		else
			target.adjust_confusion(6 SECONDS)
			target.apply_damage(70, STAMINA)
			target.Knockdown(12 SECONDS)
			target.adjust_silence(8 SECONDS)
			target.flash_act(1, TRUE, TRUE)
		to_chat(target, "<span class='warning'>You are blinded by [user]'s glare.</span>")
		log_combat(user, target, "(Vampire) Glared at")

/datum/action/cooldown/spell/aoe/glare/proc/calculate_deviation(mob/victim, mob/attacker)

	// If the victim was looking at the attacker, this is the direction they'd have to be facing.
	var/attacker_to_victim = get_dir(attacker, victim)
	// The victim's dir is necessarily a cardinal value.
	var/attacker_dir = attacker.dir

	// - - -
	// - V - Attacker facing south
	// # # #
	// Attacker within 45 degrees of where the victim is facing.
	if(attacker_dir & attacker_to_victim)
		return DEVIATION_NONE
	// Are they on the same tile? This is probably the victim crawling under the vampire, and looking down shouldn't be too tough.
	if(victim.loc == attacker.loc)
		return DEVIATION_NONE
	// # # #
	// - V - Attacker facing south
	// - - -
	// Victim at 135 or more degrees of where the victim is facing.
	if(attacker_dir & REVERSE_DIR(attacker_to_victim))
		return DEVIATION_FULL
	// - - -
	// # V # Attacker facing south
	// - - -
	// Victim lateral to the victim.
	return DEVIATION_PARTIAL

#undef DEVIATION_NONE
#undef DEVIATION_PARTIAL
#undef DEVIATION_FULL

/datum/vampire_passive/regen
	gain_desc = "Your rejuvenation abilities have improved and will now heal you over time when used."

/datum/vampire_passive/vision
	gain_desc = "Your vampiric vision has improved."
	var/see_in_dark = 1
	var/vision_flags = SEE_MOBS

/datum/vampire_passive/vision/advanced
	gain_desc = "Your vampiric vision now allows you to see everything in the dark!"
	see_in_dark = 3
	vision_flags = SEE_MOBS

/datum/vampire_passive/vision/full
	gain_desc = "Your vampiric vision has reached its full strength!"
	see_in_dark = 6
	vision_flags = SEE_MOBS

/datum/vampire_passive/full
	gain_desc = "You have reached your full potential. You are no longer weak to the effects of anything holy."

/datum/action/cooldown/spell/aoe/raise_vampires
	name = "Raise Vampires"
	desc = "Summons deadly vampires from bluespace."
	cooldown_time = 10 SECONDS
	spell_requirements = SPELL_REQUIRES_HUMAN
	invocation = "none"
	invocation_type = "none"
	cooldown_reduction_per_rank = 2 SECONDS
	aoe_radius = 3
	button_icon_state = "revive_thrall"
	button_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	background_icon_state = "bg_vampire"
	sound = 'sound/effects/magic/wandodeath.ogg'
	spell_requirements = SPELL_REQUIRES_NO_ANTIMAGIC|SPELL_REQUIRES_HUMAN

/datum/action/cooldown/spell/aoe/raise_vampires/cast(list/targets, mob/user = usr)
	. = ..()
	new /obj/effect/temp_visual/cult/sparks(user.loc)
	var/turf/T = get_turf(user)
	to_chat(user, "<span class='warning'>You call out within bluespace, summoning more vampiric spirits to aid you!</span>")
	for(var/mob/living/carbon/human/H in targets)
		T.Beam(H, "sendbeam", 'icons/effects/effects.dmi', time = 30, maxdistance = 7, beam_type = /obj/effect/ebeam)
		new /obj/effect/temp_visual/cult/sparks(H.loc)
		raise_vampire(user, H)

/datum/action/cooldown/spell/aoe/raise_vampires/proc/raise_vampire(mob/M, mob/living/carbon/human/H)
	if(!istype(M) || !istype(H))
		return
	if(!H.mind)
		H.visible_message("[H] looks to be too stupid to understand what is going on.")
		return
	if(HAS_TRAIT(H, TRAIT_NOBLOOD) || !H.blood_volume)
		H.visible_message("[H] looks unfazed!")
		return
	if(H.mind.has_antag_datum(/datum/antagonist/vampire) || H.mind.special_role == ROLE_VAMPIRE || H.mind.special_role == ROLE_VAMPIRE_THRALL)
		H.visible_message("<span class='notice'>[H] looks refreshed!</span>")
		H.adjustBruteLoss(-60)
		H.adjustFireLoss(-60)
		if(prob(25))
			for(var/datum/wound/iter_wound as anything in H.all_wounds)
				iter_wound.remove_wound()

		return
	if(H.stat != DEAD)
		if(H.IsParalyzed())
			H.visible_message(span_warning("[H] looks to be in pain!"))
			H.adjustOrganLoss(ORGAN_SLOT_BRAIN, 60)
		else
			H.visible_message(span_warning("[H] looks to be stunned by the energy!"))
			H.Paralyze(40 SECONDS)
		return
	for(var/obj/item/implant/mindshield/L in H)
		if(L)
			qdel(L)
	for(var/obj/item/implant/uplink/T in H)
		if(T)
			qdel(T)
	H.visible_message(span_warning("[H] gets an eerie red glow in their eyes!"))

	var/datum/objective/protect/protect_objective = new
	protect_objective.owner = H.mind
	protect_objective.target = M.mind
	protect_objective.explanation_text = "Защитите [M.real_name]."
	H.mind.objectives += protect_objective
	log_attack("Vampire-sired", list(M, H))
	H.mind.make_vampire()
	H.revive()
	H.Paralyze(40 SECONDS)
