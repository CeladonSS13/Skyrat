/datum/nttc_configuration
	// For someone who not listed in list above (also custom jobs)
	var/standart_roleradio = "radio"
	// Toggles
	var/toggle_jobs = TRUE
	var/toggle_job_color = TRUE
	var/toggle_name_color = TRUE
	var/toggle_command_bold = TRUE

/datum/nttc_configuration/proc/retrieve_relevant_job(speaker_source, obj/item/card/id/id_card, get_custom_jobname)
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

/datum/nttc_configuration/proc/compose_ntts_job(raw_message, namepart, obj/machinery/announcement_system/announcer, job, job_custom_name, speaker_source)
	var/job_class
	var/name_with_job

	if ((toggle_job_color || toggle_name_color) && job && job != "No id")
		job_class = GLOB.nttc_jobs[job]

	if (!job_class) // Handle stuff that don't have cards
		job_class = standart_roleradio
		if (speaker_source)
			if (issilicon(speaker_source))
				job_class = "aiprivradio"
			else if (isobj(speaker_source))
				job_class = "aiprivradio"
			else if (isbot(speaker_source))
				job_class = "aiprivradio"

	if (toggle_name_color)
		namepart = "<span class='[job_class]'>[namepart]</span>"

	var/job_span = job
	if (toggle_jobs)
		if (toggle_job_color)
			if (job_custom_name)
				job_span = "<span class='[job_class]'>[job_custom_name]</span>"
			else
				job_span = "<span class='[job_class]'>[job]</span>"

		var/message_format = list("JOB" = job_span, "NAME" = namepart)
		var/compiled_message = announcer.compile_config_message(/datum/aas_config_entry/nttc_job_indicator_type, message_format, raw_message)
		if (toggle_job_color) // to color also brackets or other things
			name_with_job = "<span class='[job_class]'>[compiled_message]</span>"
		else
			name_with_job = compiled_message
	else
		name_with_job = namepart

	return name_with_job
