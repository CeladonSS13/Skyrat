// blueshield guns override
/obj/item/gun/energy/laser/hellgun/blueshield
	pin = /obj/item/firing_pin/implant/mindshield

/obj/item/gun/energy/laser/thermal/inferno/blueshield
	pin = /obj/item/firing_pin/implant/mindshield

/obj/item/gun/energy/laser/thermal/cryo/blueshield
	pin = /obj/item/firing_pin/implant/mindshield

/obj/item/storage/belt/holster/energy/thermal/blueshield

/obj/item/storage/belt/holster/energy/thermal/blueshield/PopulateContents()
	generate_items_inside(list(
		/obj/item/gun/energy/laser/thermal/inferno/blueshield = 1,
		/obj/item/gun/energy/laser/thermal/cryo/blueshield = 1,
	),src)

/obj/item/choice_beacon/blueshield
	name = "weaponry delivery bluespace beacon"
	desc = "A single use beacon to deliver a gunset of your choice. Please only call this in your office"
	company_source = "Sol and Nanotrasen collaboration in defense"
	company_message = span_bold("Supply Pod incoming, please stand by.")
	w_class = WEIGHT_CLASS_SMALL

/obj/item/choice_beacon/blueshield/generate_display_names()
	var/static/list/selectable_gun_types = list(
		"Custom Hellfire Laser Rifle" = /obj/item/gun/energy/laser/hellgun/blueshield,
		"Blueshield's CMG-2 Gunset" = /obj/item/storage/toolbox/guncase/nova/blueshield_cmg,
		"Blueshield's Thermal Holster" = /obj/item/storage/belt/holster/energy/thermal/blueshield,
	)

	return selectable_gun_types

//misc overrides
/obj/structure/closet/secure_closet/blueshield
	req_access = list(ACCESS_CENT_GENERAL)

//medkit
/obj/item/reagent_containers/hypospray/combat/blueshield
	name = "blueshield hypospray injector"
	desc = "A modified air-needle autoinjector for use in combat situations. Prefilled with synthetic medical nanites for healing synth peoples."
	inhand_icon_state = "nanite_hypo"
	icon_state = "nanite_hypo"
	base_icon_state = "nanite_hypo"
	volume = 60
	possible_transfer_amounts = list(5,10)
	list_reagents = list(/datum/reagent/medicine/nanite_slurry = 40, /datum/reagent/dinitrogen_plasmide = 10)

/obj/item/storage/medkit/tactical/blueshield
	name = "blueshield combat medical kit"
	desc = "Combat medic to the rescue!"
	color = "#AAAAFF"

/obj/item/storage/medkit/tactical/blueshield/PopulateContents()
	if(empty)
		return
	new /obj/item/stack/medical/gauze(src)
	new /obj/item/stack/medical/bruise_pack(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/stack/medical/synth_repair(src)
	new /obj/item/stack/medical/wound_recovery/robofoam_super(src)
	new /obj/item/reagent_containers/hypospray/combat/blueshield(src)
	new /obj/item/healthanalyzer/simple(src)
	new /obj/item/healthanalyzer(src)

//modsuit
/datum/armor/mod_theme_blueshield
	melee = 40
	bullet = 30
	laser = 30
	energy = 40
	bomb = 50
	bio = 100
	fire = 100
	acid = 100
	wound = 20

/datum/mod_theme/blueshield
	armor_type = /datum/armor/mod_theme_blueshield
	slowdown_deployed = 0.25
	resistance_flags = FIRE_PROOF|ACID_PROOF
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	siemens_coefficient = 0
	complexity_max = DEFAULT_MAX_COMPLEXITY + 3
	inbuilt_modules = list(/obj/item/mod/module/shove_blocker/locked)

/obj/item/mod/control/pre_equipped/blueshield
	req_access = list(ACCESS_CENT_GENERAL)
	applied_modules = list(
		/obj/item/mod/module/quick_cuff,
		/obj/item/mod/module/storage,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/projectile_dampener,
		/obj/item/mod/module/quick_carry,
		/obj/item/mod/module/holster,
		/obj/item/mod/module/headprotector,
	)

//clothing
/datum/armor/gloves_combat/blueshield
	fire = 100
	acid = 100
	bio = 90

/obj/item/clothing/gloves/tackler/combat/insulated/blueshield
	name = "combat gloves"
	desc = "These tactical gloves appear to be unique, made out of double woven durathread fibers which make it fireproof as well as acid resistant"
	icon = 'modular_nova/master_files/icons/obj/clothing/gloves.dmi'
	icon_state = "combat"
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/hands.dmi'
	resistance_flags = FIRE_PROOF | ACID_PROOF
	armor_type = /datum/armor/gloves_combat/blueshield

/datum/armor/helmet_blueshield
	melee = 40
	bullet = 35
	laser = 30
	energy = 35
	bomb = 30
	fire = 80
	acid = 80
	wound = 15

/obj/item/clothing/head/beret/blueshield
	armor_type = /datum/armor/helmet_blueshield

/datum/armor/cosmetic_blueshield
	melee = 35
	bullet = 30
	laser = 30
	energy = 35
	bomb = 25
	fire = 60
	acid = 60
	wound = 10

/obj/item/clothing/head/soft/blueshield
	armor_type = /datum/armor/cosmetic_blueshield

/datum/armor/suit_armor/blueshield
	melee = 40
	bullet = 35
	laser = 30
	energy = 35
	bomb = 30
	fire = 80
	acid = 80
	wound = 15

/obj/item/clothing/suit/armor/vest/blueshield
	armor_type = /datum/armor/suit_armor/blueshield

/datum/armor/wintercoat_blueshield
	melee = 40
	bullet = 35
	laser = 30
	energy = 45
	bomb = 35
	fire = 60
	acid = 60
	wound = 15

/obj/item/clothing/suit/hooded/wintercoat/nova/blueshield
	armor_type = /datum/armor/wintercoat_blueshield

/datum/armor/winterhood_blueshield
	melee = 40
	bullet = 35
	laser = 30
	energy = 45
	bomb = 35
	fire = 60
	acid = 60
	wound = 15

/obj/item/clothing/head/hooded/winterhood/nova/blueshield
	armor_type = /datum/armor/winterhood_blueshield

//job and outfit
/datum/outfit/job/blueshield
	name = "Blueshield"
	jobtype = /datum/job/blueshield
	id = /obj/item/card/id/advanced/centcom
	id_trim = /datum/id_trim/job/blueshield
	head = /obj/item/clothing/head/beret/blueshield
	ears = /obj/item/radio/headset/headset_bs/alt
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/blue
	uniform = /obj/item/clothing/under/rank/blueshield
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated/blueshield
	suit = /obj/item/clothing/suit/armor/vest/blueshield/jacket
	backpack = /obj/item/storage/backpack/blueshield
	satchel = /obj/item/storage/backpack/satchel/blueshield
	duffelbag = /obj/item/storage/backpack/duffelbag/blueshield
	messenger = /obj/item/storage/backpack/messenger/blueshield
	belt = /obj/item/modular_computer/pda/blueshield
	shoes = /obj/item/clothing/shoes/jackboots
	implants = list(/obj/item/implant/mindshield)
	box = /obj/item/storage/box/survival/security
	r_pocket = /obj/item/choice_beacon/blueshield
	l_pocket = /obj/item/sensor_device/blueshield
	backpack_contents = list(
							/obj/item/storage/medkit/tactical/blueshield = 1,
	)

/datum/job/blueshield
	title = JOB_BLUESHIELD
	description = "Protect heads of staff, get your fancy gun stolen, cry as the captain touches the supermatter."
	supervisors = "Central Command and the Nanotrasen Consultant"
	department_head = list(JOB_NT_REP)
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	minimal_player_age = 7
	exp_requirements = 2400
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "BLUESHIELD"

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_CMD

	outfit = /datum/outfit/job/blueshield
	plasmaman_outfit = /datum/outfit/plasmaman/blueshield
	display_order = JOB_DISPLAY_ORDER_BLUESHIELD
	bounty_types = CIV_JOB_SEC

	department_for_prefs = /datum/job_department/captain

	departments_list = list(
		/datum/job_department/central_command,
		/datum/job_department/command,
	)
	liver_traits = list(TRAIT_PRETENDER_ROYAL_METABOLISM)

	family_heirlooms = list(/obj/item/bedsheet/captain, /obj/item/clothing/head/beret/blueshield)

	mail_goodies = list(
		/obj/item/storage/fancy/cigarettes/cigars/havana = 10,
		/obj/item/stack/spacecash/c500 = 3,
		/obj/item/disk/nuclear/fake/obvious = 2,
		/obj/item/clothing/head/collectable/captain = 4,
	)

	nova_stars_only = FALSE // ss1984 edit original TRUE
	job_flags = STATION_JOB_FLAGS | JOB_CANNOT_OPEN_SLOTS

/datum/id_trim/job/blueshield
	assignment = "Blueshield"
	trim_icon = 'modular_nova/master_files/icons/obj/card.dmi'
	trim_state = "trim_blueshield"
	department_color = COLOR_COMMAND_BLUE
	subdepartment_color = COLOR_CENTCOM_BLUE
	sechud_icon_state = SECHUD_BLUESHIELD
	extra_access = list(
		ACCESS_CHANGE_IDS,
		ACCESS_COURT,

	)
	minimal_access = list(
		ACCESS_ALL_PERSONAL_LOCKERS,
		ACCESS_BRIG_ENTRANCE,
		ACCESS_CENT_GENERAL,
		ACCESS_GATEWAY,
		ACCESS_BRIG,
		ACCESS_CARGO,
		ACCESS_SECURITY,
		ACCESS_COMMAND,
		ACCESS_CONSTRUCTION,
		ACCESS_ENGINEERING,
		ACCESS_EVA,
		ACCESS_MAINT_TUNNELS,
		ACCESS_MEDICAL,
		ACCESS_MINERAL_STOREROOM,
		ACCESS_SCIENCE,
		ACCESS_TELEPORTER,
		ACCESS_WEAPONS,
	)
	minimal_wildcard_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CENT_GENERAL,
	)
	template_access = list(
		ACCESS_CENT_LIVING,
		ACCESS_CAPTAIN,
	)
	job = /datum/job/blueshield
