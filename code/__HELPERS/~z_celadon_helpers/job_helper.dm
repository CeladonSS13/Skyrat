/proc/retrieve_relevant_job(speaker_source, obj/item/card/id/id_card, get_custom_jobname)
	var/job_at_card
	if (id_card)
		if (istype(id_card, /obj/item/card/id/advanced/chameleon))
			// chameleon-card case
			var/obj/item/card/id/advanced/chameleon/chameleon_card = id_card
			if (!get_custom_jobname && chameleon_card.trim_assignment_override)
				job_at_card = chameleon_card.trim_assignment_override
			else
				job_at_card = chameleon_card.assignment
		else
			// non-chameleon case
			if (!get_custom_jobname && id_card.trim && id_card.trim.assignment)
				job_at_card = id_card.trim.assignment
			else
				job_at_card = id_card.assignment
	if (job_at_card) // could be null at this moment
		if (!ishuman(speaker_source))
			return job_at_card
		var/mob/living/carbon/human_speaker = speaker_source
		if (human_speaker.name == "Unknown") // Something like infiltrator mod or for admin spawn
			return "Unknown"
		return job_at_card

	if (speaker_source) // Handle stuff that don't have cards
		if (issilicon(speaker_source))
			if (isAI(speaker_source))
				return JOB_AI
			if (iscyborg(speaker_source))
				return JOB_CYBORG
			if (ispAI(speaker_source))
				return JOB_PERSONAL_AI
			// There might be more checks later
			return "Machine"
		if (isobj(speaker_source))
			return "Machine"
		if (isbot(speaker_source))
			return "Bot"
	return "No id"
