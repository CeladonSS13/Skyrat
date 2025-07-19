/obj/item/gun/ballistic/automatic/pistol/em1911
	name = "energy M1911"
	desc = "A special laser pistol, designed to look like the M1911."
	icon = 'modular_ss220/modules/weapons_addon/icons/guns.dmi'
	icon_state = "m1911"
	lefthand_file = 'modular_ss220/modules/weapons_addon/icons/guns_lefthand.dmi'
	righthand_file = 'modular_ss220/modules/weapons_addon/icons/guns_righthand.dmi'
	inhand_icon_state = "colt"
	accepted_magazine_type = /obj/item/ammo_box/magazine/recharge/m1911
	force = 5
	bolt_type = BOLT_TYPE_OPEN
	show_bolt_icon = FALSE
	weapon_weight = WEAPON_LIGHT
	w_class = WEIGHT_CLASS_NORMAL
	can_suppress = FALSE
	fire_sound = 'sound/items/weapons/laser.ogg'
	rack_sound = 'sound/items/weapons/gun/pistol/rack.ogg'
	lock_back_sound = 'sound/items/weapons/gun/pistol/slide_lock.ogg'
	bolt_drop_sound = 'sound/items/weapons/gun/pistol/slide_drop.ogg'

/obj/item/ammo_box/magazine/recharge/m1911
	name = "energy m1911 cell (lethal)"
	desc = "A rechargeable, detachable battery that serves as a magazine for laser pistols."
	icon = 'modular_ss220/modules/weapons_addon/icons/ammo.dmi'
	icon_state = "l45-8"
	base_icon_state = "l45"
	ammo_type = /obj/item/ammo_casing/laser/m1911
	max_ammo = 8
	multiple_sprites = AMMO_BOX_PER_BULLET
	multiple_sprite_use_base = TRUE
	caliber = "em1911ll"


/obj/item/ammo_box/magazine/recharge/m1911/disabler
	name = "energy m1911 cell (nonlethal)"
	ammo_type = /obj/item/ammo_casing/laser/m1911/disabler
	icon_state = "d45-8"
	base_icon_state = "d45"
	caliber = "em1911d"

/obj/item/ammo_casing/laser/m1911
	can_be_printed = FALSE
	projectile_type = /obj/projectile/beam/m1911
	fire_sound = 'sound/items/weapons/laser.ogg'
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/red
	caliber = "em1911ll"

/obj/item/ammo_casing/laser/m1911/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/delete_on_drop)


/obj/item/ammo_casing/laser/m1911/disabler
	projectile_type = /obj/projectile/beam/m1911/disabler
	fire_sound = 'sound/items/weapons/taser2.ogg'
	harmful = FALSE
	firing_effect_type = /obj/effect/temp_visual/dir_setting/firing_effect/blue
	caliber = "em1911d"

/obj/projectile/beam/m1911
	name = "focused laser beam"
	hitscan = FALSE
	speed = 1.6
	damage = 20
	wound_bonus = -40
	icon_state = "laser"
	hitsound = 'sound/items/weapons/sear.ogg'
	hitsound_wall = 'sound/items/weapons/effects/searwall.ogg'
	tracer_type = /obj/effect/projectile/tracer/laser
	muzzle_type = /obj/effect/projectile/muzzle/laser
	impact_type = /obj/effect/projectile/impact/laser
	impact_effect_type = /obj/effect/temp_visual/impact_effect/red_laser

/obj/projectile/beam/m1911/disabler
	name = "focused disabler beam"
	icon_state = "omnilaser"
	damage = 30
	damage_type = STAMINA
	armor_flag = ENERGY
	hitsound = 'sound/items/weapons/sear_disabler.ogg'
	impact_effect_type = /obj/effect/temp_visual/impact_effect/blue_laser
	light_color = LIGHT_COLOR_BLUE
	tracer_type = /obj/effect/projectile/tracer/disabler
	muzzle_type = /obj/effect/projectile/muzzle/disabler
	impact_type = /obj/effect/projectile/impact/disabler



/obj/item/gun/ballistic/automatic/pistol/em1911/nomag
	spawnwithmagazine = FALSE


/obj/item/storage/toolbox/guncase/nova/pistol/ntc
	name = "Nanotrasen Consultant's Energy M1911 guncase"

/obj/item/storage/toolbox/guncase/nova/pistol/ntc/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol/em1911/nomag(src)
	new /obj/item/ammo_box/magazine/recharge/m1911/disabler(src)
	new /obj/item/ammo_box/magazine/recharge/m1911/disabler(src)
	new /obj/item/ammo_box/magazine/recharge/m1911(src)
	new /obj/item/ammo_box/magazine/recharge/m1911(src)

// NT rep override

/obj/item/choice_beacon/ntc
	company_source = "Nanotrasen Corporation"

/obj/item/choice_beacon/ntc/generate_display_names()
	var/static/list/selectable_gun_types = list(
		"Energy M1911 Pistol Set" = /obj/item/storage/toolbox/guncase/nova/pistol/ntc,
	)

	return selectable_gun_types

/datum/job/nanotrasen_consultant
	title = JOB_NT_REP
	description = "Represent Nanotrasen on the station, argue with the HoS about why he can't just field execute people for petty theft, get drunk in your office."
	department_head = list(JOB_CENTCOM)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "Central Command"
	minimal_player_age = 14
	exp_requirements = 600
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "NANOTRASEN_CONSULTANT"

	department_for_prefs = /datum/job_department/captain

	departments_list = list(
		/datum/job_department/command,
		/datum/job_department/central_command
	)

	outfit = /datum/outfit/job/nanotrasen_consultant
	plasmaman_outfit = /datum/outfit/plasmaman/nanotrasen_consultant

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_CMD

	display_order = JOB_DISPLAY_ORDER_NANOTRASEN_CONSULTANT
	bounty_types = CIV_JOB_SEC

	family_heirlooms = list(/obj/item/book/manual/wiki/security_space_law)

	mail_goodies = list(
		/obj/item/cigarette/cigar/havana = 20,
		/obj/item/storage/fancy/cigarettes/cigars/havana = 15,
		/obj/item/reagent_containers/cup/glass/bottle/champagne = 10
	)

	nova_stars_only = FALSE //ss1984 edit original TRUE
	job_flags = STATION_JOB_FLAGS | JOB_BOLD_SELECT_TEXT | JOB_CANNOT_OPEN_SLOTS

/datum/id_trim/job/nanotrasen_consultant
	assignment = "Nanotrasen Consultant"
	trim_state = "trim_centcom"
	department_color = COLOR_GREEN
	subdepartment_color = COLOR_GREEN
	sechud_icon_state = SECHUD_NT_CONSULTANT
	extra_access = list()
	minimal_access = list(
		ACCESS_AI_UPLOAD,
		ACCESS_ALL_PERSONAL_LOCKERS,
		ACCESS_AUX_BASE,
		ACCESS_BAR,
		ACCESS_BRIG_ENTRANCE,
		ACCESS_CENT_GENERAL,
		ACCESS_CHANGE_IDS,
		ACCESS_CHAPEL_OFFICE,
		ACCESS_COMMAND,
		ACCESS_CONSTRUCTION,
		ACCESS_CREMATORIUM,
		ACCESS_COURT,
		ACCESS_ENGINEERING,
		ACCESS_EVA,
		ACCESS_GATEWAY,
		ACCESS_HOP,
		ACCESS_HYDROPONICS,
		ACCESS_JANITOR,
		ACCESS_KEYCARD_AUTH,
		ACCESS_KITCHEN,
		ACCESS_LAWYER,
		ACCESS_LIBRARY,
		ACCESS_MAINT_TUNNELS,
		ACCESS_MEDICAL,
		ACCESS_MECH_ENGINE,
		ACCESS_MECH_MEDICAL,
		ACCESS_MECH_SCIENCE,
		ACCESS_MECH_SECURITY,
		ACCESS_MINING_STATION,
		ACCESS_MINERAL_STOREROOM,
		ACCESS_MORGUE,
		ACCESS_PSYCHOLOGY,
		ACCESS_RC_ANNOUNCE,
		ACCESS_SCIENCE,
		ACCESS_SECURITY,
		ACCESS_TELEPORTER,
		ACCESS_THEATRE,
		ACCESS_VAULT,
		ACCESS_WEAPONS,
	)
	minimal_wildcard_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CENT_GENERAL,
	)
	template_access = list(
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
	)
	job = /datum/job/nanotrasen_consultant

/datum/outfit/job/nanotrasen_consultant
	name = "Nanotrasen Consultant"
	jobtype = /datum/job/nanotrasen_consultant

	belt = /obj/item/modular_computer/pda/nanotrasen_consultant
	glasses = /obj/item/clothing/glasses/sunglasses
	ears = /obj/item/radio/headset/heads/nanotrasen_consultant
	gloves = /obj/item/clothing/gloves/combat/naval/nanotrasen_consultant/black
	uniform =  /obj/item/clothing/under/rank/nanotrasen_consultant
	suit = /obj/item/clothing/suit/armor/vest/nanotrasen_consultant
	shoes = /obj/item/clothing/shoes/jackboots
	head = /obj/item/clothing/head/nanotrasen_consultant
	backpack_contents = list(
		/obj/item/melee/baton/telescopic/gold = 1,
		/obj/item/choice_beacon/ntc = 1,
		)

	skillchips = list(/obj/item/skillchip/disk_verifier)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	messenger = /obj/item/storage/backpack/messenger

	implants = list(/obj/item/implant/mindshield)
	accessory = /obj/item/clothing/accessory/medal/gold/nanotrasen_consultant

	chameleon_extras = list(/obj/item/gun/energy/e_gun, /obj/item/stamp/centcom)

	id = /obj/item/card/id/advanced/centcom
	id_trim = /datum/id_trim/job/nanotrasen_consultant
