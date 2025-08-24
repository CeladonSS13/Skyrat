/datum/antagonist/vampire
	name = "\improper Vampire"
	roundend_category = "Vampires"
	antagpanel_category = "Vampire"
	ui_name = "AntagInfoVampire"
	antag_moodlet = /datum/mood_event/focused
	job_rank = ROLE_VAMPIRE
	antag_hud_name = "vampire"
	hijack_speed = 0.5
	hardcore_random_bonus = TRUE
	stinger_sound = 'sound/music/antag/heretic/heretic_gain.ogg'
	/// Total blood drained by vampire over round.
	var/bloodtotal = 0
	/// Current amount of blood.
	var/bloodusable = 0
	/// What vampire subclass the vampire is.
	var/datum/vampire_subclass/subclass
	/// Handles the vampire cloak toggle.
	var/iscloaking = FALSE
	/// List of available powers and passives.
	var/list/powers = list()
	/// Who the vampire is draining of blood.
	var/mob/living/carbon/human/draining
	/// Nullrods and holywater make their abilities cost more.
	var/nullified = 0
	/// Time between each suck iteration.
	var/suck_rate = 5 SECONDS
	/// Does garlic affect vampire?
	var/is_garlic_affected = FALSE
	/// Does a vampire turn to dust after dying from space?
	var/dust_in_space = FALSE
	/// List of powers that all vampires unlock and at what blood level they unlock them, the rest of their powers are found in the vampire_subclass datum.
	var/list/upgrade_tiers = list(
		/datum/action/cooldown/spell/aoe/glare = 0,
		/datum/action/cooldown/spell/rejuvenate = 0,
		/datum/vampire_passive/vision = 100,
		/datum/action/cooldown/spell/specialize = 150,
		/datum/vampire_passive/regen = 100,
	)

	/// List of the peoples UIDs that we have drained, and how much blood from each one.
	var/list/drained_humans = list()
	/// List of the peoples UIDs that we have dissected, and how many times for each one.
	var/list/dissected_humans = list()
	/// Associated list of all damage modifiers human vampire has.
	var/list/damage_modifiers = list(
		BRUTE = 1,
		BURN = 1,
		TOX = 1,
		OXY = 1,
		CLONE = 1,
		BRAIN = 1,
		STAMINA = 1,
	)
	var/list/datum/antagonist/thrall/thralls = list()

/datum/antagonist/vampire/Destroy(force)
	draining = null
	//QDEL_NULL(subclass)
	return ..()

/datum/antagonist/vampire/greet()
	var/list/messages = list()
	SEND_SOUND(owner.current, sound('modular_ss220/modules/vampire/sound/ambience/vampalert.ogg'))
	messages.Add(span_danger("Вы — вампир!<br>"))
	messages.Add("Чтобы укусить кого-то, нацельтесь на голову, выберите намерение <b>вреда (4)</b> и ударьте пустой рукой. Пейте кровь, чтобы получать новые силы. \
		Вы уязвимы перед святостью, огнём и звёздным светом. Не выходите в космос, избегайте священника, церкви и, особенно, святой воды.")
	return messages

/datum/antagonist/vampire/farewell()
	if(issilicon(owner.current))
		to_chat(owner.current, span_userdanger("Вы превратились в робота! Вы чувствуете как вампирские силы исчезают…"))
	else
		to_chat(owner.current, span_userdanger("Ваш разум очищен! Вы больше не вампир."))

/datum/antagonist/vampire/on_gain()
	. = ..()
	forge_objectives()

/datum/antagonist/vampire/forge_objectives()
	. = ..()

	var/objective_count = 0

	var/objective_limit = CONFIG_GET(number/traitor_objectives_amount)

	// for(in...to) loops iterate inclusively, so to reach objective_limit we need to loop to objective_limit - 1
	// This does not give them 1 fewer objectives than intended.
	for(var/i in objective_count to objective_limit - 1)
		objectives += forge_single_generic_objective()

/datum/antagonist/vampire/proc/forge_single_generic_objective()
	if(prob(KILL_PROB))
		var/list/active_ais = active_ais(skip_syndicate = TRUE)
		if(active_ais.len && prob(DESTROY_AI_PROB(GLOB.joined_player_list.len)))
			var/datum/objective/destroy/destroy_objective = new()
			destroy_objective.owner = owner
			destroy_objective.find_target()
			return destroy_objective

		if(prob(MAROON_PROB))
			var/datum/objective/maroon/maroon_objective = new()
			maroon_objective.owner = owner
			maroon_objective.find_target()
			return maroon_objective

		var/datum/objective/assassinate/kill_objective = new()
		kill_objective.owner = owner
		kill_objective.find_target()
		return kill_objective

	var/datum/objective/steal/steal_objective = new()
	steal_objective.owner = owner
	steal_objective.find_target()
	return steal_objective

/datum/antagonist/vampire/on_body_transfer(mob/living/old_body, mob/living/new_body)
	. = ..()
	if(isvampireanimal(new_body))
		remove_innate_effects(old_body, transformation = TRUE)
		apply_innate_effects(new_body, transformation = TRUE)
	else
		remove_innate_effects(old_body)
		apply_innate_effects(new_body)

/datum/antagonist/vampire/apply_innate_effects(mob/living/mob_override, transformation = FALSE)
	var/mob/living/user = owner.current

	if(!transformation)
		check_vampire_upgrade(announce = FALSE)
		user.faction |= ROLE_VAMPIRE
		// user.dna?.species?.hunger_type = "vampire"
		// user.dna?.species?.hunger_icon = 'modular_ss220/modules/vampire/icons/mob/vampire_hunger.dmi'

/datum/antagonist/vampire/remove_innate_effects(mob/living/mob_override, transformation = FALSE)
	var/mob/living/user = owner.current

	if(!mob_override)	// mob override means body transfer
		remove_all_powers()

	if(!transformation)
		user.faction -= ROLE_VAMPIRE

		var/datum/hud/hud = user.hud_used
		if(hud?.vampire_blood_display)
			hud.remove_vampire_hud()

	REMOVE_TRAITS_IN(user, VAMPIRE_TRAIT)

/**
 * Remove the vampire's current subclass and add the specified one.
 *
 * Arguments:
 * * new_subclass_type - a [/datum/vampire_subclass] typepath
 */
/datum/antagonist/vampire/proc/change_subclass(new_subclass_type)
	if(isnull(new_subclass_type))
		return

	clear_subclass(FALSE)
	add_subclass(new_subclass_type, log_choice = FALSE)


/**
 * Remove and delete the vampire's current subclass and all associated abilities.
 *
 * Arguments:
 * * give_specialize_power - if the [specialize][/obj/effect/proc_holder/spell/vampire/self/specialize] power should be given back or not
 */
/datum/antagonist/vampire/proc/clear_subclass(give_specialize_power = TRUE)
	if(give_specialize_power)
		// Choosing a subclass in the first place removes this from `upgrade_tiers`, so add it back if needed.
		upgrade_tiers[/datum/action/cooldown/spell/specialize] = 150

	suck_rate = initial(suck_rate)
	remove_all_powers()
	QDEL_NULL(subclass)
	check_vampire_upgrade()


/datum/antagonist/vampire/proc/adjust_blood(mob/living/carbon/human/user, blood_amount = 0)
	if(!count_drain(user, blood_amount))
		return

	bloodtotal += blood_amount
	bloodusable += blood_amount
	check_vampire_upgrade(TRUE)

	for(var/datum/action/cooldown/spell/power in powers)
		if(power)
			power.build_button_icon()

/datum/antagonist/vampire/proc/count_drain(mob/living/carbon/human/user, blood_amount = 0)
	if(!user)
		return TRUE


	var/unique_suck_id = owner?.UID()

	if(!unique_suck_id)
		return TRUE

	if(!(unique_suck_id in drained_humans))
		drained_humans[unique_suck_id] = 0

	if(drained_humans[unique_suck_id] >= BLOOD_DRAIN_LIMIT)
		return FALSE

	drained_humans[unique_suck_id] += blood_amount
	return TRUE

#define BLOOD_GAINED_MODIFIER 0.5

#define CLOSING_IN_TIME_MOD 0.2
#define GRABBING_TIME_MOD 0.3
#define BITE_TIME_MOD 0.15

#define STATE_CLOSING_IN 1
#define STATE_GRABBING 2
#define STATE_BITE 3
#define STATE_SUCKING 4

/datum/antagonist/vampire/proc/handle_bloodsucking(mob/living/carbon/human/target, suck_rate_override)
	draining = target
	var/mob/living/carbon/human/cur = owner.current
	var/unique_suck_id = owner?.UID()
	var/blood = 0
	var/blood_volume_warning = 9999 //Blood volume threshold for warnings
	var/cycle_counter = 0
	var/time_per_action
	var/vampire_dir = get_dir(cur, target)

	var/old_bloodusable = 0 //used to see if we increased our blood usable

	var/suck_rate_final
	if(suck_rate_override)
		suck_rate_final = suck_rate_override
	else
		suck_rate_final = suck_rate

	if(cur.is_muzzled())
		to_chat(cur, span_warning("[cur.wear_mask] мешает вам укусить [target]!"))
		draining = null
		return

	log_attack("[cur] vampirebit [target] & is draining their blood.")

	if(!iscarbon(cur))
		target.pulledby = null
	else
		target.pulledby = cur

	var/is_target_grabbed = FALSE
	if(target.pulledby == cur && cur.grab_state > GRAB_PASSIVE)
		is_target_grabbed = TRUE

	if(!is_target_grabbed || vampire_dir == NORTHEAST || vampire_dir == NORTHWEST || \
		vampire_dir ==  SOUTHEAST || vampire_dir ==  SOUTHWEST)
		//first, the vampire gets closer to the victim, its quick
		time_per_action = suck_rate_final*CLOSING_IN_TIME_MOD
	else
		//skip getting_closer_animation(), if we are already close enough
		cycle_counter = STATE_GRABBING
		time_per_action = suck_rate_final*BITE_TIME_MOD

	while(do_after(cur, time_per_action, target, NONE, interaction_key = DOAFTER_SOURCE_VAMPIRE_SUCKING, max_interact_count = 1))
		cycle_counter++
		cur.face_atom(target)
		old_bloodusable = bloodusable
		switch(cycle_counter)
			if(STATE_CLOSING_IN)
				cur.visible_message(span_danger("[cur] приближается к [target]"), \
					span_danger("Вы приближаетесь к [target]"))
				getting_closer_animation(target, STATE_CLOSING_IN, vampire_dir)
				time_per_action = suck_rate_final*GRABBING_TIME_MOD
				continue

			if(STATE_GRABBING)
				cur.visible_message(span_danger("[cur] грубо хватает шею [target]"), \
					span_danger("Вы грубо хватаете шею [target]"))
				getting_closer_animation(target, STATE_GRABBING, vampire_dir)
				time_per_action = suck_rate_final*BITE_TIME_MOD
				continue

			if(STATE_BITE)
				cur.visible_message(span_danger("[cur] вонзает клыки!"), \
					span_danger("Вы вонзаете клыки в шею [target] и начинаете высасывать кровь."), \
					span_italics("Вы слышите тихий звук прокола и влажные хлюпающие звуки."))
				bite_animation(target, vampire_dir)
				time_per_action = suck_rate_final
				continue

		if(unique_suck_id && (unique_suck_id in drained_humans))
			if(drained_humans[unique_suck_id] >= BLOOD_DRAIN_LIMIT)
				to_chat(cur, span_warning("Вы поглотили всю жизненную эссенцию [target], дальнейшее питьё крови будет только утолять голод!"))
				target.blood_volume -= 25
				cur.set_nutrition(min(NUTRITION_LEVEL_WELL_FED, cur.nutrition + 5))
				continue


		if(target.stat < DEAD)
			if(target.mind) //Requires ckey regardless if monkey or humanoid, or the body has been ghosted before it died
				blood = min(20, target.blood_volume)
				adjust_blood(target, blood * BLOOD_GAINED_MODIFIER)
				cur.adjustBruteLoss(-3)
				cur.adjustFireLoss(-3)
				cur.adjustOxyLoss(-10)
				cur.adjustToxLoss(-2)
				cur.adjustOrganLoss(ORGAN_SLOT_BRAIN, -1)

				if(bloodtotal >= REQ_BLOOD_FOR_SUBCLASS_ACT)
					subclass?.on_blood_sucking(cur)

				to_chat(cur, span_boldnotice("Вы накопили [bloodtotal] единиц крови[bloodusable != old_bloodusable ? ", и теперь вам доступно [bloodusable] единиц крови" : ""]."))

		target.blood_volume -= 25

		//Blood level warnings (Code 'borrowed' from Fulp)
		if(target.blood_volume)
			if(target.blood_volume <= BLOOD_VOLUME_BAD && blood_volume_warning > BLOOD_VOLUME_BAD)
				to_chat(cur, span_danger("У вашей жертвы остаётся опасно мало крови!"))

			else if(target.blood_volume <= BLOOD_VOLUME_OKAY && blood_volume_warning > BLOOD_VOLUME_OKAY)
				to_chat(cur, span_warning("У вашей жертвы остаётся тревожно мало крови!"))

			blood_volume_warning = target.blood_volume //Set to blood volume, so that you only get the message once

		else
			to_chat(cur, span_warning("Вы выпили свою жертву досуха!"))
			break

		if(!target.mind)//Only runs if there is no ckey and the body has not being ghosted while alive
			to_chat(cur, span_boldnotice("Питьё крови у [target] насыщает вас, но доступной крови от этого вы не получаете."))
			cur.set_nutrition(min(NUTRITION_LEVEL_WELL_FED, cur.nutrition + 5))

		else
			cur.set_nutrition(min(NUTRITION_LEVEL_WELL_FED, cur.nutrition + (blood / 2)))

	stop_sucking()


/datum/antagonist/vampire/proc/getting_closer_animation(mob/living/carbon/human/target, stage, vampire_dir)
	var/shift = 0
	owner.current.layer = MOB_LAYER
	switch(stage)
		if(STATE_CLOSING_IN)
			shift = 8
		if(STATE_GRABBING)
			shift = 20

	var/pixel_x_diff = 0
	var/pixel_y_diff = 0

	if(vampire_dir & NORTH)
		pixel_y_diff = shift
	else if(vampire_dir & SOUTH)
		pixel_y_diff = -shift
		//If vampire is standing north of the target and facing south, the target should be displayed on top of the vampire
		owner.current.layer = 3.9

	if(vampire_dir & EAST)
		pixel_x_diff = shift
	else if(vampire_dir & WEST)
		pixel_x_diff = -shift

	animate(owner.current, pixel_x = pixel_x_diff, pixel_y = pixel_y_diff, 5, 1, LINEAR_EASING)

/datum/antagonist/vampire/proc/bite_animation(mob/living/carbon/human/target, vampire_dir)
	var/pixel_x_diff = 0
	var/pixel_y_diff = 0

	if(vampire_dir & NORTH)
		pixel_y_diff = 8
	else if(vampire_dir & SOUTH)
		pixel_y_diff = -8

	if(vampire_dir & EAST)
		pixel_x_diff = 8
	else if(vampire_dir & WEST)
		pixel_x_diff = -8
	animate(owner.current, pixel_x = owner.current.pixel_x + pixel_x_diff, pixel_y = owner.current.pixel_y + pixel_y_diff, time = 0.5)
	animate(pixel_x = owner.current.pixel_x - pixel_x_diff, pixel_y = owner.current.pixel_y - pixel_y_diff, time = 7)
	owner.current.do_item_attack_animation(target, ATTACK_EFFECT_BITE)


/datum/antagonist/vampire/proc/stop_sucking()
	if(draining)
		to_chat(owner.current, span_notice("Вы прекращаете пить кровь [draining.name]."))
		draining = null
		owner.current.pixel_x = owner.current.base_pixel_x
		owner.current.pixel_y = owner.current.base_pixel_y
		owner.current.layer = initial(owner.current.layer)
		owner.current.update_offsets(TRUE)

#undef BLOOD_GAINED_MODIFIER
#undef CLOSING_IN_TIME_MOD
#undef GRABBING_TIME_MOD
#undef BITE_TIME_MOD
#undef STATE_CLOSING_IN
#undef STATE_GRABBING
#undef STATE_BITE
#undef STATE_SUCKING

/datum/antagonist/vampire/proc/force_add_ability(path)
	var/datum/action/cooldown/spell/spell = new path(owner)
	if(istype(spell, /datum/action/cooldown/spell))
		spell.Grant(owner.current)
		if(istype(spell, /datum/action/cooldown/spell) && subclass)
			var/datum/action/cooldown/spell/v_spell = spell
			v_spell.on_trophie_update(src, force = TRUE)
		if(istype(spell, /datum/action/cooldown/spell/dissect_info) && subclass)
			subclass.spell_TGUI = spell

	else if(istype(spell, /datum/vampire_passive))
		var/datum/vampire_passive/passive = spell
		passive.owner = owner.current
		passive.on_apply(src)
	powers += spell
	owner.current.update_sight() // Life updates conditionally, so we need to update sight here in case the vamp gets new vision based on his powers. Maybe one day refactor to be more OOP and on the vampire's ability datum.
	return spell


/datum/antagonist/vampire/proc/get_ability(path)
	for(var/datum/power as anything in powers)
		if(power.type == path)
			return power
	return null


/datum/antagonist/vampire/proc/add_ability(path)
	if(!get_ability(path))
		force_add_ability(path)


/datum/antagonist/vampire/proc/remove_ability(datum/action/cooldown/spell/ability)
	if(ability && (ability in powers))
		powers -= ability
		if(istype(ability, /datum/action/cooldown/spell/dissect_info) && subclass)
			subclass.spell_TGUI = null
		if(istype(ability, /datum/action/cooldown/spell))
			ability.Remove(owner.current)
		else if(istype(ability, /datum/vampire_passive))
			qdel(ability)
		owner.current.update_sight() // Life updates conditionally, so we need to update sight here in case the vamp loses his vision based powers. Maybe one day refactor to be more OOP and on the vampire's ability datum.


/**
 * Removes all of the vampire's current powers.
 */
/datum/antagonist/vampire/proc/remove_all_powers()
	for(var/power in powers)
		remove_ability(power)


/datum/antagonist/vampire/proc/check_vampire_upgrade(announce = TRUE)
	var/list/old_powers = powers.Copy()

	for(var/ptype in upgrade_tiers)
		var/level = upgrade_tiers[ptype]
		if(bloodtotal >= level)
			add_ability(ptype)

	if(!subclass)
		if(announce)
			announce_new_power(old_powers)
		return

	subclass.add_subclass_ability(src)

	if(subclass.spell_TGUI)
		SStgui.update_uis(subclass.spell_TGUI, TRUE)

	check_full_power_upgrade()
	check_trophies_passives()

	if(announce)
		announce_new_power(old_powers)


/datum/antagonist/vampire/proc/check_full_power_upgrade()
	if(subclass.full_power_override || (length(drained_humans) >= FULLPOWER_DRAINED_REQUIREMENT && bloodtotal >= FULLPOWER_BLOODTOTAL_REQUIREMENT))
		subclass.add_full_power_abilities(src)


/datum/antagonist/vampire/proc/announce_new_power(list/old_powers)
	for(var/p in powers)
		if(!(p in old_powers))
			if(istype(p, /datum/vampire_passive))
				var/datum/vampire_passive/power = p
				to_chat(owner.current, span_boldnotice("[power.gain_desc]"))


/datum/antagonist/vampire/proc/check_sun()
	var/distance = 20
	var/target_x = round(sin(SSsun.azimuth), 0.01)
	var/target_y = round(cos(SSsun.azimuth), 0.01)
	var/x_hit = owner.current.x
	var/y_hit = owner.current.y
	var/turf/hit

	for(var/run in 1 to distance)
		x_hit += target_x
		y_hit += target_y
		hit = locate(round(x_hit, 1), round(y_hit, 1), owner.current.z)

		if(!hit)
			return

		if(hit.x == 1 || hit.x == world.maxx || hit.y == 1 || hit.y == world.maxy)
			break

		if(hit.density)
			return

	if(bloodusable >= 10)
		to_chat(owner.current, span_warning("The starlight saps your strength, you should get out of the starlight!"))
		bloodusable -= 10
		vamp_burn(10)
	else
		to_chat(owner.current, span_userdanger("Your body is turning to ash, get out of the starlight NOW!"))
		owner.current.adjustFireLoss(10)
		vamp_burn(85)
		if(owner.current.fireloss >= 100 && dust_in_space)
			owner.current.dust()

/datum/antagonist/vampire/proc/vamp_burn(burn_chance)

	if(isvampireanimal(owner.current))
		var/half_health = round(owner.current.maxHealth / 2)

		if(prob(burn_chance) && owner.current.health >= half_health)
			to_chat(owner.current, span_warning("Вы чувствуете нестерпимый жар!"))
			owner.current.adjustFireLoss(3)

		else if(owner.current.health < half_health)
			to_chat(owner.current, span_warning("Вы плавитесь!"))
			owner.current.adjustFireLoss(8)

		return

	if(prob(burn_chance) && owner.current.health >= 50)
		switch(owner.current.health)
			if(75 to 100)
				to_chat(owner.current, span_warning("Ваша кожа дымится…"))
			if(50 to 75)
				to_chat(owner.current, span_warning("Ваша кожа шипит!"))
		owner.current.adjustFireLoss(3)

	else if(owner.current.health < 50)
		if(!owner.current.on_fire)
			to_chat(owner.current, span_danger("Ваша кожа загорается!"))
			owner.current.emote("scream")
		else
			to_chat(owner.current, span_danger("Вы продолжаете гореть!"))
		owner.current.adjust_fire_stacks(5)
		owner.current.ignite_mob()


/datum/antagonist/vampire/proc/handle_vampire()
	draw_HUD()

	handle_vampire_cloak()
	if(isspaceturf(get_turf(owner.current)))
		check_sun()


	var/owner_area = get_area(owner.current)
	if(is_type_in_typecache(owner_area, GLOB.holy_areas) && !get_ability(/datum/vampire_passive/full) && bloodtotal > 0)
		vamp_burn(7)
		nullified = max(0, nullified - 2)


/datum/antagonist/vampire/proc/draw_HUD()
	var/datum/hud/hud = owner?.current?.hud_used
	if(!hud)
		return

	if(!hud.vampire_blood_display)
		hud.vampire_blood_display = new /atom/movable/screen()
		hud.vampire_blood_display.name = "Доступная кровь"
		hud.vampire_blood_display.icon_state = "blood_display"
		hud.vampire_blood_display.screen_loc = "WEST:6,CENTER-1:15"
		hud.static_inventory += hud.vampire_blood_display
		hud.show_hud(hud.hud_version)
	hud.vampire_blood_display.maptext = "<div align='center' valign='middle' style='position:relative; top:0px; left:6px'><font face='Small Fonts' color='#ce0202'>[bloodusable]</font></div>"


/datum/antagonist/vampire/proc/handle_vampire_cloak()
	if(!owner || !owner.current)
		return

	var/mob/living/M = owner.current

	if(!ishuman(M))
		animate(M, time = 5, alpha = 255)
		return

	var/turf/owner_turf = get_turf(M)
	if(!istype(owner_turf))
		return

	var/light_available = owner_turf.get_lumcount() * 10

	if(!iscloaking || M.on_fire)
		animate(M, time = 5, alpha = 255)
		M.remove_movespeed_modifier(/datum/movespeed_modifier/vampire_cloak)
		return

	if(light_available <= 2)
		animate(M, time = 5, alpha = 38)
		M.add_movespeed_modifier(/datum/movespeed_modifier/vampire_cloak)
		return

	M.remove_movespeed_modifier(/datum/movespeed_modifier/vampire_cloak)
	animate(M, time = 5, alpha = 255)

/datum/antagonist/vampire/vv_edit_var(var_name, var_value)
	. = ..()
	check_vampire_upgrade(TRUE)


/datum/hud/proc/remove_vampire_hud()
	static_inventory -= vampire_blood_display
	QDEL_NULL(vampire_blood_display)


/datum/antagonist/vampire/proc/adjust_nullification(base, extra)
	nullified = clamp(nullified + extra, base, VAMPIRE_NULLIFICATION_CAP)


/datum/antagonist/vampire/proc/base_nullification()
	adjust_nullification(20, 4)


/**
 * Takes any datum `source` and checks it for vampire datum.
 */
/proc/is_vampire(datum/source)
	if(!source)
		return FALSE

	if(istype(source, /datum/mind))
		var/datum/mind/our_mind = source
		return our_mind.has_antag_datum(/datum/antagonist/vampire)

	if(!ismob(source))
		return FALSE

	var/mob/mind_holder = source
	if(!mind_holder.mind)
		return FALSE

	return mind_holder.mind.has_antag_datum(/datum/antagonist/vampire)


/**
 * Takes any datum `source` and checks it for vampire thrall datum.
 */
/proc/isvampirethrall(datum/source)
	if(!source)
		return FALSE

	if(istype(source, /datum/mind))
		var/datum/mind/our_mind = source
		return our_mind.has_antag_datum(/datum/antagonist/thrall)

	if(!isliving(source))
		return FALSE

	var/mob/living/mind_holder = source
	if(!mind_holder.mind)
		return FALSE

	return mind_holder.mind.has_antag_datum(/datum/antagonist/thrall)


/datum/antagonist/thrall
	name = "Vampire Thrall"
	antag_hud_name = "vampthrall"
	roundend_category = "Thralls"
	antagpanel_category = "Vampires"
	job_rank = ROLE_VAMPIRE_THRALL
	show_in_roundend = FALSE
	/// Whether mindslave uses special handling on transfer mind.
	var/special = FALSE
	/// Icon slave master will get, must be without "hud" prefix.
	var/master_hud_icon = "master"
	/// Custom greeting text if you don't want to use the basic greeting. Specify this when making a new mindslave datum with `New()`.
	var/greet_text
	/// A reference to the mind who mindslaved us.
	var/datum/antagonist/vampire/master

/datum/antagonist/thrall/greet()
	var/greet_text = "<b>Вы были очарованы [master.owner.current]. Следуйте каждому их приказу.</b>"
	return span_danger(greet_text)

/datum/antagonist/thrall/add_team_hud(mob/target)
	QDEL_NULL(team_hud_ref)

	team_hud_ref = WEAKREF(target.add_alt_appearance(
		/datum/atom_hud/alternate_appearance/basic/has_antagonist,
		"antag_team_hud_[REF(src)]",
		hud_image_on(target),
	))

	var/datum/atom_hud/alternate_appearance/basic/has_antagonist/hud = team_hud_ref.resolve()

	var/list/mob/living/mob_list = list()
	mob_list += master.owner.current
	for(var/datum/antagonist/thrall/thrall as anything in master.thralls)
		mob_list += thrall.owner.current

	for (var/datum/atom_hud/alternate_appearance/basic/has_antagonist/antag_hud as anything in GLOB.has_antagonist_huds)
		if(!(antag_hud.target in mob_list))
			continue
		antag_hud.show_to(target)
		hud.show_to(antag_hud.target)

/datum/antagonist/thrall/farewell()
	if(issilicon(owner.current))
		to_chat(owner.current, span_userdanger("Вы превратились в робота! Вы больше не очарованы…"))
	else
		to_chat(owner.current, span_userdanger("Ваш разум очищен! Вы больше не очарованы."))

/datum/antagonist/thrall/apply_innate_effects(mob/living/mob_override)
	var/mob/living/user = ..()
	user.faction |= ROLE_VAMPIRE
	return user


/datum/antagonist/thrall/remove_innate_effects(mob/living/mob_override)
	var/mob/living/user = ..()
	user.faction -= ROLE_VAMPIRE
	return user

/datum/antagonist/thrall/on_gain()
	/// Enslave them to their Master
	if(!master || !istype(master, master))
		return
	master.thralls |= src
	owner.enslave_mind_to_creator(master.owner.current)
	owner.current.log_message("has been thralled by [master.owner.current]!", LOG_ATTACK, color="#960000")
	/// Give Objectives
	var/datum/objective/master_obj = new()
	master_obj.owner = owner
	master_obj.explanation_text = "Assist your master [master.owner.current]."
	master_obj.completed = TRUE
	return ..()

/datum/antagonist/thrall/on_removal()
	//Free them from their Master
	if(!QDELETED(master))
		master.thralls -= src
		owner.enslaved_to = null
	if(owner.current)
		REMOVE_TRAITS_IN(owner.current, VAMPIRE_TRAIT)
	return ..()
