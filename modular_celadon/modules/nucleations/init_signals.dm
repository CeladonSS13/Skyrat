/mob/living/carbon/human/register_init_signals()
	. = ..()

	RegisterSignals(src, list(SIGNAL_ADDTRAIT(TRAIT_NO_DAMAGE_SLOWDOWN), SIGNAL_REMOVETRAIT(TRAIT_NO_DAMAGE_SLOWDOWN)), PROC_REF(on_no_damage_slowdown_trait))

/mob/living/carbon/human/proc/on_no_damage_slowdown_trait(datum/source)
	SIGNAL_HANDLER

	if(HAS_TRAIT(src, TRAIT_NO_DAMAGE_SLOWDOWN))
		add_movespeed_mod_immunities(TRAIT_NO_DAMAGE_SLOWDOWN, /datum/movespeed_modifier/damage_slowdown)
	else
		remove_movespeed_mod_immunities(TRAIT_NO_DAMAGE_SLOWDOWN, /datum/movespeed_modifier/damage_slowdown)
