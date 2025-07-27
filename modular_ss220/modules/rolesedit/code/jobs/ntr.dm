/datum/job
	var/list/centcom_announce = null

/datum/job/nanotrasen_consultant
	title = JOB_NT_REP
	description = "Represent Nanotrasen on the station, argue with the HoS about why he can't just field execute people for petty theft, get drunk in your office."
	department_head = list(JOB_CENTCOM)
	centcom_announce = list(RADIO_CHANNEL_COMMAND)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	req_admin_notify = 1
	supervisors = "Central Command"
	minimal_player_age = 14
	exp_requirements = 600
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "NANOTRASEN_CONSULTANT"

	department_for_prefs = /datum/job_department/captain

	departments_list = list(
		/datum/job_department/central_command,
		/datum/job_department/command
	)

	outfit = /datum/outfit/job/nanotrasen_consultant
	plasmaman_outfit = /datum/outfit/plasmaman/nanotrasen_consultant

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_CMD

	display_order = JOB_DISPLAY_ORDER_NANOTRASEN_CONSULTANT
	bounty_types = CIV_JOB_SEC

	family_heirlooms = list(/obj/item/book/manual/wiki/security_space_law, /obj/item/gavelhammer, /obj/item/reagent_containers/cup/glass/flask/gold)

	mail_goodies = list(
		/obj/item/cigarette/cigar/havana = 20,
		/obj/item/storage/fancy/cigarettes/cigars/havana = 15,
		/obj/item/reagent_containers/cup/glass/bottle/champagne = 10
	)

	nova_stars_only = FALSE //ss1984 edit original TRUE
	job_flags = STATION_JOB_FLAGS | HEAD_OF_STAFF_JOB_FLAGS
	mind_traits = list(HEAD_OF_STAFF_MIND_TRAITS)
	liver_traits = list(TRAIT_ROYAL_METABOLISM)
	voice_of_god_power = 1.4 //Command staff has authority

/datum/job/nanotrasen_consultant/get_captaincy_announcement(mob/living/captain)
	return "Due to staffing shortages, newly appointed Acting Captain [captain.real_name] on deck!"

/datum/job_department/central_command
	department_head = /datum/job/nanotrasen_consultant
	department_access = list(ACCESS_CENT_GENERAL)

/datum/id_trim/job/nanotrasen_consultant
	assignment = "Nanotrasen Consultant"
	trim_state = "trim_centcom"
	department_color = COLOR_GREEN
	subdepartment_color = COLOR_GREEN
	sechud_icon_state = SECHUD_NT_CONSULTANT
	extra_access = list()
	minimal_access = list(
		ACCESS_CENT_GENERAL,
		ACCESS_CENT_LIVING,
		ACCESS_CHANGE_IDS,
		ACCESS_COMMAND,
		ACCESS_AI_UPLOAD,
		ACCESS_ALL_PERSONAL_LOCKERS,
		ACCESS_KEYCARD_AUTH,
		ACCESS_RC_ANNOUNCE,
		ACCESS_TELEPORTER,
		ACCESS_EVA,
		ACCESS_GATEWAY,
		ACCESS_HOP,
		ACCESS_AUX_BASE,
		ACCESS_CONSTRUCTION,
		ACCESS_ENGINEERING,
		ACCESS_TCOMMS,
		ACCESS_MAINT_TUNNELS,
		ACCESS_MECH_ENGINE,
		ACCESS_MEDICAL,
		ACCESS_MECH_MEDICAL,
		ACCESS_MORGUE,
		ACCESS_PSYCHOLOGY,
		ACCESS_CREMATORIUM,
		ACCESS_HYDROPONICS,
		ACCESS_JANITOR,
		ACCESS_BAR,
		ACCESS_KITCHEN,
		ACCESS_CHAPEL_OFFICE,
		ACCESS_LIBRARY,
		ACCESS_THEATRE,
		ACCESS_LAWYER,
		ACCESS_COURT,
		ACCESS_BRIG_ENTRANCE,
		ACCESS_BRIG,
		ACCESS_SECURITY,
		ACCESS_MECH_SECURITY,
		ACCESS_WEAPONS,
		ACCESS_MECH_SCIENCE,
		ACCESS_SCIENCE,
		ACCESS_CARGO,
		ACCESS_SHIPPING,
		ACCESS_MINING,
		ACCESS_MINING_STATION,
		ACCESS_MINERAL_STOREROOM,
		ACCESS_VAULT,
		ACCESS_QM,
	)
	minimal_wildcard_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CENT_GENERAL,
	)
	template_access = list(
		ACCESS_CENT_CAPTAIN,
	)
	job = /datum/job/nanotrasen_consultant

/datum/outfit/job/nanotrasen_consultant
	name = "Nanotrasen Consultant"
	jobtype = /datum/job/nanotrasen_consultant

	belt = /obj/item/modular_computer/pda/nanotrasen_consultant
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/black
	ears = /obj/item/radio/headset/heads/nanotrasen_consultant/alt
	gloves = /obj/item/clothing/gloves/combat/naval/nanotrasen_consultant/black
	uniform =  /obj/item/clothing/under/rank/nanotrasen_consultant
	suit = /obj/item/clothing/suit/armor/vest/nanotrasen_consultant
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/nanotrasen_consultant
	r_pocket = /obj/item/door_remote/nanotrasen_consultant
	backpack_contents = list(
		/obj/item/melee/baton/telescopic/gold = 1,
		/obj/item/choice_beacon/ntc = 1,
		/obj/item/card/id/departmental_budget/com = 1,
		)

	skillchips = list(/obj/item/skillchip/disk_verifier)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	messenger = /obj/item/storage/backpack/messenger

	implants = list(/obj/item/implant/mindshield)
	accessory = /obj/item/clothing/accessory/medal/gold/nanotrasen_consultant

	chameleon_extras = list(/obj/item/gun/ballistic/automatic/pistol/em1911, /obj/item/stamp/centcom)

	id = /obj/item/card/id/advanced/centcom
	id_trim = /datum/id_trim/job/nanotrasen_consultant

// headset edit

/obj/item/encryptionkey/headset_cent/ccrep
	name = "\improper CentCom representative's encryption key"
	channels = list(RADIO_CHANNEL_CENTCOM = 1, RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_ENGINEERING = 0, RADIO_CHANNEL_SCIENCE = 0, RADIO_CHANNEL_MEDICAL = 0, RADIO_CHANNEL_SUPPLY = 0, RADIO_CHANNEL_SERVICE = 0, RADIO_CHANNEL_ENTERTAINMENT = 0, RADIO_CHANNEL_AI_PRIVATE = 0)

/obj/item/radio/headset/heads/nanotrasen_consultant
	name = "\proper the Nanotrasen consultant's headset"
	desc = "An official Central Command headset. This one is upgraded to be more useful for Nanotrasen Consultant."
	icon = 'modular_ss220/modules/rolesedit/icons/jobs/headsets.dmi'
	icon_state = "cent_headset_long_range"
	overlay_speaker_idle = "headset_up_cent_long_range"
	overlay_mic_idle = "headset_up_cent_long_range"
	keyslot = new /obj/item/encryptionkey/headset_cent/ccrep
	keyslot2 = null

/obj/item/radio/headset/heads/nanotrasen_consultant/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(slot & ITEM_SLOT_EARS)
		ADD_TRAIT(user, TRAIT_SPEECH_BOOSTER, CLOTHING_TRAIT)

/obj/item/radio/headset/heads/nanotrasen_consultant/dropped(mob/living/carbon/human/user)
	. = ..()
	REMOVE_TRAIT(user, TRAIT_SPEECH_BOOSTER, CLOTHING_TRAIT)

/obj/item/radio/headset/heads/nanotrasen_consultant/alt
	name = "\proper the Nanotrasen consultant's bowman headset"
	desc = "An official Central Command headset. This one is upgraded to be more useful for Nanotrasen Consultant. Protects ears from flashbangs."
	icon_state = "cent_headset_alt_long_range"
	overlay_speaker_idle = "headset_up_cent_alt_long_range"
	overlay_mic_idle = "headset_up_cent_alt_long_range"

/obj/item/radio/headset/heads/nanotrasen_consultant/alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/clothing/gloves/combat/naval/nanotrasen_consultant/black
	name = "\improper CentCom combat gloves"

/obj/item/door_remote/nanotrasen_consultant
	name = "Nanotrasen Consultant's door remote"
	desc = "Remotely controls airlocks. This remote has specific access. Despite that, holding it makes you feel insecure for some reason."
	icon = 'modular_ss220/modules/rolesedit/icons/jobs/remote.dmi'
	department = "ntr"
	region_access = REGION_NTR
	our_domain = list( /area/station/ )

/obj/item/card/id/departmental_budget/com
	icon = 'modular_ss220/modules/rolesedit/icons/jobs/card.dmi'
	icon_state = "com_budget"
	department_ID = ACCOUNT_CMD
	department_name = ACCOUNT_CMD_NAME
	budget_name = "Command Budget"
	departament_access = ACCESS_CENT_GENERAL
	radio_channel = RADIO_CHANNEL_CENTCOM

/obj/structure/closet/secure_closet/nanotrasen_consultant/PopulateContents()
	new /obj/item/storage/backpack/satchel/leather(src)
	new /obj/item/clothing/neck/petcollar(src)
	new /obj/item/pet_carrier(src)
	new /obj/item/clothing/suit/armor/vest(src)
	new /obj/item/computer_disk/command/captain(src)
	new /obj/item/radio/headset/heads/nanotrasen_consultant/alt(src)
	new /obj/item/radio/headset/heads/nanotrasen_consultant(src)
	new /obj/item/storage/photo_album/personal(src)
	new /obj/item/bedsheet/centcom(src)
	new /obj/item/storage/bag/garment/nanotrasen_consultant(src)
	new /obj/item/mod/control/pre_equipped/corporate_official(src)
