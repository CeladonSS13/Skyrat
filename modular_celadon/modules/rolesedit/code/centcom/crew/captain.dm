//captain
/datum/job/centcom_captain
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
	title = JOB_CENTCOM_CAPTAIN
	//tgui_icon = FA_ICON_SCALE_BALANCED
	config_tag = "CENTCOM_CAPTAIN"
	supervisors = JOB_CENTCOM
	description = "Watch over the CentCom, control your commanders and decide fate of stations."
	family_heirlooms = list(/obj/item/book/manual/wiki/security_space_law)
	bounty_types = CIV_JOB_SEC
	paycheck = PAYCHECK_COMMAND
	outfit = /datum/outfit/job/centcom/captain
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

/datum/id_trim/job/centcom/captain
	assignment = JOB_CENTCOM_CAPTAIN
	honorifics = list("Captain", "Cpt.")
	honorific_positions = HONORIFIC_POSITION_FIRST | HONORIFIC_POSITION_LAST | HONORIFIC_POSITION_FIRST_FULL | HONORIFIC_POSITION_NONE
	job = /datum/job/centcom_captain
	big_pointer = TRUE

/datum/id_trim/job/centcom/captain/New()
	minimal_access |= SSid_access.get_region_access_list(list(REGION_CENTCOM, REGION_CENTCOM_SPECOPS, REGION_CENTCOM_CAPTAIN, REGION_ALL_STATION))
	return ..()

/datum/outfit/job/centcom/captain
	name = JOB_CENTCOM_CAPTAIN
	jobtype = /datum/job/centcom_captain
	id_trim = /datum/id_trim/job/centcom/captain
	box = /obj/item/storage/box/survival/security
	chameleon_extras = list(
		/obj/item/gun/ballistic/rifle/boltaction
	)

	head = /obj/item/clothing/head/hats/centcom_cap
	ears = /obj/item/radio/headset/headset_cent/commander
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/black
	neck = /obj/item/clothing/neck/pauldron/captain
	gloves = /obj/item/clothing/gloves/combat/naval
	l_pocket = /obj/item/melee/baton/telescopic/gold
	r_pocket = /obj/item/stamp/centcom/captain
	suit = /obj/item/clothing/suit/armor/vest/capcarapace/naval
	uniform =  /obj/item/clothing/under/rank/centcom/nova/naval/commander
	shoes = /obj/item/clothing/shoes/combat/swat

/obj/effect/landmark/start/centcom/captain
	name = JOB_CENTCOM_CAPTAIN
	//icon_state = "captain"
