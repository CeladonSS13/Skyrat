//id trims
/datum/id_trim/away/tarkon
	assignment = JOB_TARKON_VISITOR
	sechud_icon_state = SECHUD_ASSISTANT

/datum/id_trim/away/tarkon/deck
	assignment = JOB_TARKON_WORKER
	sechud_icon_state = SECHUD_BRIDGE_ASSISTANT

/datum/id_trim/away/tarkon/cargo
	assignment = JOB_TARKON_CARGO

/datum/id_trim/away/tarkon/sec
	assignment = JOB_TARKON_GUARD

/datum/id_trim/away/tarkon/med
	assignment = JOB_TARKON_MEDIC

/datum/id_trim/away/tarkon/eng
	assignment = JOB_TARKON_ENGINEER

/datum/id_trim/away/tarkon/sci
	assignment = JOB_TARKON_RESEARCHER
	access = list(ACCESS_TARKON, ACCESS_AWAY_GENERAL, ACCESS_AWAY_SCIENCE, ACCESS_WEAPONS)

/datum/id_trim/away/tarkon/robo
	assignment = JOB_TARKON_CYBORG_ACCESS
	sechud_icon_state = SECHUD_ROBOTICIST

/datum/id_trim/away/tarkon/ensign
	assignment = JOB_TARKON_ENSIGN
	access = list(ACCESS_TARKON, ACCESS_TARKON_COMMAND, ACCESS_AWAY_GENERAL, ACCESS_AWAY_SCIENCE, ACCESS_MEDICAL, ACCESS_ROBOTICS, ACCESS_WEAPONS)

/datum/id_trim/away/tarkon/director
	assignment = JOB_TARKON_DIRECTOR
	sechud_icon_state = SECHUD_CAPTAIN
	access = list(ACCESS_TARKON, ACCESS_TARKON_COMMAND, ACCESS_TARKON_DIRECTOR, ACCESS_AWAY_GENERAL, ACCESS_AWAY_SCIENCE, ACCESS_MEDICAL, ACCESS_ROBOTICS, ACCESS_WEAPONS)

//id cards
/obj/item/card/id/advanced/tarkon
	name = "Tarkon visitor pass"

/obj/item/card/id/advanced/tarkon/deck
	name = "P-T deck worker's access card"
	desc = "An access card designated for \"civilians\". You are professional assistant."
	trim = /datum/id_trim/away/tarkon/deck

//for custom bank machine
/obj/item/card/id/departmental_budget/tarkon
	budget_name = "Port Tarkon"
	radio_channel = RADIO_CHANNEL_TARKON
	departament_access = ACCESS_TARKON
	away = TRUE

//jobs code

/datum/job/tarkon
	paycheck = PAYCHECK_CREW

/datum/job/tarkon/command
	paycheck = PAYCHECK_COMMAND

/datum/outfit/tarkon
	id_trim = /datum/id_trim/away/tarkon/deck
	id = /obj/item/card/id/advanced/tarkon/deck
	role_job = /datum/job/tarkon

/datum/outfit/tarkon/engi
	skillchips = list(/obj/item/skillchip/job/engineer)

/datum/outfit/tarkon/ensign
	role_job = /datum/job/tarkon/command

/datum/outfit/tarkon/director
	role_job = /datum/job/tarkon/command

/obj/effect/mob_spawn/ghost_role/human/tarkon/ensign
	spawner_job_path = /datum/job/tarkon/command

/obj/effect/mob_spawn/ghost_role/human/tarkon/director
	spawner_job_path = /datum/job/tarkon/command
