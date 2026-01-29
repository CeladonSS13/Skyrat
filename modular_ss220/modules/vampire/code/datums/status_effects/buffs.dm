/datum/status_effect/bloodswell
	id = "bloodswell"
	duration = 30 SECONDS
	tick_interval = 0
	alert_type = /atom/movable/screen/alert/status_effect/blood_swell
	var/bonus_damage_applied = FALSE


/atom/movable/screen/alert/status_effect/blood_swell
	name = "Кровавый прилив"
	desc = "Ваше тело наполнено багровой магией, ваша устойчивость к атакам значительно повысилась!"
	icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	icon_state = "blood_swell_status"


/datum/status_effect/bloodswell/on_apply()
	. = ..()
	if(!. || !ishuman(owner))
		return FALSE

	var/mob/living/carbon/human/human_owner = owner

	ADD_TRAIT(human_owner, TRAIT_NOGUNS, VAMPIRE_TRAIT)

	human_owner.physiology.brute_mod *= 0.3
	human_owner.physiology.burn_mod *= 0.6
	human_owner.physiology.stamina_mod *= 0.3
	human_owner.physiology.stun_mod *= 0.3

	var/datum/antagonist/vampire/V = human_owner.mind.has_antag_datum(/datum/antagonist/vampire)

	var/obj/item/bodypart/attacking_bodypart
	if(!attacking_bodypart)
		attacking_bodypart = human_owner.get_active_hand()

	if(V.get_ability(/datum/vampire_passive/blood_swell_upgrade))

		bonus_damage_applied = TRUE
		attacking_bodypart.unarmed_damage_low += 14
		attacking_bodypart.unarmed_damage_high += 14
		attacking_bodypart.unarmed_effectiveness += 10	//higher chance to stun but not 100%


/datum/status_effect/bloodswell/on_remove()
	if(!ishuman(owner))
		return

	var/mob/living/carbon/human/human_owner = owner

	REMOVE_TRAIT(human_owner, TRAIT_NOGUNS, VAMPIRE_TRAIT)

	human_owner.physiology.brute_mod /= 0.3
	human_owner.physiology.burn_mod /= 0.6
	human_owner.physiology.stamina_mod /= 0.3
	human_owner.physiology.stun_mod /= 0.3

	var/obj/item/bodypart/attacking_bodypart
	if(!attacking_bodypart)
		attacking_bodypart = human_owner.get_active_hand()

	if(bonus_damage_applied)
		bonus_damage_applied = FALSE
		attacking_bodypart.unarmed_damage_low -= 14
		attacking_bodypart.unarmed_damage_high -= 14
		attacking_bodypart.unarmed_effectiveness -= 10

/datum/status_effect/blood_rush
	id = "bloodrush"
	alert_type = /atom/movable/screen/alert/status_effect/blood_rush
	duration = 10 SECONDS


/datum/status_effect/blood_rush/on_apply()
	owner.add_movespeed_modifier(/datum/movespeed_modifier/status_effect/blood_rush)
	return TRUE


/datum/status_effect/blood_rush/on_remove()
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/status_effect/blood_rush)


/atom/movable/screen/alert/status_effect/blood_rush
	name = "Кровавый рывок"
	desc = "Ваше тело наполнено магией крови, увеличивая вашу скорость передвижения."
	icon = 'modular_ss220/modules/vampire/icons/actions/actions.dmi'
	icon_state = "blood_rush_status"

/datum/status_effect/thrall_net
	id = "thrall_net"
	tick_interval = 2 SECONDS
	duration = -1
	alert_type = null
	var/blood_cost_per_tick = 5
	var/list/target_UIDs = list()
	var/datum/antagonist/vampire/vamp


/datum/status_effect/thrall_net/on_creation(mob/living/new_owner, datum/antagonist/vampire/V, ...)
	. = ..()
	vamp = V
	START_PROCESSING(SSfastprocess, src)
	target_UIDs += owner.UID()
	var/list/view_cache = view(7, owner)
	V = owner.mind.has_antag_datum(/datum/antagonist/vampire)
	for(var/datum/mind/M in V.thralls)
		if(!M.has_antag_datum(/datum/antagonist/thrall))
			continue

		if(!(M.current in view_cache))
			continue

		if(M.current.stat == DEAD)
			continue

		target_UIDs += M.current.UID()
		M.current.Beam(owner, "sendbeam", time = 2 SECONDS, maxdistance = 7)


/datum/status_effect/thrall_net/tick(seconds_between_ticks)
	var/total_damage = 0
	var/list/view_cache = view(7, owner)
	for(var/uid in target_UIDs)
		var/mob/living/L = locateUID(uid)
		if(!(L in view_cache) || L.stat == DEAD)
			target_UIDs -= uid
			continue
		total_damage += (L.maxHealth - L.health)
		L.Beam(owner, "sendbeam", time = 2 SECONDS, maxdistance = 7)

	var/average_damage = total_damage / length(target_UIDs)

	for(var/uid in target_UIDs)
		var/mob/living/L = locateUID(uid)
		var/current_damage = L.maxHealth - L.health
		if(current_damage == average_damage)
			continue
		if(current_damage > average_damage)
			var/heal_amount = current_damage - average_damage
			L.heal_ordered_damage(heal_amount, list(BRUTE, BURN, TOX, OXY))
		else
			var/damage_amount = average_damage - current_damage
			L.adjustFireLoss(damage_amount)

	vamp.bloodusable = max(vamp.bloodusable - blood_cost_per_tick, 0)
	if(!vamp.bloodusable || length(target_UIDs) <= 1) // if there is one left in the list, its only the vampire.
		qdel(src)


/datum/status_effect/thrall_net/on_remove()
	. = ..()
	vamp = null
