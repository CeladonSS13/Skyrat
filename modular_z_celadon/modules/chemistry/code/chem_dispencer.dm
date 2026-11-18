/obj/machinery/chem_dispenser/proc/get_final_power_cost(reagent, to_dispense, power_cost)
	var/datum/reagent/our_reagent = reagent
	return (our_reagent.required_energy_multiplier * to_dispense * power_cost)
