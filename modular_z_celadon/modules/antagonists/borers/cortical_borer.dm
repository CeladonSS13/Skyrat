/datum/antagonist/cortical_borer/on_gain()
	forge_objectives()
	return ..()

/datum/antagonist/cortical_borer/greet()
	. = ..()
	owner.announce_objectives()

/datum/antagonist/cortical_borer/forge_objectives()
	var/datum/objective/borer_egg/objective_1 = new
	var/datum/objective/borer_hosts/objective_2 = new
	var/datum/objective/borer_blood/objective_3 = new

	objective_1.owner = owner
	objective_2.owner = owner
	objective_3.owner = owner

	objectives += objective_1
	objectives += objective_2
	objectives += objective_3

// eggs
/datum/objective/borer_egg

/datum/objective/borer_egg/New()
	explanation_text = "[GLOB.objective_egg_borer_number] borers producing [GLOB.objective_egg_egg_number] eggs: [GLOB.successful_egg_number]/[GLOB.objective_egg_borer_number]"

/datum/objective/borer_egg/check_completion()
	return GLOB.successful_egg_number >= GLOB.objective_egg_borer_number

// hosts
/datum/objective/borer_hosts

/datum/objective/borer_hosts/New()
	explanation_text = "[GLOB.objective_willing_hosts] willing hosts: [length(GLOB.willing_hosts)]/[GLOB.objective_willing_hosts]"

/datum/objective/borer_hosts/check_completion()
	return length(GLOB.willing_hosts) >= GLOB.objective_willing_hosts

// blood
/datum/objective/borer_blood

/datum/objective/borer_blood/New()
	explanation_text = "[GLOB.objective_blood_borer] borers learning [GLOB.objective_blood_chem] chemicals from the blood: [GLOB.successful_blood_chem]/[GLOB.objective_blood_borer]"

/datum/objective/borer_blood/check_completion()
	return GLOB.successful_blood_chem >= GLOB.objective_blood_borer
