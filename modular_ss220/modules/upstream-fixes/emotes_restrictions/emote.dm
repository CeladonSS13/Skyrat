// tails

/datum/emote/living/carbon/tail/can_run_emote(mob/user, status_check = TRUE, intentional, params)
	if (!hastail(user))
		return FALSE
	return ..()

/datum/emote/living/carbon/human/monkey/tail/can_run_emote(mob/user, status_check = TRUE, intentional, params)
	if (!hastail(user))
		return FALSE
	return ..()

/datum/emote/living/carbon/wink/can_run_emote(mob/user, status_check = TRUE, intentional, params)
	if (!hastail(user))
		return FALSE
	return ..()

/datum/emote/living/carbon/human/wag/can_run_emote(mob/user, status_check = TRUE, intentional, params)
	if (!hastail(user))
		return FALSE
	return ..()

// wings

/datum/emote/living/flap/can_run_emote(mob/user, status_check = TRUE, intentional, params)
	if (!haswings(user))
		return FALSE
	return ..()

/datum/emote/living/flap/aflap/can_run_emote(mob/user, status_check = TRUE, intentional, params)
	if (!haswings(user))
		return FALSE
	return ..()

// THIS is not needed to be overriden: /datum/emote/living/carbon/human/wing/can_run_emote
/datum/emote/living/carbon/human/wing/select_message_type(mob/user, intentional)
	return message
