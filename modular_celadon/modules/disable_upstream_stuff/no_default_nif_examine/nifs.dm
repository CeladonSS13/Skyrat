/datum/component/nif_examine
	nif_examine_text = ""

/datum/component/nif_examine/add_examine(mob/nif_user, mob/looker, list/examine_texts)
	if (!nif_examine_text || length(nif_examine_text) < 1)
		return
	return ..()
