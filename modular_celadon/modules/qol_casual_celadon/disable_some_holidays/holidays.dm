/datum/holiday
	var/disable_holiday = FALSE

/datum/holiday/shouldCelebrate(dd, mm, yyyy, ddd)
	if (disable_holiday)
		return FALSE
	return ..()

/datum/holiday/pride_week
	disable_holiday = TRUE
