/datum/nttc_configuration
	// For someone who not listed in list above (also custom jobs)
	var/standart_roleradio = "radio"
	// Toggles
	var/toggle_jobs = TRUE
	var/toggle_job_color = TRUE
	var/toggle_name_color = TRUE
	var/toggle_command_bold = TRUE

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
