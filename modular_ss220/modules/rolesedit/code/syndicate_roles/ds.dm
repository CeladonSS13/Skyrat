
// trim edit
/datum/id_trim/syndicom/nova/ds2/miner
	access = list(ACCESS_SYNDICATE, ACCESS_SYNDICATE_DS, ACCESS_SYNDICATE_IP, ACCESS_ROBOTICS)

/datum/id_trim/syndicom/nova/ds2/syndicatestaff
	access = list(ACCESS_SYNDICATE, ACCESS_SYNDICATE_DS)

/datum/id_trim/syndicom/nova/ds2/researcher
	access = list(ACCESS_SYNDICATE, ACCESS_SYNDICATE_DS, ACCESS_ROBOTICS)

/datum/id_trim/syndicom/nova/ds2/enginetechnician
	access = list(ACCESS_SYNDICATE, ACCESS_SYNDICATE_DS)

/datum/id_trim/syndicom/nova/ds2/medicalofficer
	access = list(ACCESS_SYNDICATE, ACCESS_SYNDICATE_DS)

/datum/id_trim/syndicom/nova/ds2/brigofficer
	access = list(ACCESS_SYNDICATE, ACCESS_SYNDICATE_DS, ACCESS_SYNDICATE_LEADER, ACCESS_ROBOTICS)

/datum/id_trim/syndicom/nova/ds2/masteratarms
	access = list(ACCESS_SYNDICATE, ACCESS_SYNDICATE_DS, ACCESS_SYNDICATE_LEADER, ACCESS_ROBOTICS)

/datum/id_trim/syndicom/nova/ds2/corporateliasion
	access = list(ACCESS_SYNDICATE, ACCESS_SYNDICATE_DS, ACCESS_SYNDICATE_IP, ACCESS_SYNDICATE_LEADER, ACCESS_ROBOTICS)

/datum/id_trim/syndicom/nova/ds2/stationadmiral
	access = list(ACCESS_SYNDICATE, ACCESS_SYNDICATE_DS, ACCESS_SYNDICATE_IP, ACCESS_SYNDICATE_LEADER, ACCESS_ROBOTICS)

// hop console

/obj/machinery/computer/id_upgrader/ds
	name = "syndicate access upgrader console"
	desc = "A console meant to allow modifications to IDs. This one made by syndicate and add DS2 access."
	icon = 'icons/obj/machines/computer.dmi'
	icon_keyboard = "syndie_key"
	icon_screen = "explosive"
	icon_state = "computer"
	density = TRUE
	circuit = /obj/item/circuitboard/computer/id_upgrader/ds
	access_to_give = list(ACCESS_SYNDICATE_DS)

/obj/item/circuitboard/computer/id_upgrader/ds
	name = "syndicate access upgrader console circuit"
	greyscale_colors = CIRCUIT_COLOR_SECURITY
	build_path = /obj/machinery/computer/id_upgrader/ds

//map template
/datum/map_template/ruin/space/nova/des_two1984
	id = "des_two1984"
	suffix = "des_two1984.dmm"
	name = "Space-Ruin DS-2 (ss1984 edit)"
	description = "If DS-1 was so good... and DS-2 from offs..."
	always_place = TRUE







