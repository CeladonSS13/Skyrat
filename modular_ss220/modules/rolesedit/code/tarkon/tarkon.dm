/datum/id_trim/away/tarkon
	assignment = "P-T Visitor"
	sechud_icon_state = SECHUD_ASSISTANT

/datum/id_trim/away/tarkon/deck
	assignment = "P-T Deck Worker"
	sechud_icon_state = SECHUD_BRIDGE_ASSISTANT

/datum/id_trim/away/tarkon/robo
	assignment = "P-T Cyborg Access"
	sechud_icon_state = SECHUD_ROBOTICIST

/datum/id_trim/away/tarkon/director
	sechud_icon_state = SECHUD_CAPTAIN

/obj/item/card/id/advanced/tarkon
	name = "Tarkon visitor pass"

/obj/item/card/id/advanced/tarkon/deck
	name = "P-T deck worker's access card"
	desc = "An access card designated for \"civilians\". You are professional assistant."
	trim = /datum/id_trim/away/tarkon/deck

/datum/outfit/tarkon
	id_trim = /datum/id_trim/away/tarkon/deck
	id = /obj/item/card/id/advanced/tarkon/deck

//for custom bank machine
/obj/item/card/id/departmental_budget/tarkon
	budget_name = "Port Tarkon"
	radio_channel = RADIO_CHANNEL_TARKON
	departament_access = ACCESS_TARKON
	away = TRUE
