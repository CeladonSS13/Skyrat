/datum/mutation/hulk/on_acquiring(mob/living/carbon/human/owner)
	. = ..()
	if(!.)
		return

	RegisterSignal(owner, COMSIG_LIVING_DEATH, PROC_REF(on_death))

/datum/mutation/hulk/on_losing(mob/living/carbon/human/owner)
	if(..())
		return

	UnregisterSignal(owner, COMSIG_LIVING_DEATH)

/datum/mutation/hulk/proc/on_death()
	on_losing(owner)
	qdel(src)
