//mutator version mob's actions
/datum/action/cooldown/mob_cooldown/blood_worm/cocoon/hatchling/uplink
	new_worm_type = /mob/living/basic/blood_worm/juvenile/uplink

/datum/action/cooldown/mob_cooldown/blood_worm/cocoon/juvenile/uplink
	new_worm_type = /mob/living/basic/blood_worm/adult/uplink

//mutator version mob
/mob/living/basic/blood_worm/hatchling/uplink
	cocoon_action = /datum/action/cooldown/mob_cooldown/blood_worm/cocoon/hatchling/uplink

/mob/living/basic/blood_worm/juvenile/uplink
	cocoon_action = /datum/action/cooldown/mob_cooldown/blood_worm/cocoon/juvenile/uplink

/mob/living/basic/blood_worm/adult/uplink
	cocoon_action = null	//should have nothing because basic adult stage cocoon action is reproduce
