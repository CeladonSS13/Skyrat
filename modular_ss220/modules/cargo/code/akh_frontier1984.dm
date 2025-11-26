/datum/supply_pack/companies/akh_frontier
	group = FRONTIER_EQUIPMENT_NAME_1984
	special = FALSE // required to be shown in cargo
	special_enabled = TRUE // required to be shown in cargo
	dangerous = FALSE // required to be shown in cargo

// Tools that you could use the rapid fabricator for, but you're too lazy to actually do that

/datum/supply_pack/companies/akh_frontier/basic
	cost = PAYCHECK_COMMAND * 4

/datum/supply_pack/companies/akh_frontier/basic/fock
	contains = list(/obj/item/multitool/fock)
	contraband = TRUE

/datum/supply_pack/companies/akh_frontier/basic/doorforcer
	contains = list(/obj/item/crowbar/large/doorforcer)
	cost = PAYCHECK_COMMAND * 6
	contraband = TRUE

/datum/supply_pack/companies/akh_frontier/basic/omni_drill
	contains = list(/obj/item/screwdriver/omni_drill)
	cost = PAYCHECK_COMMAND * 3

/datum/supply_pack/companies/akh_frontier/basic/arc_welder
	contains = list(/obj/item/weldingtool/electric/arc_welder)
	cost = PAYCHECK_COMMAND * 3

// Flatpacked fabricator and related upgrades

/datum/supply_pack/companies/akh_frontier/deployables_fab/rapid_construction_fabricator
	contains = list(/obj/item/flatpacked_machine)
	cost = CARGO_CRATE_VALUE * 8

/datum/supply_pack/companies/akh_frontier/deployables_fab/foodricator
	contains = list(/obj/item/flatpacked_machine/organics_ration_printer)
	cost = CARGO_CRATE_VALUE * 6

// Various smaller appliances than the deployable machines below

/datum/supply_pack/companies/akh_frontier/appliances/charger
	contains = list(/obj/item/wallframe/cell_charger_multi)
	cost = PAYCHECK_CREW * 3

/datum/supply_pack/companies/akh_frontier/appliances/wall_heater
	contains = list(/obj/item/wallframe/wall_heater)
	cost = PAYCHECK_CREW * 3

/datum/supply_pack/companies/akh_frontier/appliances/water_synth
	contains = list(/obj/item/flatpacked_machine/water_synth)
	cost = PAYCHECK_COMMAND * 2

/datum/supply_pack/companies/akh_frontier/appliances/hydro_synth
	contains = list(/obj/item/flatpacked_machine/hydro_synth)
	cost = PAYCHECK_COMMAND * 2

/datum/supply_pack/companies/akh_frontier/appliances/sustenance_dispenser
	contains = list(/obj/item/flatpacked_machine/sustenance_machine)
	cost = PAYCHECK_COMMAND * 4

/datum/supply_pack/companies/akh_frontier/appliances/biogenerator
	contains = list(/obj/item/flatpacked_machine/organics_printer)
	cost = CARGO_CRATE_VALUE * 8

// Flatpacked, ready to deploy machines

/datum/supply_pack/companies/akh_frontier/deployables_misc
	cost = PAYCHECK_COMMAND * 3

/datum/supply_pack/companies/akh_frontier/deployables_misc/arc_furnace
	contains = list(/obj/item/flatpacked_machine/arc_furnace)

/datum/supply_pack/companies/akh_frontier/deployables_misc/co2_cracker
	contains = list(/obj/item/flatpacked_machine/co2_cracker)

/datum/supply_pack/companies/akh_frontier/deployables_misc/recycler
	contains = list(/obj/item/flatpacked_machine/recycler)

// Flatpacked, ready to deploy machines for power related activities

/datum/supply_pack/companies/akh_frontier/deployables
	cost = PAYCHECK_COMMAND * 3

/datum/supply_pack/companies/akh_frontier/deployables/turbine
	contains = list(/obj/item/flatpacked_machine/wind_turbine)
	cost = PAYCHECK_CREW * 3

/datum/supply_pack/companies/akh_frontier/deployables/solids_generator
	contains = list(/obj/item/flatpacked_machine/fuel_generator)

/datum/supply_pack/companies/akh_frontier/deployables/stirling_generator
	contains = list(/obj/item/flatpacked_machine/stirling_generator)
	cost = PAYCHECK_COMMAND * 4

/datum/supply_pack/companies/akh_frontier/deployables/rtg
	contains = list(/obj/item/flatpacked_machine/rtg)
	cost = PAYCHECK_COMMAND * 7

/datum/supply_pack/companies/akh_frontier/deployables/solar
	contains = list(/obj/item/flatpacked_machine/solar)
	cost = PAYCHECK_CREW * 3

/datum/supply_pack/companies/akh_frontier/deployables/solar/titaniumglass
	contains = list(/obj/item/flatpacked_machine/solar/titaniumglass)
	cost = PAYCHECK_COMMAND * 3

/datum/supply_pack/companies/akh_frontier/deployables/solar/plasmaglass
	contains = list(/obj/item/flatpacked_machine/solar/plasmaglass)
	cost = PAYCHECK_COMMAND * 5

/datum/supply_pack/companies/akh_frontier/deployables/solar/plastitaniumglass
	contains = list(/obj/item/flatpacked_machine/solar/plastitaniumglass)
	cost = PAYCHECK_COMMAND * 6

/datum/supply_pack/companies/akh_frontier/deployables/solar_tracker
	contains = list(/obj/item/flatpacked_machine/solar_tracker)
	cost = PAYCHECK_COMMAND

/datum/supply_pack/companies/akh_frontier/deployables/solar_control
	name = "Solar Array Console Board"
	contains = list(/obj/item/circuitboard/computer/solar_control)
	cost = CARGO_CRATE_VALUE * 2
