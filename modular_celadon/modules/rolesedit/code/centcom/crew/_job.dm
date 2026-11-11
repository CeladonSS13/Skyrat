/datum/job
	var/centcom_job = FALSE

/datum/id_trim/job/centcom
	assignment = "Central Command"
	trim_state = "trim_centcom"
	sechud_icon_state = SECHUD_CENTCOM
	hide_in_templates = TRIM_HIDE_STATION

	minimal_access = list(
		ACCESS_CENT_GENERAL,
	)
	minimal_wildcard_access = list(
		ACCESS_CENT_GENERAL,
	)
	template_access = list(
		ACCESS_CENT_CAPTAIN,
	)
	department_color = COLOR_CENTCOM_BLUE
	subdepartment_color = COLOR_CENTCOM_BLUE
	threat_modifier = -10
	pointer_color = COLOR_CENTCOM_BLUE
	extra_access = list()
	big_pointer = FALSE

//outfit
/datum/outfit/job/centcom
	//name = "Standard Gear"
	//jobtype = null

	uniform = /obj/item/clothing/under/rank/centcom/intern

	id = /obj/item/card/id/advanced/centcom
	id_trim = /datum/id_trim/job/centcom
	ears = /obj/item/radio/headset
	pda_slot = null
	belt = null // /obj/item/modular_computer/pda
	back = /obj/item/storage/backpack
	shoes = /obj/item/clothing/shoes/sneakers/black
	box = /obj/item/storage/box/survival

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	messenger = /obj/item/storage/backpack/messenger
	implants = list(/obj/item/implant/mindshield)

//landmark
/obj/effect/landmark/start/centcom
	jobspawn_override = TRUE
	delete_after_roundstart = FALSE
	//icon_state = "intern"
	//icon = '/centcom/icons/landmarks.dmi'
