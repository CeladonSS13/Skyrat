/obj/item/encryptionkey/heads/captain
	channels = list(RADIO_CHANNEL_COMMAND = 1, RADIO_CHANNEL_SECURITY = 1, RADIO_CHANNEL_PRISON = 1, RADIO_CHANNEL_ENGINEERING = 0, RADIO_CHANNEL_SCIENCE = 0, RADIO_CHANNEL_MEDICAL = 0, RADIO_CHANNEL_SUPPLY = 0, RADIO_CHANNEL_SERVICE = 0)

//bridge officer edit

#ifndef CAN_ROLL_ALWAYS // includes from code\datums\station_traits\job_traits.dm
	#define CAN_ROLL_ALWAYS 1 //always can roll for antag
#endif
#ifndef CAN_ROLL_PROTECTED
	#define CAN_ROLL_PROTECTED 2 //can roll if config lets protected roles roll
#endif
#ifndef CAN_ROLL_NEVER
	#define CAN_ROLL_NEVER 3 //never roll antag
#endif

/datum/job/bridge_assistant
	title = JOB_BRIDGE_ASSISTANT
	description = "Watch over the Bridge, and spend your days commanding Bridge Assistants to brew coffee for higher-ups."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD | DEADMIN_POSITION_SECURITY
	department_head = list(JOB_CAPTAIN, JOB_NT_REP)
	default_radio_channel = RADIO_CHANNEL_COMMAND
	faction = FACTION_STATION
	total_positions = 0
	spawn_positions = 0
	supervisors = "Central Command, Nanotrasen Officials and Station Captain"
	job_flags = STATION_JOB_FLAGS | STATION_TRAIT_JOB_FLAGS
	human_authority = JOB_AUTHORITY_NON_HUMANS_ALLOWED
	nova_stars_only = FALSE
	paycheck = PAYCHECK_CREW * 1.5
	paycheck_department = ACCOUNT_CMD
	antagonist_restricted = TRUE
	minimal_player_age = 10
	exp_requirements = 250
	exp_required_type = EXP_TYPE_CREW
	exp_granted_type = EXP_TYPE_CREW
	required_languages = list(/datum/language/common = LANGUAGE_SPOKEN)
	outfit = /datum/outfit/job/bridge_assistant
	plasmaman_outfit = /datum/outfit/job/bridge_assistant/plasmaman
	department_for_prefs = null
	liver_traits = list(TRAIT_PRETENDER_ROYAL_METABOLISM)
	mind_traits = TRAIT_FAST_TYING
	voice_of_god_power = 1.2 //Almost Command Member
	config_tag = "BRIDGE_OFFICER"
	allow_bureaucratic_error = FALSE
	departments_list = list(
		/datum/job_department/central_command,
		/datum/job_department/command,
		)

	family_heirlooms = list(/obj/item/banner/command/mundane)
	mail_goodies = list(
		/obj/item/storage/fancy/cigarettes = 1,
		/obj/item/book/manual/wiki/security_space_law = 1,
		/obj/item/pen/fountain = 1,
	)

/datum/job/bridge_assistant/after_spawn(mob/living/spawned, client/player_client)
	. = ..()
	var/mob/living/carbon/bridgie = spawned
	if(istype(bridgie))
		bridgie.gain_trauma(/datum/brain_trauma/special/axedoration)

/datum/id_trim/job/bridge_assistant
	assignment = JOB_BRIDGE_ASSISTANT
	trim_state = "trim_securityofficer"
	department_color = COLOR_SECURITY_RED
	subdepartment_color = COLOR_COMMAND_BLUE
	sechud_icon_state = SECHUD_OLD_SEC
	minimal_access = list(
		ACCESS_COMMAND,
		ACCESS_EVA,
		ACCESS_GATEWAY,
		ACCESS_RC_ANNOUNCE,
		ACCESS_KEYCARD_AUTH,
		ACCESS_TELEPORTER,
		ACCESS_JANITOR,
		ACCESS_MINERAL_STOREROOM,
		ACCESS_MAINT_TUNNELS,
		ACCESS_TECH_STORAGE,
		ACCESS_SECURITY,
		ACCESS_WEAPONS,
	)
	extra_access = list(
		ACCESS_TCOMMS,
		ACCESS_VAULT,
		ACCESS_BAR,
		ACCESS_KITCHEN,
		ACCESS_EXTERNAL_AIRLOCKS,
	)
	template_access = list(
		ACCESS_CENT_CAPTAIN,
	)
	job = /datum/job/bridge_assistant
	honorifics = list("Upper Underling", "Officer", "Head Mate")
	honorific_positions = HONORIFIC_POSITION_FIRST | HONORIFIC_POSITION_LAST | HONORIFIC_POSITION_FIRST_FULL | HONORIFIC_POSITION_NONE

/obj/item/modular_computer/pda/bridge_assistant
	name = "bridge officer PDA"
	greyscale_colors = "#374f7e#a92323"
	starting_programs = list(
		/datum/computer_file/program/status,
		/datum/computer_file/program/records/security
	)

/datum/outfit/job/bridge_assistant
	name = "Bridge Officer"
	jobtype = /datum/job/bridge_assistant
	id_trim = /datum/id_trim/job/bridge_assistant
	id = /obj/item/card/id/advanced/silver
	uniform = /obj/item/clothing/under/rank/bridge_officer
	neck = /obj/item/clothing/neck/bowtie
	suit = /obj/item/clothing/suit/armor/vest/alt
	belt = /obj/item/melee/baton/telescopic/bronze
	ears = /obj/item/radio/headset/bridge_officer
	glasses = /obj/item/clothing/glasses/sunglasses/oval
	gloves = /obj/item/clothing/gloves/tackler/peacekeeper
	head = /obj/item/clothing/head/hats/caphat/parade/fedcap/black
	shoes = /obj/item/clothing/shoes/cowboy/black
	l_pocket = /obj/item/gun/energy/e_gun/mini
	r_pocket = /obj/item/assembly/flash/handheld
	implants = list(/obj/item/implant/mindshield)
	backpack_contents = list(
		/obj/item/modular_computer/pda/bridge_assistant = 1,
		/obj/item/choice_beacon/job_locker/bridge_officer = 1,
		/obj/item/choice_beacon/coffee = 1,
	)

/datum/outfit/job/bridge_assistant/plasmaman
	name = "Bridge Officer (Plasmaman)"
	uniform = /obj/item/clothing/under/plasmaman/security/nova
	gloves = /obj/item/clothing/gloves/color/plasmaman/black
	head = /obj/item/clothing/head/helmet/space/plasmaman/security/nova
	belt = /obj/item/melee/baton/telescopic/bronze
	l_pocket = /obj/item/gun/energy/e_gun/mini
	r_pocket = /obj/item/assembly/flash/handheld
	backpack_contents = list(
		/obj/item/modular_computer/pda/bridge_assistant = 1,
		/obj/item/choice_beacon/job_locker/bridge_officer = 1,
		/obj/item/choice_beacon/coffee = 1,
		/obj/item/clothing/head/hats/caphat/parade/fedcap/black = 1,
	)

/datum/outfit/plasmaman/bridge_assistant
	head = /obj/item/clothing/head/helmet/space/plasmaman/security/nova
	uniform = /obj/item/clothing/under/plasmaman/security/nova
	gloves = /obj/item/clothing/gloves/color/plasmaman/black

// bridge assistant
/datum/station_trait/job/bridge_assistant
	weight = 2
	can_roll_antag = CAN_ROLL_ALWAYS
	job_to_add = /datum/job/bridge_assistant_1984

/obj/item/modular_computer/pda/bridge_assistant_1984
	name = "bridge assistant PDA"
	greyscale_colors = "#374f7e#a92323"
	starting_programs = list(
		/datum/computer_file/program/status,
	)

/datum/id_trim/job/bridge_assistant_1984
	assignment = JOB_BRIDGE_ASSISTANT_1984
	trim_state = "trim_assistant"
	department_color = COLOR_COMMAND_BLUE
	subdepartment_color = COLOR_COMMAND_BLUE
	sechud_icon_state = SECHUD_BRIDGE_ASSISTANT
	minimal_access = list(
		ACCESS_COMMAND,
		ACCESS_EVA,
		ACCESS_GATEWAY,
		ACCESS_MAINT_TUNNELS,
		ACCESS_RC_ANNOUNCE,
		ACCESS_TELEPORTER,
		ACCESS_WEAPONS,
	)
	extra_access = list()
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
	)
	job = /datum/job/bridge_assistant_1984
	honorifics = list("Underling", "Assistant", "Mate")
	honorific_positions = HONORIFIC_POSITION_FIRST | HONORIFIC_POSITION_LAST | HONORIFIC_POSITION_FIRST_FULL | HONORIFIC_POSITION_NONE

/datum/job/bridge_assistant_1984
	title = JOB_BRIDGE_ASSISTANT_1984
	description = "Watch over the Bridge, command its consoles, and spend your days brewing coffee for higher-ups."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	department_head = list(JOB_CAPTAIN, JOB_CENTCOM_OFFICIAL)
	faction = FACTION_STATION
	total_positions = 0
	spawn_positions = 0
	supervisors = "the Nanotrasen Officials, Station Captain, Bridge Officer and in non-Bridge related situations the other heads"
	minimal_player_age = 7
	exp_requirements = 300
	exp_required_type = EXP_TYPE_CREW
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "BRIDGE_ASSISTANT"
	nova_stars_only = FALSE
	paycheck = PAYCHECK_CREW
	paycheck_department = ACCOUNT_CIV
	antagonist_restricted = FALSE
	allow_bureaucratic_error = FALSE
	job_flags = STATION_JOB_FLAGS | STATION_TRAIT_JOB_FLAGS
	liver_traits = list(TRAIT_PRETENDER_ROYAL_METABOLISM)
	rpg_title = "Royal Guard"
	human_authority = JOB_AUTHORITY_NON_HUMANS_ALLOWED
	display_order = JOB_DISPLAY_ORDER_BRIDGE_ASSISTANT
	outfit = /datum/outfit/job/bridge_assistant_1984
	plasmaman_outfit = /datum/outfit/job/bridge_assistant_1984/plasmaman
	alt_titles = list(
		"Bridge Assistant",
	)

	department_for_prefs = null
	departments_list = list(
		/datum/job_department/command,
		)

	family_heirlooms = list(/obj/item/banner/command/mundane)
	mail_goodies = list(
		/obj/item/storage/fancy/cigarettes = 1,
		/obj/item/pen/fountain = 1,
	)

/datum/job/bridge_assistant_1984/get_roundstart_spawn_point()
	var/list/chair_turfs = list()
	var/list/possible_turfs = list()
	var/area/bridge = GLOB.areas_by_type[/area/station/command/bridge]
	if(isnull(bridge))
		return ..() //if no bridge, spawn on the arrivals shuttle (but also what the fuck)
	for (var/list/zlevel_turfs as anything in bridge.get_zlevel_turf_lists())
		for (var/turf/possible_turf as anything in zlevel_turfs)
			if(possible_turf.is_blocked_turf())
				continue
			if(locate(/obj/structure/chair) in possible_turf)
				chair_turfs += possible_turf
				continue
			possible_turfs += possible_turf
	if(length(chair_turfs))
		return pick(chair_turfs) //prioritize turfs with a chair
	if(length(possible_turfs))
		return pick(possible_turfs) //if none, just pick a random turf in the bridge
	return ..() //if the bridge has no turfs, spawn on the arrivals shuttle

//outfit datum
/datum/outfit/job/bridge_assistant_1984
	name = "Bridge Assistant"

	jobtype = /datum/job/bridge_assistant_1984
	id_trim = /datum/id_trim/job/bridge_assistant_1984
	id = /obj/item/card/id/advanced
	uniform = /obj/item/clothing/under/trek/command/next
	neck = /obj/item/clothing/neck/large_scarf/blue
	belt = /obj/item/storage/belt/utility/full/inducer
	ears = /obj/item/radio/headset/headset_com
	glasses = /obj/item/clothing/glasses/sunglasses
	gloves = /obj/item/clothing/gloves/fingerless
	head = /obj/item/clothing/head/soft/black
	shoes = /obj/item/clothing/shoes/laceup
	l_pocket = /obj/item/gun/energy/e_gun/mini
	r_pocket = /obj/item/assembly/flash/handheld
	backpack_contents = list(
		/obj/item/modular_computer/pda/bridge_assistant_1984 = 1,
	)

/datum/outfit/job/bridge_assistant_1984/plasmaman
	name = "Bridge Assistant (Plasmaman)"
	uniform = /obj/item/clothing/under/plasmaman/enviroslacks
	gloves = /obj/item/clothing/gloves/color/plasmaman/black
	head = /obj/item/clothing/head/helmet/space/plasmaman/black
	neck = /obj/item/clothing/neck/large_scarf/blue
	ears = /obj/item/radio/headset/headset_com
	belt = /obj/item/storage/belt/utility/full/inducer
	l_pocket = /obj/item/gun/energy/e_gun/mini
	r_pocket = /obj/item/assembly/flash/handheld
	backpack_contents = list(
		/obj/item/modular_computer/pda/bridge_assistant_1984 = 1,
	)
