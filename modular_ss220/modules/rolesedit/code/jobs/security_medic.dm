/datum/id_trim/job/security_medic
	assignment = "Security Medic"
	trim_icon = 'modular_ss220/modules/return_prs/sec_haul/icons/card.dmi'
	trim_state = "trim_securitymedic"
	department_color = COLOR_ASSEMBLY_BLACK
	subdepartment_color = COLOR_SECURITY_RED
	sechud_icon_state = SECHUD_SECURITY_MEDIC
	extra_access = list(ACCESS_DETECTIVE)
	minimal_access = list(ACCESS_SECURITY, ACCESS_MEDICAL, ACCESS_BRIG_ENTRANCE, ACCESS_BRIG, ACCESS_COURT, ACCESS_WEAPONS, ACCESS_MECH_SECURITY, ACCESS_MECH_MEDICAL, ACCESS_MINERAL_STOREROOM, ACCESS_MORGUE, ACCESS_MAINT_TUNNELS)
	template_access = list(ACCESS_CAPTAIN, ACCESS_HOS, ACCESS_CHANGE_IDS)
	honorifics = list("SEMT")
	honorific_positions = HONORIFIC_POSITION_FIRST | HONORIFIC_POSITION_LAST | HONORIFIC_POSITION_FIRST_FULL | HONORIFIC_POSITION_NONE

/datum/id_trim/job/security_medic/New()
	. = ..()

	// Config check for if sec has maint access.
	if(CONFIG_GET(flag/security_has_maint_access))
		access |= list(ACCESS_MAINT_TUNNELS)

/datum/job/security_medic
	title = JOB_SECURITY_MEDIC
	description = "Patch up officers and prisoners, realize you don't have the tools to Tend Severe Wounds, barge into Medbay and tell them how to do their jobs"
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	supervisors = JOB_HEAD_OF_SECURITY
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = SUPERVISOR_HOS
	minimal_player_age = 7
	exp_requirements = 120
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_SECURITY
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "SECURITY_MEDIC"

	outfit = /datum/outfit/job/security_medic
	plasmaman_outfit = /datum/outfit/plasmaman/security

	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_SEC

	liver_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	banned_quirks = list(SEC_RESTRICTED_QUIRKS)
	antagonist_restricted = TRUE
	alt_titles = list(
		"Security Medic",
		"Field Medic",
		"Security Corpsman",
		"Brig Physician",
		"Combat Medic",
	)

	display_order = JOB_DISPLAY_ORDER_SECURITY_MEDIC
	bounty_types = CIV_JOB_SEC
	departments_list = list(
		/datum/job_department/security,
		/datum/job_department/medical,
	)

	family_heirlooms = list(/obj/item/clothing/neck/stethoscope, /obj/item/book/manual/wiki/security_space_law)

	//This is the paramedic goodie list. Secmedics are paramedics more or less so they can use these instead of raiding medbay.
	mail_goodies = list(
		/obj/item/reagent_containers/hypospray/medipen = 20,
		/obj/item/reagent_containers/hypospray/medipen/oxandrolone = 10,
		/obj/item/reagent_containers/hypospray/medipen/salacid = 10,
		/obj/item/reagent_containers/hypospray/medipen/salbutamol = 10,
		/obj/item/reagent_containers/hypospray/medipen/penacid = 10,
		/obj/item/reagent_containers/hypospray/medipen/survival/luxury = 5
	)
	rpg_title = "Battle Cleric"
	job_flags = STATION_JOB_FLAGS | JOB_CANNOT_OPEN_SLOTS

/datum/outfit/job/security_medic
	name = "Security Medic"
	jobtype = /datum/job/security_medic
	belt = /obj/item/modular_computer/pda/security_medic
	ears = /obj/item/radio/headset/headset_medsec
	uniform = /obj/item/clothing/under/rank/security/nova/security_medic
	gloves = /obj/item/clothing/gloves/latex/nitrile
	shoes = /obj/item/clothing/shoes/jackboots/sec
	glasses = /obj/item/clothing/glasses/hud/health/sunglasses
	suit = /obj/item/clothing/suit/armor/vest/peacekeeper/security_medic
	l_hand = /obj/item/storage/medkit/brute
	head = /obj/item/clothing/head/beret/sec/nova/security_medic
	backpack_contents = list(
		/obj/item/storage/toolbox/guncase/nova/pistol/firefly = 1,
		)
	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	box = /obj/item/storage/box/survival/security
	implants = list(/obj/item/implant/mindshield)
	id_trim = /datum/id_trim/job/security_medic

/obj/item/radio/headset/headset_medsec
	name = "medical-security radio headset"
	desc = "Used to hear how many security officers need to be stiched back together."
	icon_state = "sec_headset"
	keyslot = new /obj/item/encryptionkey/headset_med
	keyslot2 = new /obj/item/encryptionkey/headset_sec

/obj/structure/closet/secure_closet/security_medic
	name = "security medics's locker"
	req_access = list(ACCESS_SECURITY, ACCESS_BRIG, ACCESS_MEDICAL)
	icon = 'modular_ss220/modules/return_prs/sec_haul/icons/closet.dmi'
	icon_state = "secmed"

/obj/structure/closet/secure_closet/security_medic/PopulateContents()
	..()
	new /obj/item/storage/bag/garment/brigmed(src)
	new /obj/item/storage/backpack/security(src)
	new /obj/item/radio/headset/headset_medsec(src)
	new /obj/item/storage/medkit/emergency(src)
	new /obj/item/storage/belt/medical(src)
	new /obj/item/storage/belt/security/medic/full(src)

/obj/item/modular_computer/pda/security_medic
	name = "security medic PDA"
	greyscale_colors = "#EA3232#0000cc"
	inserted_item = /obj/item/pen/red/security
	starting_programs = list(
		/datum/computer_file/program/records/security,
		/datum/computer_file/program/records/medical,
		/datum/computer_file/program/robocontrol,
		/datum/computer_file/program/radar/lifeline,
	)

//secmed spawners
/obj/effect/landmark/start/security_medic
	name = "Security Medic"
	icon_state = "Security Medic"
	icon = 'modular_nova/master_files/icons/mob/landmarks.dmi'

/datum/area_spawn/secmed_landmark
	target_areas = list(/area/station/security/medical, /area/station/security/brig)
	desired_atom = /obj/effect/landmark/start/security_medic

/obj/effect/landmark/start/security_officer/Initialize(mapload)
	. = ..()
	new /obj/effect/landmark/start/security_medic(get_turf(src))


