//clothing
/datum/armor/sec_nri
	melee = 40
	bullet = 35
	laser = 30
	energy = 40
	bomb = 25
	fire = 20
	acid = 50
	wound = 20

/obj/item/clothing/head/beret/sec/nri
	name = "commander's beret"
	desc = "Za rodinu!!"
	armor_type = /datum/armor/sec_nri

//backpack
/obj/item/storage/backpack/duffelbag/syndie/nri
	name = "imperial assault pack"
	desc = "A large green backpack for holding extra tactical supplies. It appears to be made from lighter yet sturdier materials."
	icon = 'modular_ss220/modules/return_prs/novaya_ert/icons/backpacks.dmi'
	worn_icon = 'modular_ss220/modules/return_prs/novaya_ert/icons/back.dmi'
	icon_state = "russian_green_backpack"
	worn_icon_state = "russian_green_backpack"
	inhand_icon_state = "securitypack"
	resistance_flags = FIRE_PROOF
	special_desc_requirement = null
	special_desc = null

/obj/item/storage/backpack/duffelbag/syndie/nri/captain
	desc = "A large black backpack for holding extra tactical supplies. It appears to be made from lighter yet sturdier materials."
	icon_state = "russian_black_backpack"
	worn_icon_state = "russian_black_backpack"

/obj/item/storage/backpack/duffelbag/syndie/nri/medic
	desc = "A large white backpack for holding extra tactical supplies. It appears to be made from lighter yet sturdier materials."
	icon_state = "russian_white_backpack"
	worn_icon_state = "russian_white_backpack"

/obj/item/storage/backpack/duffelbag/syndie/nri/engineer
	desc = "A large brown backpack for holding extra tactical supplies. It appears to be made from lighter yet sturdier materials."
	icon_state = "russian_brown_backpack"
	worn_icon_state = "russian_brown_backpack"

/obj/item/storage/backpack/nri
	name = "imperial assault pack"
	desc = "A large green backpack for holding extra tactical supplies."
	icon = 'modular_ss220/modules/return_prs/novaya_ert/icons/backpacks.dmi'
	worn_icon = 'modular_ss220/modules/return_prs/novaya_ert/icons/back.dmi'
	icon_state = "russian_green_backpack"
	worn_icon_state = "russian_green_backpack"
	inhand_icon_state = "securitypack"
//belts
/obj/item/storage/belt/military/nri
	name = "green tactical belt"
	desc = "A green tactical belt made for storing military grade hardware."
	icon = 'modular_ss220/modules/return_prs/novaya_ert/icons/belts.dmi'
	worn_icon = 'modular_ss220/modules/return_prs/novaya_ert/icons/belt.dmi'
	worn_icon_teshari = 'modular_ss220/modules/return_prs/novaya_ert/icons/belt_tesha.dmi'
	icon_state = "russian_green_belt"
	inhand_icon_state = "security"
	worn_icon_state = "russian_green_belt"

/obj/item/storage/belt/military/nri/captain
	name = "black tactical belt"
	desc = "A black tactical belt made for storing military grade hardware."
	icon_state = "russian_black_belt"
	worn_icon_state = "russian_black_belt"

/obj/item/storage/belt/military/nri/medic
	name = "blue tactical belt"
	desc = "A blue tactical belt made for storing military grade hardware."
	icon_state = "russian_white_belt"
	worn_icon_state = "russian_white_belt"

/obj/item/storage/belt/military/nri/engineer
	name = "brown tactical belt"
	desc = "A brown tactical belt made for storing military grade hardware."
	icon_state = "russian_brown_belt"
	worn_icon_state = "russian_brown_belt"

/obj/item/storage/box/nri_survival_pack/police
	w_class = WEIGHT_CLASS_SMALL
	desc = "A box filled with useful emergency items, supplied by the NRI. It feels particularily light."

/obj/item/storage/box/nri_survival_pack/police/PopulateContents()
	new /obj/item/oxygen_candle(src)
	new /obj/item/tank/internals/emergency_oxygen(src)
	new /obj/item/stack/spacecash/c1000(src)
	new /obj/item/storage/pill_bottle/iron(src)
	new /obj/item/reagent_containers/hypospray/medipen(src)
	new /obj/item/flashlight/flare(src)
	new /obj/item/crowbar/red(src)

/obj/item/storage/belt/military/nri/plus_mre/PopulateContents()
	new /obj/item/storage/box/nri_survival_pack/police(src)

/obj/item/storage/belt/military/nri/soldier/PopulateContents()
	generate_items_inside(list(
		/obj/item/ammo_box/magazine/lanca = 4,
		/obj/item/knife/combat = 1,
		/obj/item/grenade/smokebomb = 1,
		/obj/item/grenade/frag = 1,
	),src)

/obj/item/storage/belt/military/nri/heavy/PopulateContents()
	generate_items_inside(list(
		/obj/item/ammo_box/magazine/m9mm_aps = 4,
		/obj/item/knife/combat = 1,
		/obj/item/grenade/smokebomb = 1,
		/obj/item/grenade/frag = 1,
	),src)

/obj/item/storage/belt/military/nri/captain/full/PopulateContents()
	generate_items_inside(list(
		/obj/item/ammo_box/magazine/lanca = 4,
		/obj/item/knife/combat = 1,
		/obj/item/grenade/smokebomb = 1,
		/obj/item/grenade/frag = 1,
	),src)

/obj/item/storage/belt/military/nri/medic/full/PopulateContents()
	generate_items_inside(list(
		/obj/item/ammo_box/magazine/miecz = 4,
		/obj/item/knife/combat = 1,
		/obj/item/grenade/smokebomb = 1,
		/obj/item/grenade/frag = 1,
	),src)

/obj/item/storage/belt/military/nri/engineer/full/PopulateContents()
	generate_items_inside(list(
		/obj/item/ammo_box/magazine/miecz = 4,
		/obj/item/knife/combat = 1,
		/obj/item/grenade/smokebomb = 1,
		/obj/item/grenade/frag = 1,
	),src)

//military uniform
/obj/item/clothing/under/costume/nri
	name = "advanced imperial fatigues"
	desc = "The latest in tactical and comfortable russian military outfits."
	icon = 'modular_ss220/modules/return_prs/novaya_ert/icons/uniforms.dmi'
	worn_icon = 'modular_ss220/modules/return_prs/novaya_ert/icons/uniform.dmi'
	worn_icon_digi = 'modular_ss220/modules/return_prs/novaya_ert/icons/uniform_digi.dmi'
	worn_icon_teshari = 'modular_ss220/modules/return_prs/novaya_ert/icons/uniform_tesha.dmi'
	icon_state = "nri_soldier"
	inhand_icon_state = "hostrench"
	armor_type = /datum/armor/clothing_under/costume_nri
	strip_delay = 50
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE
	can_adjust = FALSE

/datum/armor/clothing_under/costume_nri
	melee = 10
	fire = 30
	acid = 30

/obj/item/clothing/under/costume/nri/captain
	icon_state = "nri_captain"

/obj/item/clothing/under/costume/nri/medic
	icon_state = "nri_medic"

/obj/item/clothing/under/costume/nri/engineer
	icon_state = "nri_engineer"

// police clothing
/obj/item/clothing/under/colonial/nri_police
	name = "imperial police outfit"
	desc = "Fancy blue durathread shirt and a pair of cotton-blend pants with a black synthleather belt. A time-tested design first employed by the NRI police's \
	precursor organisation, Rim-world Colonial Militia, now utilised by them as a tribute."
	icon_state = "under_police"
	armor_type = /datum/armor/clothing_under/rank_security
	strip_delay = 5 SECONDS
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE
	can_adjust = FALSE

/obj/item/clothing/under/colonial/nri_police/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/manufacturer_examine, COMPANY_ZCM)

/obj/item/clothing/neck/cloak/colonial/nri_police
	name = "imperial police cloak"
	desc = "A cloak made from heavy tarpaulin. Nigh wind- and waterproof thanks to its design. The signature white rectangle of the NRI police covers the garment's back."
	icon_state = "cloak_police"

/obj/item/clothing/neck/cloak/colonial/nri_police/Initialize(mapload)
	allowed += list(
		/obj/item/restraints/handcuffs,
		/obj/item/ammo_box,
		/obj/item/ammo_casing,
	)
	return ..()

/obj/item/clothing/neck/cloak/colonial/nri_police/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/manufacturer_examine, COMPANY_ZCM)

/obj/item/clothing/head/hats/colonial/nri_police
	name = "imperial police cap"
	desc = "A puffy cap made out of tarpaulin covered by some textile. It is sturdy and comfortable, and seems to retain its form very well. <br>\
		Silver NRI police insignia is woven right above its visor."
	icon_state = "cap_police"
	armor_type = /datum/armor/cosmetic_sec

/obj/item/clothing/head/hats/colonial/nri_police/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/manufacturer_examine, COMPANY_ZCM)

/obj/item/clothing/mask/gas/nri_police
	name = "imperial police mask"
	desc = "A close-fitting tactical mask."
	icon = 'modular_ss220/modules/return_prs/novaya_ert/icons/mask.dmi'
	worn_icon = 'modular_ss220/modules/return_prs/novaya_ert/icons/wornmask.dmi'
	worn_icon_digi = 'modular_ss220/modules/return_prs/novaya_ert/icons/wornmask_digi.dmi'
	icon_state = "nri_police"
	inhand_icon_state = "swat"
	flags_inv = HIDEFACIALHAIR | HIDEFACE | HIDESNOUT
	visor_flags_inv = NONE
	flags_cover = MASKCOVERSMOUTH | MASKCOVERSEYES | PEPPERPROOF
	visor_flags_cover = MASKCOVERSMOUTH | MASKCOVERSEYES | PEPPERPROOF

/obj/item/clothing/mask/gas/nri_police/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/manufacturer_examine, COMPANY_ZCM)

/obj/item/clothing/head/helmet/nri_police
	name = "imperial police helmet"
	desc = "Thick-looking tactical helmet made out of shaped Plasteel. Colored dark blue, similar to one imperial police is commonly using."
	icon_state = "police_helmet"
	icon = 'modular_ss220/modules/return_prs/novaya_ert/icons/armor.dmi'
	worn_icon = 'modular_ss220/modules/return_prs/novaya_ert/icons/wornarmor.dmi'

/obj/item/clothing/head/helmet/nri_police/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/manufacturer_examine, COMPANY_ZCM)

/obj/item/clothing/suit/armor/vest/nri_police
	name = "imperial police plate carrier"
	desc = "A reasonably heavy, yet comfortable armor vest comprised of a bunch of dense plates. Colored dark blue and bears a reflective stripe on the front and back."
	icon_state = "police_vest"
	icon = 'modular_ss220/modules/return_prs/novaya_ert/icons/armor.dmi'
	worn_icon = 'modular_ss220/modules/return_prs/novaya_ert/icons/wornarmor.dmi'

/obj/item/clothing/suit/armor/vest/nri_police/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/manufacturer_examine, COMPANY_ZCM)

/obj/item/clothing/suit/armor/vest/nri_police_jacket
	name = "imperial police aerostatic bomber jacket"
	desc = "A jacket design worn by the more dynamic officers. There are quite a few pockets on the inside, mostly for storing notebooks and compasses."
	icon = 'modular_nova/modules/food_replicator/icons/clothing.dmi'
	worn_icon = 'modular_nova/modules/food_replicator/icons/clothing_worn.dmi'
	icon_state = "jacket_police"
	inhand_icon_state = "overalls"
	armor_type = /datum/armor/armor_secjacket
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS|HANDS
	heat_protection = CHEST|GROIN|ARMS|HANDS
	resistance_flags = FLAMMABLE
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/nri_police_jacket/Initialize(mapload)
	AddElement(/datum/element/manufacturer_examine, COMPANY_ZCM)
	allowed += list(
		/obj/item/camera,
		/obj/item/clipboard,
		/obj/item/folder,
		/obj/item/taperecorder,
		/obj/item/tape,
		/obj/item/gps,
	)
	return ..()

/obj/item/clothing/suit/armor/vest/nri_police_jacket/suit
	name = "imperial police official jacket"
	desc = "A black uniform jacket with Zvirdnyan Colonial Militia's signature white rectangle on its right sleeve and backside. \
	Letters inside the collar read: %RANK-%KINK. The jacket is of exceptional quality."
	icon_state = "suit_police"
	inhand_icon_state = "ro_suit"

/obj/item/clothing/suit/armor/vest/nri_police_jacket/suit/Initialize(mapload)
	. = ..()
	var/rank = list("POF","LTN","SGT","DET","CPT","MSL")
	var/kink = list("JFR","2JFR","STL","2STL")
	desc = replacetext(desc, "%RANK", pick(rank))
	if(prob(20))
		desc = replacetext(desc, "%KINK", pick(kink))
	else
		desc = replacetext(desc, "%KINK", "N/A")

/obj/item/clothing/head/soft/nri_police
	name = "imperial police baseball cap"
	desc = "It's a robust baseball hat in tasteless washed out blue colour.<br>\
	Hey, this one's round!"
	icon_state = "policesoft"
	icon = 'modular_nova/modules/food_replicator/icons/clothing.dmi'
	worn_icon = 'modular_nova/modules/food_replicator/icons/clothing_worn.dmi'
	soft_type = "police"
	armor_type = /datum/armor/cosmetic_sec
	strip_delay = 60
	dog_fashion = null

/obj/item/clothing/head/soft/nri_police/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/manufacturer_examine, COMPANY_ZCM)

//misc items
/obj/item/storage/box/nri_survival_pack
	name = "NRI survival pack"
	desc = "A box filled with useful emergency items, supplied by the NRI."
	icon_state = "survival_pack"
	icon = 'modular_ss220/modules/return_prs/novaya_ert/icons/survival_pack.dmi'
	illustration = null

/obj/item/storage/box/nri_survival_pack/PopulateContents()
	new /obj/item/oxygen_candle(src)
	new /obj/item/tank/internals/emergency_oxygen/double(src)
	new /obj/item/stack/spacecash/c1000(src)
	new /obj/item/storage/pill_bottle/iron(src)
	new /obj/item/storage/box/colonial_rations(src)
	new /obj/item/storage/box/nri_pens(src)
	new /obj/item/storage/box/nri_flares(src)
	new /obj/item/crowbar/red(src)

/obj/item/storage/box/nri_pens
	name = "box of injectors"
	desc = "A box full of first aid and combat MediPens."
	illustration = "epipen"

/obj/item/storage/box/nri_pens/PopulateContents()
	new /obj/item/reagent_containers/hypospray/medipen/ekit(src)
	new /obj/item/reagent_containers/hypospray/medipen/stimpack/traitor(src)
	new /obj/item/reagent_containers/hypospray/medipen/oxandrolone(src)
	new /obj/item/reagent_containers/hypospray/medipen/salacid(src)
	new /obj/item/reagent_containers/hypospray/medipen/salacid(src)
	new /obj/item/reagent_containers/hypospray/medipen/penacid(src)
	new /obj/item/reagent_containers/hypospray/medipen/salbutamol(src)
	new /obj/item/reagent_containers/hypospray/medipen/atropine(src)
	new /obj/item/reagent_containers/hypospray/medipen/blood_loss(src)

/obj/item/storage/box/nri_flares
	name = "box of flares"
	desc = "A box full of red emergency flares."
	illustration = "firecracker"

/obj/item/storage/box/nri_flares/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/flashlight/flare(src)

/obj/item/shield/riot/pointman/nri
	name = "heavy corpsman shield"
	desc = "A shield designed for people that have to sprint to the rescue. Cumbersome as hell. Repair with plasteel."
	icon_state = "riot"
	icon = 'modular_ss220/modules/return_prs/novaya_ert/icons/riot.dmi'
	lefthand_file = 'modular_ss220/modules/return_prs/novaya_ert/icons/riot_left.dmi'
	righthand_file = 'modular_ss220/modules/return_prs/novaya_ert/icons/riot_right.dmi'
	transparent = FALSE
	shield_break_leftover = /obj/item/corpsman_broken

/obj/item/corpsman_broken
	name = "broken corpsman shield"
	desc = "Might be able to be repaired with a welder."
	icon_state = "riot_broken"
	icon = 'modular_ss220/modules/return_prs/novaya_ert/icons/riot.dmi'
	w_class = WEIGHT_CLASS_BULKY

/obj/item/corpsman_broken/welder_act(mob/living/user, obj/item/I)
	..()
	new /obj/item/shield/riot/pointman/nri((get_turf(src)))
	qdel(src)

//outfits start

/datum/outfit/centcom/ert/nri
	name = "Novaya Rossiyskaya Imperiya Soldier"
	head = null
	glasses = /obj/item/clothing/glasses/night
	ears = /obj/item/radio/headset/headset_cent/alt/with_key
	mask = /obj/item/clothing/mask/gas/hecu
	uniform = /obj/item/clothing/under/costume/nri
	suit = null
	suit_store = null
	gloves = /obj/item/clothing/gloves/combat
	belt = /obj/item/storage/belt/military/nri/soldier
	back = /obj/item/mod/control/pre_equipped/frontline/ert
	backpack_contents = list(
		/obj/item/storage/box/nri_survival_pack,
		/obj/item/storage/medkit/emergency,
		/obj/item/advanced_choice_beacon/nri/heavy,
		/obj/item/beamout_tool,
		/obj/item/crucifix,
		/obj/item/reagent_containers/cup/glass/waterbottle/large/cryptobiolin,
		/obj/item/ammo_box/magazine/recharge/plasma_battery,
		/obj/item/gun/ballistic/automatic/pistol/plasma_marksman,
	)
	l_pocket = /obj/item/knife/combat/survival
	r_pocket = /obj/item/ammo_box/magazine/recharge/plasma_battery
	shoes = /obj/item/clothing/shoes/combat

	l_hand = /obj/item/gun/ballistic/automatic/lanca

	id = /obj/item/card/id/advanced/centcom/ert/nri
	id_trim = /datum/id_trim/nri

/datum/outfit/centcom/ert/nri/commander
	name = "Novaya Rossiyskaya Imperiya Platoon Commander"
	head = null
	glasses = /obj/item/clothing/glasses/thermal/eyepatch
	uniform = /obj/item/clothing/under/costume/nri/captain
	belt = /obj/item/storage/belt/military/nri/captain/full
	suit = null
	suit_store = null
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	back = /obj/item/mod/control/pre_equipped/frontline/ert
	backpack_contents = list(/obj/item/storage/box/nri_survival_pack,
							/obj/item/storage/medkit/regular,
							/obj/item/megaphone,
							/obj/item/binoculars,
							/obj/item/clothing/head/beret/sec/nri,
							/obj/item/ammo_box/magazine/recharge/plasma_battery,
							/obj/item/gun/ballistic/automatic/pistol/plasma_thrower,
							/obj/item/beamout_tool,
							/obj/item/crucifix,
							/obj/item/reagent_containers/cup/glass/waterbottle/large/cryptobiolin)

	l_hand = /obj/item/gun/ballistic/automatic/lanca

	id_trim = /datum/id_trim/nri/commander

/datum/outfit/centcom/ert/nri/medic
	name = "Novaya Rossiyskaya Imperiya Corpsman"
	head = null
	glasses = /obj/item/clothing/glasses/hud/health/night
	uniform = /obj/item/clothing/under/costume/nri/medic
	belt = /obj/item/storage/belt/military/nri/medic/full
	suit = null
	suit_store = null
	gloves = /obj/item/clothing/gloves/latex/nitrile
	back = /obj/item/mod/control/pre_equipped/frontline/ert
	backpack_contents = list(/obj/item/storage/box/nri_survival_pack,
							/obj/item/storage/medkit/tactical,
							/obj/item/storage/medkit/advanced,
							/obj/item/storage/medkit/surgery,
							/obj/item/gun/medbeam,
							/obj/item/gun/energy/cell_loaded/medigun/cmo,
							/obj/item/storage/box/plastic/medicells,
							/obj/item/beamout_tool,
							/obj/item/crucifix,
							/obj/item/reagent_containers/cup/glass/waterbottle/large/cryptobiolin)

	l_hand = /obj/item/shield/riot/pointman/nri
	r_hand = /obj/item/gun/ballistic/automatic/miecz

	id_trim = /datum/id_trim/nri/medic

/datum/outfit/centcom/ert/nri/engineer
	name = "Novaya Rossiyskaya Imperiya Combat Engineer"
	head = null
	glasses = /obj/item/clothing/glasses/meson/night
	uniform = /obj/item/clothing/under/costume/nri/engineer
	belt = /obj/item/storage/belt/military/nri/engineer/full
	suit = null
	suit_store = null
	back = /obj/item/mod/control/pre_equipped/frontline/ert
	backpack_contents = list(/obj/item/storage/box/nri_survival_pack,
							/obj/item/construction/rcd/loaded/upgraded,
							/obj/item/rcd_ammo/large,
							/obj/item/advanced_choice_beacon/nri/engineer,
							/obj/item/beamout_tool,
							/obj/item/crucifix,
							/obj/item/reagent_containers/cup/glass/waterbottle/large/cryptobiolin)

	l_hand = /obj/item/storage/belt/utility/full/powertools
	r_hand = /obj/item/gun/ballistic/automatic/miecz

	id_trim = /datum/id_trim/nri/engineer

/datum/outfit/centcom/ert/nri/major
	name = "Novaya Rossiyskaya Imperiya Major"
	head = null
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	ears = /obj/item/radio/headset/headset_cent/alt/with_key
	mask = null
	uniform = /obj/item/clothing/under/costume/russian_officer
	suit = /obj/item/clothing/suit/jacket/officer/tan
	suit_store = null
	gloves = /obj/item/clothing/gloves/combat
	belt = /obj/item/gun/ballistic/revolver/shotgun_revolver
	back = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(/obj/item/storage/box/nri_survival_pack,
							/obj/item/ammo_box/advanced/s12gauge/express,
							/obj/item/suppressor/standard,
							/obj/item/knife/combat,
							/obj/item/beamout_tool)
	l_pocket = null
	r_pocket = null
	shoes = /obj/item/clothing/shoes/combat/swat
	id = /obj/item/card/id/advanced/centcom/ert/nri
	id_trim = /datum/id_trim/nri/diplomat/major

/datum/outfit/centcom/ert/nri/scientist
	name = "Novaya Rossiyskaya Imperiya Research Inspector"
	head = null
	glasses = /obj/item/clothing/glasses/regular
	ears = /obj/item/radio/headset/headset_cent/alt/with_key
	mask = null
	uniform = /obj/item/clothing/under/rank/rnd/research_director
	suit = /obj/item/clothing/suit/toggle/labcoat
	suit_store = null
	gloves = /obj/item/clothing/gloves/latex/nitrile
	belt = /obj/item/clipboard
	back = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(/obj/item/storage/box/nri_survival_pack,
							/obj/item/melee/baton/telescopic,
							/obj/item/gun/energy/e_gun/mini,
							/obj/item/beamout_tool)
	l_pocket = null
	r_pocket = null
	shoes = /obj/item/clothing/shoes/sneakers/brown
	id = /obj/item/card/id/advanced/centcom/ert/nri
	id_trim = /datum/id_trim/nri/diplomat/scientist

/datum/outfit/centcom/ert/nri/doctor
	name = "Novaya Rossiyskaya Imperiya Medical Inspector"
	head = null
	glasses = /obj/item/clothing/glasses/hud/health
	ears = /obj/item/radio/headset/headset_cent/alt/with_key
	mask = null
	uniform = /obj/item/clothing/under/rank/medical/chief_medical_officer
	suit = /obj/item/clothing/suit/toggle/labcoat/cmo
	suit_store = null
	gloves = /obj/item/clothing/gloves/latex/nitrile
	belt = /obj/item/clipboard
	back = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(/obj/item/storage/box/nri_survival_pack,
							/obj/item/gun/ballistic/automatic/pistol/plasma_marksman,
							/obj/item/ammo_box/magazine/recharge/plasma_battery,
							/obj/item/ammo_box/magazine/recharge/plasma_battery,
							/obj/item/storage/medkit/expeditionary,
							/obj/item/melee/baton/telescopic,
							/obj/item/beamout_tool)
	l_pocket = null
	r_pocket = null
	shoes = /obj/item/clothing/shoes/sneakers/brown
	id = /obj/item/card/id/advanced/centcom/ert/nri
	id_trim = /datum/id_trim/nri/diplomat/doctor

/datum/outfit/centcom/ert/nri/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	return
	//Two reasons for this; one, Russians aren't NT and dont need implants used mostly for NT-sympathizers. Two, the HUD looks ugly with the blue mindshield outline.

//outfits end
//id start

/obj/item/card/id/advanced/centcom/ert/nri
	name = "\improper NRI ID"
	desc = "An ID straight from the NRI."
	icon_state = "card_black"
	assigned_icon_state = "assigned_centcom"

/datum/id_trim/nri
	assignment = "NRI Soldier"
	trim_icon = 'modular_ss220/modules/return_prs/novaya_ert/icons/card.dmi'
	trim_state = "trim_nri"
	department_color = COLOR_RED_LIGHT
	subdepartment_color = COLOR_COMMAND_BLUE
	sechud_icon_state = "hud_nri"
	threat_modifier = -2

/datum/id_trim/nri/New()
	. = ..()
	access = SSid_access.get_region_access_list(list(REGION_CENTCOM, REGION_ALL_STATION))


/datum/id_trim/nri/commander
	assignment = "NRI Platoon Commander"
	trim_state = "trim_nri_commander"
	department_color = COLOR_RED_LIGHT
	subdepartment_color = COLOR_COMMAND_BLUE
	sechud_icon_state = "hud_nri_commander"

/datum/id_trim/nri/heavy
	assignment = "NRI Heavy Soldier"

/datum/id_trim/nri/medic
	assignment = "NRI Corpsman"

/datum/id_trim/nri/engineer
	assignment = "NRI Combat Engineer"

/datum/id_trim/nri/diplomat
	assignment = "NRI Diplomat"
	trim_state = "trim_nri_commander"
	department_color = COLOR_RED_LIGHT
	subdepartment_color = COLOR_COMMAND_BLUE
	sechud_icon_state = "hud_nri_commander"

/datum/id_trim/nri/diplomat/major
	assignment = "NRI Major"

/datum/id_trim/nri/diplomat/scientist
	assignment = "NRI Research Inspector"

/datum/id_trim/nri/diplomat/doctor
	assignment = "NRI Medical Inspector"

/obj/item/modular_computer/pda/nri_military
	name = "\improper NRI military PDA"
	device_theme = PDA_THEME_TERMINAL
	icon = 'modular_ss220/modules/return_prs/novaya_ert/icons/pda.dmi'
	icon_state = "/obj/item/modular_computer/pda/nri_military"
	comp_light_luminosity = 6.3 //Matching a flashlight
	comp_light_color = "#5c20aa" //Simulated ultraviolet light for finding blood
	starting_programs = list(
		/datum/computer_file/program/records/security,
		/datum/computer_file/program/crew_manifest,
		/datum/computer_file/program/robocontrol,
	)
	inserted_item = /obj/item/pen/fourcolor

//id end

//MODsuit start
//modules
/obj/item/mod/module/ert_auto_doc
	name = "MOD military automatic paramedical module"
	desc = "The reverse-engineered and redesigned medical assistance system, previously used by the now decommissioned VOSKHOD combat armor. \
		The technology it uses is very similar to the one of Spider Clan, yet Innovations and Defense Collegium reject any similarities. \
		Using a built-in storage of chemical compounds and miniature chemical mixer, it's capable of injecting its user with simple painkillers and coagulants, \
		assisting them with their restoration, as long as they don't overdose themselves. However, this system heavily relies on some rarely combat-available chemical compounds to prepare its injections, \
		mainly Cryptobiolin, which appear in the user's bloodstream from time to time, and its trivial damage assesment systems are inadequate for complete restoration purposes."
	icon_state = "adrenaline_boost"
	module_type = MODULE_TOGGLE
	incompatible_modules = list(/obj/item/mod/module/adrenaline_boost, /obj/item/mod/module/auto_doc, /obj/item/mod/module/ert_auto_doc)
	cooldown_time = null
	complexity = 4
	use_energy_cost = DEFAULT_CHARGE_DRAIN * 20
	/// What reagent we need to refill?
	var/reagent_required = /datum/reagent/cryptobiolin
	/// How much of a reagent we need to refill a single boost.
	var/reagent_required_amount = 20
	/// Maximum amount of reagents this module can hold.
	var/reagent_max_amount = 120
	/// Health threshold above which the module won't heal.
	var/health_threshold = 90
	/// Cooldown betwen each treatment.
	var/general_cooldown = 25 SECONDS
	/// if TRUE, next cure will have downside.
	var/after_effects = FALSE

	/// Timer for the cooldown.
	COOLDOWN_DECLARE(heal_timer)
	/// Timer for the stamina damage cooldown.
	COOLDOWN_DECLARE(stamina_timer)
	/// Timer for the blood-refilling cooldown.
	COOLDOWN_DECLARE(blood_timer)

/// Creates chemical container for chemicals and fills it with chemicals. Chemception.
/obj/item/mod/module/ert_auto_doc/Initialize(mapload)
	. = ..()
	create_reagents(reagent_max_amount)
	reagents.add_reagent(reagent_required, reagent_max_amount)

/obj/item/mod/module/ert_auto_doc/on_active_process(seconds_per_tick)
	if(!reagents.has_reagent(reagent_required, reagent_required_amount))
		balloon_alert(mod.wearer, "not enough chems!")
		deactivate()
		return FALSE

	var/new_oxyloss = mod.wearer.get_oxy_loss()
	var/new_bruteloss = mod.wearer.get_brute_loss()
	var/new_fireloss = mod.wearer.get_fire_loss()
	var/new_stamloss = mod.wearer.get_stamina_loss()
	var/new_toxloss = mod.wearer.get_tox_loss()

	if(mod.wearer.blood_volume < BLOOD_VOLUME_OKAY && reagents.total_volume >= reagent_required_amount * 0.5 * seconds_per_tick)
		if(!COOLDOWN_FINISHED(src, blood_timer))
			return FALSE
		mod.wearer.reagents.add_reagent(/datum/reagent/blood, 25, list("viruses"=null,"blood_DNA"=null,"blood_type"=mod.wearer.dna.blood_type,"resistances"=null,"trace_chem"=null))
		mod.wearer.reagents.add_reagent(/datum/reagent/medicine/coagulant, 2.5 * seconds_per_tick)
		mod.wearer.reagents.add_reagent(/datum/reagent/consumable/nutriment/glucose, 3 * seconds_per_tick)
		mod.wearer.reagents.add_reagent(/datum/reagent/iron, 2 * seconds_per_tick)
		mod.wearer.playsound_local(mod, 'sound/items/hypospray.ogg', 25, TRUE)
		reagents.remove_reagent(reagent_required, reagent_required_amount * 0.5 * seconds_per_tick)
		to_chat(mod.wearer, span_warning("Blood infused."))
		drain_power(use_energy_cost * 10 * seconds_per_tick)
		if(after_effects)
			addtimer(CALLBACK(src, PROC_REF(heal_aftereffects), mod.wearer), 1 SECONDS, TIMER_STOPPABLE|TIMER_DELETE_ME)
			after_effects = FALSE
		addtimer(CALLBACK(src, PROC_REF(sat)), 60 SECONDS, TIMER_STOPPABLE|TIMER_DELETE_ME)
		COOLDOWN_START(src, blood_timer, general_cooldown)

	if(mod.wearer.health < health_threshold)
		if(!COOLDOWN_FINISHED(src, heal_timer))
			return FALSE
		if(after_effects)
			addtimer(CALLBACK(src, PROC_REF(heal_aftereffects), mod.wearer), 1 SECONDS, TIMER_STOPPABLE|TIMER_DELETE_ME)
			after_effects = FALSE
		if(new_oxyloss && reagents.total_volume >= reagent_required_amount * 0.5 * seconds_per_tick)
			mod.wearer.reagents.add_reagent(/datum/reagent/medicine/salbutamol, 2.5 * seconds_per_tick)
			mod.wearer.reagents.add_reagent(/datum/reagent/medicine/epinephrine, 1.5 * seconds_per_tick)
			mod.wearer.playsound_local(mod, 'sound/items/internals/internals_on.ogg', 25, TRUE)
			reagents.remove_reagent(reagent_required, reagent_required_amount * 0.5 * seconds_per_tick)
			to_chat(mod.wearer, span_warning("Blood oxygen treatment administered. Overdose risks present on further use, consult your first-aid analyzer."))
		if(new_bruteloss && reagents.total_volume >= reagent_required_amount * 1 * seconds_per_tick)
			mod.wearer.reagents.add_reagent(/datum/reagent/medicine/sal_acid, 2.5 * seconds_per_tick)
			mod.wearer.reagents.add_reagent(/datum/reagent/medicine/mine_salve, 2.5 * seconds_per_tick)
			mod.wearer.playsound_local(mod, 'sound/effects/spray2.ogg', 25, TRUE)
			reagents.remove_reagent(reagent_required, reagent_required_amount * 1 * seconds_per_tick)
			to_chat(mod.wearer, span_warning("Brute treatment administered. Overdose risks present on further use, consult your first-aid analyzer."))
		if(new_fireloss && reagents.total_volume >= reagent_required_amount * 1 * seconds_per_tick)
			mod.wearer.reagents.add_reagent(/datum/reagent/medicine/oxandrolone, 2.5 * seconds_per_tick)
			mod.wearer.reagents.add_reagent(/datum/reagent/medicine/mine_salve, 2.5 * seconds_per_tick)
			mod.wearer.playsound_local(mod, 'sound/effects/spray2.ogg', 25, TRUE)
			reagents.remove_reagent(reagent_required, reagent_required_amount * 1 * seconds_per_tick)
			to_chat(mod.wearer, span_warning("Burn treatment administered. Overdose risks present on further use, consult your first-aid analyzer."))
		if(new_toxloss && reagents.total_volume >= reagent_required_amount * 0.5 * seconds_per_tick)
			mod.wearer.reagents.add_reagent(/datum/reagent/medicine/mine_salve, 2.5 * seconds_per_tick)
			mod.wearer.reagents.add_reagent(/datum/reagent/medicine/pen_acid, 2.5 * seconds_per_tick)
			mod.wearer.playsound_local(mod, 'sound/items/hypospray.ogg', 25, TRUE)
			reagents.remove_reagent(reagent_required, reagent_required_amount * 0.5 * seconds_per_tick)
			to_chat(mod.wearer, span_warning("Toxin treatment administered. Overdose risks present on further use, consult your first-aid analyzer."))
		drain_power(use_energy_cost * 15 * seconds_per_tick)
		addtimer(CALLBACK(src, PROC_REF(sat)), 60 SECONDS, TIMER_STOPPABLE|TIMER_DELETE_ME)
		COOLDOWN_START(src, heal_timer, general_cooldown)

	if(new_stamloss > health_threshold && reagents.total_volume >= reagent_required_amount * 0.25 * seconds_per_tick)
		if(!COOLDOWN_FINISHED(src, stamina_timer))
			return FALSE
		if(after_effects)
			addtimer(CALLBACK(src, PROC_REF(heal_aftereffects), mod.wearer), 1 SECONDS, TIMER_STOPPABLE|TIMER_DELETE_ME)
			after_effects = FALSE
		mod.wearer.reagents.add_reagent(/datum/reagent/medicine/mine_salve, 2.5 * seconds_per_tick)
		mod.wearer.reagents.add_reagent(/datum/reagent/medicine/stimulants, 2.5 * seconds_per_tick)
		mod.wearer.reagents.add_reagent(/datum/reagent/medicine/ephedrine, 2.5 * seconds_per_tick)
		mod.wearer.reagents.add_reagent(/datum/reagent/medicine/morphine, 1 * seconds_per_tick)
		mod.wearer.reagents.add_reagent(/datum/reagent/drug/cocaine, 2.5 * seconds_per_tick)
		mod.wearer.playsound_local(mod, 'sound/items/hypospray.ogg', 25, TRUE)
		reagents.remove_reagent(reagent_required, reagent_required_amount * 0.25 * seconds_per_tick)
		to_chat(mod.wearer, span_warning("Combat stimulants administered. Overdose risks present on further use, consult your first-aid analyzer."))
		drain_power(use_energy_cost * 5 * seconds_per_tick)
		addtimer(CALLBACK(src, PROC_REF(sat)), 60 SECONDS, TIMER_STOPPABLE|TIMER_DELETE_ME)
		COOLDOWN_START(src, stamina_timer, general_cooldown)

/// Refills the module with needed chemicals, assuming the container isn't closed or the module isn't full. And if the reagent's not wrong.
/obj/item/mod/module/ert_auto_doc/proc/charge_boost(obj/item/attacking_item, mob/user)
	if(!attacking_item.is_open_container())
		return FALSE
	if(reagents.has_reagent(reagent_required, reagent_max_amount))
		balloon_alert(mod.wearer, "already full!")
		return FALSE
	if(!attacking_item.reagents.trans_to(src, reagent_required_amount, target_id = reagent_required))
		return FALSE
	balloon_alert(mod.wearer, "charge reloaded")
	return TRUE

/obj/item/mod/module/ert_auto_doc/on_install()
	. = ..()
	RegisterSignal(mod, COMSIG_ATOM_ITEM_INTERACTION, PROC_REF(try_refill))

/obj/item/mod/module/ert_auto_doc/on_uninstall(deleting)
	. = ..()
	UnregisterSignal(mod, COMSIG_ATOM_ITEM_INTERACTION)

/obj/item/mod/module/ert_auto_doc/proc/try_refill(source, mob/user, obj/item/attacking_item)
	SIGNAL_HANDLER
	if(charge_boost(attacking_item))
		return COMPONENT_NO_AFTERATTACK
	return NONE

/obj/item/mod/module/ert_auto_doc/on_deactivation(display_message = TRUE, deleting = FALSE)
	. = ..()
	UnregisterSignal(mod.wearer, COMSIG_LIVING_HEALTH_UPDATE)

/obj/item/mod/module/ert_auto_doc/proc/on_item_interact(datum/source, mob/user, obj/item/thing, params)
	SIGNAL_HANDLER

	if(charge_boost(thing, user))
		return COMPONENT_NO_AFTERATTACK

	return NONE

/obj/item/mod/module/ert_auto_doc/on_install()
	. = ..()
	RegisterSignal(mod, COMSIG_ATOM_ITEM_INTERACTION, PROC_REF(on_item_interact))

/obj/item/mod/module/ert_auto_doc/on_uninstall(deleting)
	. = ..()
	UnregisterSignal(mod, COMSIG_ATOM_ATTACKBY)

/// Drawbacks to make this module less self-sufficient and so it feels "balanced" (there's no balance).
/obj/item/mod/module/ert_auto_doc/proc/heal_aftereffects(mob/affected_mob)
	if(!affected_mob)
		return

	mod.wearer.reagents.add_reagent(/datum/reagent/cryptobiolin, 10)
	mod.wearer.reagents.add_reagent(/datum/reagent/drug/maint/sludge, 5)
	to_chat(affected_mob, span_danger("Your head starts slightly spinning, and your chest hurts."))

/obj/item/mod/module/ert_auto_doc/proc/sat()
	after_effects = TRUE

//auto_doc fuel
/obj/item/reagent_containers/cup/glass/waterbottle/large/cryptobiolin
	name = "bottle of cryptobiolin"
	desc = "Nothing screams budget cuts like bottled suit fluid. This one has specialized fluid for more new version of autodoc."
	list_reagents = list(/datum/reagent/cryptobiolin = 100)

//status readout
/obj/item/mod/module/status_readout/operational
	name = "MOD operational status readout module"
	desc = "A once-common module, this technology unfortunately went out of fashion in the safer regions of space; \
		however, it remained in use everywhere else. This particular unit hooks into the suit's spine, \
		capable of capturing and displaying all possible biometric data of the wearer; sleep, nutrition, fitness, fingerprints, \
		and even useful information such as their overall health and wellness. The vitals monitor also comes with a speaker, loud enough \
		to alert anyone nearby that someone has, in fact, died. This specific unit has a clock and operational ID readout."
	display_time = TRUE
	death_sound = 'modular_ss220/modules/return_prs/novaya_ert/sound/flatline.ogg'

//frontline military
/datum/armor/mod_theme_frontline
	melee = 50
	bullet = 60
	laser = 40
	energy = 50
	bomb = 60
	bio = 100
	fire = 50
	acid = 80
	wound = 25

/datum/mod_theme/frontline
	name = "frontline"
	desc = "A Novaya Rossiyskaya Imperiya Defense Collegia protective suit, designed for fortified positions operation and humanitarian aid."
	extended_desc = "A cheaper and more versatile replacement of the dated VOSKHOD Power Armor, designed by the Novaya Rossiyskaya Imperiya Innovations Collegia in \
	collaboration with Agurkrral researchers. Instead of the polyurea coated durathread-lined plasteel plates it utilises thin plates of Kevlar-backed titanium, making it lighter and more compact \
	while leaving place for other modules; yet due to its lack of energy dissipation systems, making its user more vulnerable against conventional laser weaponry. \
	Built-in projectile trajectory and munition assistance computer informs the operator of better places to aim, as well as the remaining munitions for \
	the currently held weapon and its magazines. This function is quite straining on the power cell, and as such, this suit is rarely seen outside of the fortified positions or humanitarian missions; \
	becoming the sign of what little hospitality and assistance the military can provide. However many people who had an experience with this MOD describe it as \"Very uncomfortable.\", \
	mainly due to its lack of proper environmental regulation systems. But because of its protective capabilities, extreme mass-production and cheap price, it easily became the main armor system of the NRI DC."
	default_skin = "frontline"
	armor_type = /datum/armor/mod_theme_frontline
	complexity_max = DEFAULT_MAX_COMPLEXITY
	charge_drain = DEFAULT_CHARGE_DRAIN * 1.5
	allowed_suit_storage = list(
		/obj/item/flashlight,
		/obj/item/tank/internals,
		/obj/item/ammo_box,
		/obj/item/ammo_casing,
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash,
		/obj/item/melee/baton,
		/obj/item/knife/combat,
		/obj/item/shield/riot,
		/obj/item/gun,
	)
	variants = list(
		"frontline" = list(
			MOD_ICON_OVERRIDE = 'modular_ss220/modules/return_prs/novaya_ert/icons/mod.dmi',
			MOD_WORN_ICON_OVERRIDE = 'modular_ss220/modules/return_prs/novaya_ert/icons/wornmod.dmi',
			/obj/item/clothing/head/mod = list(
				UNSEALED_LAYER = HEAD_LAYER,
				UNSEALED_CLOTHING = SNUG_FIT,
				SEALED_CLOTHING = THICKMATERIAL|STOPSPRESSUREDAMAGE,
				SEALED_INVISIBILITY =  HIDEFACIALHAIR|HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDESNOUT,
				SEALED_COVER = HEADCOVERSMOUTH|HEADCOVERSEYES|PEPPERPROOF,
				UNSEALED_MESSAGE = HELMET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = HELMET_SEAL_MESSAGE,
			),
			/obj/item/clothing/suit/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				SEALED_INVISIBILITY = HIDEJUMPSUIT|HIDETAIL,
				UNSEALED_MESSAGE = CHESTPLATE_UNSEAL_MESSAGE,
				SEALED_MESSAGE = CHESTPLATE_SEAL_MESSAGE,
			),
			/obj/item/clothing/gloves/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = GAUNTLET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = GAUNTLET_SEAL_MESSAGE,
			),
			/obj/item/clothing/shoes/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = BOOT_UNSEAL_MESSAGE,
				SEALED_MESSAGE = BOOT_SEAL_MESSAGE,
			),
		),
	)

/obj/item/mod/control/pre_equipped/frontline
	theme = /datum/mod_theme/frontline
	applied_modules = list(
		/obj/item/mod/module/storage,
		/obj/item/mod/module/flashlight,
	)

/obj/item/mod/control/pre_equipped/frontline/ert
	applied_cell = /obj/item/stock_parts/power_store/cell/hyper
	applied_modules = list(
		/obj/item/mod/module/storage/syndicate,
		/obj/item/mod/module/thermal_regulator,
		/obj/item/mod/module/status_readout/operational,
		/obj/item/mod/module/ert_auto_doc,
		/obj/item/mod/module/visor/thermal,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/magboot/advanced,
	)
	default_pins = list(
		/obj/item/mod/module/visor/thermal,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/magboot/advanced,
	)

//police MODsuit
/datum/armor/mod_theme_policing
	melee = 40
	bullet = 50
	laser = 30
	energy = 30
	bomb = 60
	bio = 100
	fire = 75
	acid = 75
	wound = 20

/datum/mod_theme/policing
	name = "policing"
	desc = "A Novaya Rossiyskaya Imperiya Internal Affairs Collegia general purpose protective suit, designed for coreworld patrols."
	extended_desc = "An Apadyne Technologies outsourced, then modified for frontier use by the responding imperial police precinct, MODsuit model, \
		designed for reassuring panicking civilians than participating in active combat. The suit's thin plastitanium armor plating is durable against environment and projectiles, \
		and comes with a built-in miniature power redistribution system to protect against energy weaponry; albeit ineffectively. \
		Thanks to the modifications of the local police, additional armoring has been added to its legs and arms, at the cost of an increased system load."
	default_skin = "policing"
	armor_type = /datum/armor/mod_theme_policing
	complexity_max = DEFAULT_MAX_COMPLEXITY - 1
	charge_drain = DEFAULT_CHARGE_DRAIN * 1.25
	slowdown_deployed = 0.5
	allowed_suit_storage = list(
		/obj/item/flashlight,
		/obj/item/tank/internals,
		/obj/item/ammo_box,
		/obj/item/ammo_casing,
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash,
		/obj/item/melee/baton,
		/obj/item/knife/combat,
		/obj/item/shield/riot,
		/obj/item/gun,
	)
	variants = list(
		"policing" = list(
			MOD_ICON_OVERRIDE = 'modular_ss220/modules/return_prs/novaya_ert/icons/mod.dmi',
			MOD_WORN_ICON_OVERRIDE = 'modular_ss220/modules/return_prs/novaya_ert/icons/wornmod.dmi',
			/obj/item/clothing/head/mod = list(
				UNSEALED_LAYER = HEAD_LAYER,
				UNSEALED_CLOTHING = SNUG_FIT,
				SEALED_CLOTHING = THICKMATERIAL|STOPSPRESSUREDAMAGE,
				SEALED_INVISIBILITY =  HIDEFACIALHAIR|HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDESNOUT,
				SEALED_COVER = HEADCOVERSMOUTH|HEADCOVERSEYES|PEPPERPROOF,
				UNSEALED_MESSAGE = HELMET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = HELMET_SEAL_MESSAGE,
			),
			/obj/item/clothing/suit/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				SEALED_INVISIBILITY = HIDEJUMPSUIT|HIDETAIL,
				UNSEALED_MESSAGE = CHESTPLATE_UNSEAL_MESSAGE,
				SEALED_MESSAGE = CHESTPLATE_SEAL_MESSAGE,
			),
			/obj/item/clothing/gloves/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = GAUNTLET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = GAUNTLET_SEAL_MESSAGE,
			),
			/obj/item/clothing/shoes/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = BOOT_UNSEAL_MESSAGE,
				SEALED_MESSAGE = BOOT_SEAL_MESSAGE,
			),
		),
	)

/obj/item/mod/control/pre_equipped/policing
	theme = /datum/mod_theme/policing
	applied_modules = list(
		/obj/item/mod/module/storage/large_capacity,
		/obj/item/mod/module/thermal_regulator,
		/obj/item/mod/module/status_readout/operational,
		/obj/item/mod/module/tether,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/paper_dispenser,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/jetpack
	)
	default_pins = list(
		/obj/item/mod/module/paper_dispenser,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/tether,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/thermal_regulator,
	)

/obj/item/mod/control/pre_equipped/policing/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/manufacturer_examine, COMPANY_ZCM)

