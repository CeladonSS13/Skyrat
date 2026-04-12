#define COMSIG_BLOOD_UPDATED "blood_updated"

/datum/action/innate/split_body/RegisterExtraSignals(mob/the_owner)
	. = ..()
	RegisterSignal(the_owner, COMSIG_BLOOD_UPDATED, PROC_REF(update_status_on_signal))

/datum/action/innate/split_body/UnregisterExtraSignals(mob/the_owner)
	. = ..()
	UnregisterSignal(the_owner, COMSIG_BLOOD_UPDATED)
