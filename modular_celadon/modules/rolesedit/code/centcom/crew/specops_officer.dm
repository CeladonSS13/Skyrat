//specops officer
/datum/job/centcom_specops_officer
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
	title = JOB_CENTCOM_SPECIAL_OFFICER
	//tgui_icon = FA_ICON_PERSON_RIFLE
	config_tag = "CENTCOM_SPECOPS_OFFICER"
	supervisors = JOB_CENTCOM
	description = "Watch over the CentCom ERT's, control asset protection teams."
	family_heirlooms = list(/obj/item/book/manual/wiki/security_space_law)
	bounty_types = CIV_JOB_SEC
	paycheck = PAYCHECK_COMMAND
	outfit = /datum/outfit/job/centcom/specops_officer
	plasmaman_outfit = /datum/outfit/plasmaman/centcom_commander
	departments_list = list(
		/datum/job_department/central_command,
		/datum/job_department/command,
	)
	//spawn, age and exp req
	total_positions = 1
	spawn_positions = 1
	minimal_player_age = 0
	exp_requirements = 600
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

/datum/id_trim/job/centcom/specops_officer
	assignment = JOB_CENTCOM_SPECIAL_OFFICER
	honorifics = list("Officer")
	honorific_positions = HONORIFIC_POSITION_LAST | HONORIFIC_POSITION_NONE
	job = /datum/job/centcom_specops_officer
	big_pointer = TRUE

/datum/id_trim/job/centcom/specops_officer/New()
	minimal_access |= (SSid_access.get_region_access_list(list(REGION_CENTCOM, REGION_CENTCOM_SPECOPS, REGION_ALL_STATION)) + ACCESS_CENT_OFFICER + ACCESS_CENT_SPECOPS_OFFICER)
	return ..()

/datum/outfit/job/centcom/specops_officer
	name = JOB_CENTCOM_SPECIAL_OFFICER
	jobtype = /datum/job/centcom_specops_officer
	id_trim = /datum/id_trim/job/centcom/specops_officer
	box = /obj/item/storage/box/survival/security
	chameleon_extras = list(
		/obj/item/gun/energy/pulse/pistol/m1911
	)

	head = /obj/item/clothing/head/helmet/space/beret
	mask = /obj/item/cigarette/cigar/havana
	ears = /obj/item/radio/headset/headset_cent/commander
	glasses = /obj/item/clothing/glasses/thermal/eyepatch
	neck = /obj/item/clothing/neck/pauldron/commander
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	l_pocket = /obj/item/lighter
	r_pocket = null
	belt = /obj/item/gun/energy/pulse/pistol/m1911
	suit = /obj/item/clothing/suit/space/officer
	uniform =  /obj/item/clothing/under/rank/centcom/commander
	shoes = /obj/item/clothing/shoes/combat/swat

/obj/effect/landmark/start/centcom/specops_officer
	name = JOB_CENTCOM_SPECIAL_OFFICER
	//icon_state = "specops_officer"
