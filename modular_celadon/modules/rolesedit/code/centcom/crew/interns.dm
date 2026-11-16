//intern
/datum/job/centcom_intern
	//centcom things
	paycheck_department = ACCOUNT_CCD
	faction = FACTION_CENTCOM
	job_flags = CENTCOM_JOB_FLAGS
	req_admin_notify = TRUE
	centcom_job = TRUE
	nova_stars_only = FALSE
	allow_bureaucratic_error = FALSE
	random_spawns_possible = FALSE
	antagonist_restricted = TRUE
	//job things
	title = JOB_CENTCOM_INTERN
	//tgui_icon = FA_ICON_PEN_ALT
	config_tag = "CENTCOM_INTERN"
	supervisors = JOB_CENTCOM
	description = "Watch over the CentCom documents, write paper, and spend your days bringing coffee for higher-ups."
	family_heirlooms = list(/obj/item/book/manual/wiki/security_space_law)
	bounty_types = CIV_JOB_SEC
	paycheck = PAYCHECK_LOWER
	outfit = /datum/outfit/job/centcom/centcom_intern
	plasmaman_outfit = /datum/outfit/plasmaman/centcom_intern
	departments_list = list(
		/datum/job_department/central_command,
	)
	//spawn, age and exp req
	total_positions = 5
	spawn_positions = 5
	minimal_player_age = 0
	exp_requirements = 100
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_CREW

/datum/id_trim/job/centcom/centcom_intern
	assignment = JOB_CENTCOM_INTERN
	minimal_access = list(
		ACCESS_CENT_GENERAL,
		ACCESS_CENT_LIVING,
		ACCESS_WEAPONS,
	)
	job = /datum/job/centcom_intern
	honorifics = list("Intern")
	honorific_positions = HONORIFIC_POSITION_LAST | HONORIFIC_POSITION_NONE

/datum/outfit/job/centcom/centcom_intern
	name = JOB_CENTCOM_INTERN
	jobtype = /datum/job/centcom_intern

	id_trim = /datum/id_trim/job/centcom/centcom_intern
	chameleon_extras = list(
		/obj/item/gun/ballistic/rifle/boltaction
	)

	ears = /obj/item/radio/headset/headset_cent
	glasses = /obj/item/clothing/glasses/sunglasses
	gloves = /obj/item/clothing/gloves/color/black
	belt = /obj/item/melee/baton
	uniform =  /obj/item/clothing/under/rank/centcom/intern
	shoes = /obj/item/clothing/shoes/sneakers/black

/obj/effect/landmark/start/centcom/intern
	name = JOB_CENTCOM_INTERN
	//icon_state = "intern"

//head intern
/datum/job/centcom_head_intern
	//centcom things
	paycheck_department = ACCOUNT_CCD
	faction = FACTION_CENTCOM
	job_flags = CENTCOM_JOB_FLAGS
	req_admin_notify = TRUE
	centcom_job = TRUE
	nova_stars_only = FALSE
	allow_bureaucratic_error = FALSE
	random_spawns_possible = FALSE
	antagonist_restricted = TRUE
	//job things
	title = JOB_CENTCOM_HEAD_INTERN
	//tgui_icon = FA_ICON_PEN_FANCY
	config_tag = "CENTCOM_HEAD_INTERN"
	supervisors = JOB_CENTCOM
	description = "Watch over the CentCom Interns, read their paper, and give paper to officials."
	family_heirlooms = list(/obj/item/book/manual/wiki/security_space_law)
	bounty_types = CIV_JOB_SEC
	paycheck = PAYCHECK_CREW
	outfit = /datum/outfit/job/centcom/head_intern
	plasmaman_outfit = /datum/outfit/plasmaman/centcom_intern
	departments_list = list(
		/datum/job_department/central_command,
	)
	//spawn, age and exp req
	total_positions = 2
	spawn_positions = 2
	minimal_player_age = 0
	exp_requirements = 200
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_CREW

/datum/id_trim/job/centcom/head_intern
	assignment = JOB_CENTCOM_HEAD_INTERN
	minimal_access = list(
		ACCESS_CENT_GENERAL,
		ACCESS_CENT_LIVING,
		ACCESS_WEAPONS,
	)
	job = /datum/job/centcom_head_intern
	big_pointer = TRUE
	honorifics = list("Head Intern")
	honorific_positions = HONORIFIC_POSITION_LAST | HONORIFIC_POSITION_NONE

/datum/outfit/job/centcom/head_intern
	name = JOB_CENTCOM_HEAD_INTERN
	jobtype = /datum/job/centcom_head_intern
	id_trim = /datum/id_trim/job/centcom/head_intern
	chameleon_extras = list(
		/obj/item/gun/ballistic/rifle/boltaction
	)

	ears = /obj/item/radio/headset/headset_cent
	glasses = /obj/item/clothing/glasses/sunglasses
	head = /obj/item/clothing/head/hats/intern
	gloves = /obj/item/clothing/gloves/color/black
	l_hand = /obj/item/megaphone
	belt = /obj/item/melee/baton/security/loaded
	uniform =  /obj/item/clothing/under/rank/centcom/intern
	suit = /obj/item/clothing/suit/armor/vest
	shoes = /obj/item/clothing/shoes/sneakers/black

/obj/effect/landmark/start/centcom/head_intern
	name = JOB_CENTCOM_HEAD_INTERN
	//icon_state = "head_intern"
