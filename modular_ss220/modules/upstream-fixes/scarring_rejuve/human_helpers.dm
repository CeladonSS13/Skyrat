/mob/living/carbon/human/revive(full_heal_flags = NONE, excess_healing = 0, force_grab_ghost = FALSE)
	if (!(full_heal_flags & HEAL_ADMIN))
		. = ..() // normal way
		return .

	var/obj/item/organ/eyes/eyes = get_organ_slot(ORGAN_SLOT_EYES)
	if (!isnull(eyes))
		eyes.fix_scar(RIGHT_EYE_SCAR)
		eyes.fix_scar(LEFT_EYE_SCAR)
	. = ..() // calling only after fixing eyes (it's updates maxHealth on them)
	return .
