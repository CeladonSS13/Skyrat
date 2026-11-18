/datum/reagent
	//does our reagent need more energy to produce in chem dispencers?
	var/required_energy_multiplier = 1

/datum/reagent/toxin/plasma	//plasma synthesis require even more power
	required_energy_multiplier = 40
