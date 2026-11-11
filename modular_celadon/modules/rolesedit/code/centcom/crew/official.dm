//centcom official
/datum/job/centcom_official
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
	title = JOB_CENTCOM_OFFICIAL
	//tgui_icon = FA_ICON_LANDMARK_DOME
	config_tag = "CENTCOM_OFFICIAL"
	supervisors = JOB_CENTCOM
	description = "Watch over the papers, answer to fax and help interns to not accidentally approve something not legal."
	family_heirlooms = list(/obj/item/book/manual/wiki/security_space_law)
	bounty_types = CIV_JOB_SEC
	paycheck = PAYCHECK_COMMAND
	outfit = /datum/outfit/job/centcom/official
	plasmaman_outfit = /datum/outfit/plasmaman/centcom_official
	departments_list = list(
		/datum/job_department/central_command,
		/datum/job_department/service,
	)
	//spawn, age and exp req
	total_positions = 3
	spawn_positions = 3
	minimal_player_age = 0
	exp_requirements = 250
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_CREW
	//command things
	banned_quirks = list(HEAD_RESTRICTED_QUIRKS)
	banned_augments = list(HEAD_RESTRICTED_AUGMENTS)
	mind_traits = list(HEAD_OF_STAFF_MIND_TRAITS)
	liver_traits = list(TRAIT_ROYAL_METABOLISM)
	voice_of_god_power = 1.4
	desensitized_base = DESENSITIZED_THRESHOLD

/datum/id_trim/job/centcom/official
	assignment = JOB_CENTCOM_OFFICIAL
	minimal_access = list(
		ACCESS_CENT_GENERAL,
		ACCESS_CENT_LIVING,
		ACCESS_CENT_OFFICIAL,
		ACCESS_COMMAND,
		ACCESS_GATEWAY,
		ACCESS_EVA,
		ACCESS_VAULT,
		ACCESS_SECURITY,
		ACCESS_BRIG_ENTRANCE,
		ACCESS_DETECTIVE,
		ACCESS_LAWYER,
		ACCESS_COURT,
		ACCESS_WEAPONS,
		ACCESS_CARGO,
		ACCESS_SERVICE,
		ACCESS_CONSTRUCTION,
		ACCESS_SCIENCE,
		ACCESS_MEDICAL,
	)
	honorifics = list("Official")
	honorific_positions = HONORIFIC_POSITION_LAST | HONORIFIC_POSITION_NONE
	job = /datum/job/centcom_official
	big_pointer = TRUE

/datum/outfit/job/centcom/official
	name = JOB_CENTCOM_OFFICIAL
	jobtype = /datum/job/centcom_official
	id_trim = /datum/id_trim/job/centcom/official
	box = /obj/item/storage/box/survival
	chameleon_extras = list(
		/obj/item/gun/energy/e_gun,
		/obj/item/stamp/centcom,
	)
	backpack_contents = list(
		/obj/item/stamp/centcom = 1,
	)
	head = null
	mask = null
	ears = /obj/item/radio/headset/headset_cent
	glasses = /obj/item/clothing/glasses/sunglasses
	neck = null
	gloves = /obj/item/clothing/gloves/color/black
	l_hand = /obj/item/clipboard
	l_pocket = /obj/item/pen
	r_pocket = /obj/item/modular_computer/pda/heads
	belt = /obj/item/gun/energy/e_gun
	suit = null
	uniform =  /obj/item/clothing/under/rank/centcom/official
	shoes = /obj/item/clothing/shoes/sneakers/black

/obj/effect/landmark/start/centcom/centcom_official
	name = JOB_CENTCOM_OFFICIAL
	//icon_state = "centcom_official"
