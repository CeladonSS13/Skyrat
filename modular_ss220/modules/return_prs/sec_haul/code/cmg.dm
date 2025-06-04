/obj/item/gun/ballistic/automatic/cmg
	name = "\improper NT CMG-2 PDW"
	desc = "A bullpup, two-round burst PDW chambered in 9x25mm, developed by Nanotrasen R&D and based on a licensed Scarborough Arms design. \
	It features a folding stock and comes pre-attached with a dot sight. Unfortunately, the recoil management system reduces the \
	stopping power of individual rounds, but the manufacturer insists that quirk can be mitigated by not missing."
	icon_state = "cmg1"
	icon = 'modular_ss220/modules/return_prs/sec_haul/icons/guns.dmi'
	inhand_icon_state = "c20r"
	selector_switch_icon = TRUE
	accepted_magazine_type = /obj/item/ammo_box/magazine/multi_sprite/cmg
	fire_delay = 2
	burst_size = 2
	pin = /obj/item/firing_pin/implant/mindshield
	mag_display = TRUE
	mag_display_ammo = TRUE
	empty_indicator = TRUE
	w_class = WEIGHT_CLASS_BULKY
	projectile_damage_multiplier = 0.5
	// raw outputs:
	// lethal: 30 * 0.5 = 15
	// AP: 27 * 0.5 = 13.5
	// HP: 40 * 0.5  = 20
	// INC: 15 * 0.5 = 7.5
	// rubber: 5 * 0.5 = 2.5 brute, 25 * 0.5 = 12.5 stam
	// IHDF: 30 * 0.5 = 15 stam

	/// what sound do we play when finished adjusting the stock?
	var/folding_sound = 'sound/items/weapons/batonextend.ogg'
	/// is our stock collapsed?
	var/folded = FALSE
	/// how long does it take to extend/collapse the stock
	var/toggle_time = 1 SECONDS
	/// what's our spread with our extended stock (mild varedit compatibility I Guess)?
	var/unfolded_spread = 0
	/// what's our spread with a folded stock (see above comment)?
	var/folded_spread = 20

/obj/item/gun/ballistic/automatic/cmg/examine(mob/user)
	. = ..()
	. += span_notice("<b>Ctrl-click</b> to [folded ? "extend" : "collapse"] the stock.")

/obj/item/gun/ballistic/automatic/cmg/item_ctrl_click(mob/user)
	if((!user.is_holding(src)) || (item_flags & IN_STORAGE))
		return CLICK_ACTION_BLOCKING
	toggle_stock(user)

/obj/item/gun/ballistic/automatic/cmg/proc/toggle_stock(mob/user, forced)
	if(!user && forced) // for the possible case of having every shipped CMG be pre-folded
		folded = !folded
		update_fold_stats()
		return
	balloon_alert(user, "[folded ? "extending" : "collapsing"] stock...")
	if(!do_after(user, toggle_time))
		balloon_alert(user, "interrupted!")
		return
	folded = !folded
	update_fold_stats()
	balloon_alert(user, "stock [folded ? "collapsed" : "extended"]")
	playsound(src.loc, folding_sound, 30, 1)

/obj/item/gun/ballistic/automatic/cmg/proc/update_fold_stats()
	if(folded)
		spread = folded_spread
		if(suppressed)
			w_class = WEIGHT_CLASS_BULKY
		else
			w_class = WEIGHT_CLASS_NORMAL
	else
		spread = unfolded_spread
		if(suppressed)
			w_class = WEIGHT_CLASS_HUGE
		else
			w_class = WEIGHT_CLASS_BULKY
	update_icon()

/obj/item/gun/ballistic/automatic/cmg/update_overlays()
	. = ..()
	. += "[icon_state]-stock[folded ? "_in" : "_out"]"

/obj/item/gun/ballistic/automatic/cmg/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.4 SECONDS)

/obj/item/gun/ballistic/automatic/cmg/add_seclight_point()
	AddComponent(/datum/component/seclite_attachable, \
		light_overlay_icon = 'icons/obj/weapons/guns/flashlights.dmi', \
		light_overlay = "flight", \
		overlay_x = 24, \
		overlay_y = 10)

/obj/item/gun/ballistic/automatic/cmg/give_manufacturer_examine()
	AddElement(/datum/element/manufacturer_examine, COMPANY_NANOTRASEN)

/obj/item/gun/ballistic/automatic/cmg/add_bayonet_point()
	AddComponent(/datum/component/bayonet_attachable, offset_x = 26, offset_y = 10)

/obj/item/ammo_box/magazine/multi_sprite/cmg
	name = "9x25mm lethal PDW magazine"
	icon = 'modular_ss220/modules/return_prs/sec_haul/icons/mags.dmi'
	icon_state = "g11_lethal"
	ammo_type = /obj/item/ammo_casing/c9mm
	caliber = CALIBER_9MM
	max_ammo = 24
	multiple_sprites = AMMO_BOX_FULL_EMPTY

/obj/item/ammo_box/magazine/multi_sprite/cmg/empty
	name = "9x25mm PDW magazine"
	icon_state = "g11"
	start_empty = 1

/obj/item/ammo_box/magazine/multi_sprite/cmg/hp
	name = "9x25mm hollow-point PDW magazine"
	icon_state = "g11_hollowpoint"
	ammo_type = /obj/item/ammo_casing/c9mm/hp

/obj/item/ammo_box/magazine/multi_sprite/cmg/ap
	name = "9x25mm armor-piercing PDW magazine"
	icon_state = "g11_ap"
	ammo_type = /obj/item/ammo_casing/c9mm/ap

/obj/item/ammo_box/magazine/multi_sprite/cmg/fire
	name = "9x25mm incendiary PDW magazine"
	icon_state = "g11_incendiary"
	ammo_type = /obj/item/ammo_casing/c9mm/fire

/obj/item/ammo_box/magazine/multi_sprite/cmg/ihdf
	name = "9x25mm IHDF PDW magazine"
	icon_state = "g11_ihdf"
	ammo_type = /obj/item/ammo_casing/c9mm/ihdf

/obj/item/ammo_box/magazine/multi_sprite/cmg/rubber
	name = "9x25mm rubber PDW magazine"
	icon_state = "g11_rubber"
	ammo_type = /obj/item/ammo_casing/c9mm/rubber

/obj/item/gun/ballistic/automatic/cmg/nomag
	spawnwithmagazine = FALSE

/obj/item/suppressor/nanotrasen
	name = "NT-S suppressor"
	desc = "A Nanotrasen brand small-arms suppressor, including a large NT logo stamped on the side."

/obj/item/storage/toolbox/guncase/nova/blueshield_cmg
	name = "Blueshield's CMG-2 guncase"

/obj/item/storage/toolbox/guncase/nova/blueshield_cmg/PopulateContents()
	new /obj/item/gun/ballistic/automatic/cmg/nomag(src)
	new /obj/item/ammo_box/magazine/multi_sprite/cmg/rubber(src)
	new /obj/item/ammo_box/magazine/multi_sprite/cmg/rubber(src)
	new /obj/item/ammo_box/magazine/multi_sprite/cmg(src)
	new /obj/item/ammo_box/magazine/multi_sprite/cmg(src)
	new /obj/item/suppressor/nanotrasen(src)

// blueshield override
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
	name = "gunset beacon"
	desc = "A single use beacon to deliver a gunset of your choice. Please only call this in your office"
	company_source = "Sol and Nanotrasen collaboration in defense"
	company_message = span_bold("Supply Pod incoming, please stand by.")

/obj/item/choice_beacon/blueshield/generate_display_names()
	var/static/list/selectable_gun_types = list(
		"Custom Hellfire Laser Rifle" = /obj/item/gun/energy/laser/hellgun/blueshield,
		"Blueshield's CMG-2 Gunset" = /obj/item/storage/toolbox/guncase/nova/blueshield_cmg,
		"Blueshield's Thermal Holster" = /obj/item/storage/belt/holster/energy/thermal/blueshield,
	)

	return selectable_gun_types


/datum/outfit/job/blueshield
	name = "Blueshield"
	jobtype = /datum/job/blueshield
	uniform = /obj/item/clothing/under/rank/blueshield
	suit = /obj/item/clothing/suit/armor/vest/blueshield/jacket
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated/blueshield
	id = /obj/item/card/id/advanced/centcom
	shoes = /obj/item/clothing/shoes/jackboots
	ears = /obj/item/radio/headset/headset_bs/alt
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/blue
	implants = list(/obj/item/implant/mindshield)
	backpack = /obj/item/storage/backpack/blueshield
	satchel = /obj/item/storage/backpack/satchel/blueshield
	duffelbag = /obj/item/storage/backpack/duffelbag/blueshield
	messenger = /obj/item/storage/backpack/messenger/blueshield
	head = /obj/item/clothing/head/beret/blueshield
	box = /obj/item/storage/box/survival/security
	belt = /obj/item/modular_computer/pda/blueshield
	l_pocket = /obj/item/sensor_device/blueshield
	backpack_contents = list(
							/obj/item/storage/medkit/tactical/blueshield,
							/obj/item/choice_beacon/blueshield = 1,
	)

	id_trim = /datum/id_trim/job/blueshield

/datum/job/blueshield
	title = JOB_BLUESHIELD
	description = "Protect heads of staff, get your fancy gun stolen, cry as the captain touches the supermatter."
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	department_head = list(JOB_NT_REP)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "Central Command and the Nanotrasen Consultant"
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

	veteran_only = TRUE
	job_flags = STATION_JOB_FLAGS | JOB_CANNOT_OPEN_SLOTS


/datum/id_trim/job/blueshield
	assignment = "Blueshield"
	trim_icon = 'modular_nova/master_files/icons/obj/card.dmi'
	trim_state = "trim_blueshield"
	department_color = COLOR_COMMAND_BLUE
	subdepartment_color = COLOR_CENTCOM_BLUE // Not the other way around. I think.
	sechud_icon_state = SECHUD_BLUESHIELD
	extra_access = list(
		ACCESS_BRIG,
		ACCESS_CARGO,
		ACCESS_COURT,
		ACCESS_GATEWAY,
		ACCESS_SECURITY,
	)
	minimal_access = list(
		ACCESS_ALL_PERSONAL_LOCKERS,
		ACCESS_CHANGE_IDS,
		ACCESS_BRIG_ENTRANCE,
		ACCESS_CENT_GENERAL,
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
		ACCESS_CAPTAIN,
		ACCESS_CHANGE_IDS,
	)
	job = /datum/job/blueshield

/datum/armor/beret_blueshield
	melee = 40
	bullet = 35
	laser = 30
	energy = 35
	bomb = 30
	fire = 80
	acid = 80
	wound = 15

/obj/item/clothing/head/beret/blueshield
	armor_type = /datum/armor/beret_blueshield
