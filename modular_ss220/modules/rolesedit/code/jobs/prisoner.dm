//prison headset
/obj/item/radio/headset/prison
	name = "\improper Prison headset"
	desc = "An updated, modular intercom that fits over the head. Takes encryption keys. This one made for prisoners and it locked to prison freq."
	icon = 'icons/obj/clothing/headsets.dmi'
	icon_state = "headset"
	freerange = TRUE
	freqlock = TRUE

/obj/item/radio/headset/prison/Initialize(mapload)
	. = ..()
	frequency = FREQ_PRISON

/obj/item/encryptionkey/prison
	name = "prison radio encryption key"
	channels = list(RADIO_CHANNEL_PRISON = 1)
	greyscale_colors = "#820a16#3bca5a"

/obj/structure/closet/secure_closet/brig/PopulateContents()
	..()

	new /obj/item/radio/headset( src )

/obj/structure/closet/secure_closet/brig/permanent
	name = "permabrig locker"

/obj/structure/closet/secure_closet/brig/permanent/PopulateContents()

	new /obj/item/clothing/under/rank/prisoner( src )
	new /obj/item/clothing/under/rank/prisoner/skirt( src )
	new /obj/item/clothing/shoes/sneakers/orange( src )
	new /obj/item/radio/headset/prison( src )

/obj/structure/closet/secure_closet/brig/genpop/PopulateContents()

	new /obj/item/clothing/under/rank/prisoner( src )
	new /obj/item/clothing/under/rank/prisoner/skirt( src )
	new /obj/item/clothing/shoes/sneakers/orange( src )
	new /obj/item/radio/headset/prison( src )

/datum/design/permabrig_key
	name = "prison radio encryption key"
	desc = "Radio encryption key to hear prison channel."
	id = "permabrig_key"
	build_path = /obj/item/encryptionkey/prison
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT*0.25, /datum/material/glass = SMALL_MATERIAL_AMOUNT*0.25)
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/design/permabrig_headset
	name = "prison headset"
	id = "permabrig_headset"
	build_path = /obj/item/radio/headset/prison
	build_type = PROTOLATHE | AWAY_LATHE | AUTOLATHE
	materials = list(/datum/material/iron = SMALL_MATERIAL_AMOUNT*0.75)
	category = list(
		RND_CATEGORY_EQUIPMENT + RND_SUBCATEGORY_EQUIPMENT_SECURITY
	)
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/datum/techweb_node/basic_arms/New()
	design_ids += list(
		"permabrig_key",
		"permabrig_headset",
	)
	return ..()

/obj/machinery/telecomms/bus/preset_three/Initialize(mapload)
	. = ..()
	freq_listening += FREQ_PRISON

/obj/machinery/telecomms/receiver/preset_right/Initialize(mapload)
	. = ..()
	freq_listening += FREQ_PRISON

/obj/machinery/telecomms/server/presets/security/Initialize(mapload)
	. = ..()
	freq_listening += FREQ_PRISON

//prisoner outfit/job override

/datum/job/prisoner
	disable_all_loadout = TRUE

/datum/outfit/job/prisoner
	ears = /obj/item/radio/headset/prison

//latejoin override
/datum/job/prisoner/get_latejoin_spawn_point()
	. = ..()
	var/turf/spawn_point_original = .
	if (!spawn_point_original)
		return .
	var/turf/spawn_point
	var/list/turf/possible_turfs = list()
	for(var/obj/machinery/cryopod/prison/cryo_pod as anything in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/cryopod/prison))
		if (!cryo_pod)
			continue

		var/area/cryopod_area = get_area(cryo_pod)
		if (!cryopod_area || !istype(cryopod_area, /area/station/security/prison))
			continue

		var/turf/cryopod_turf = get_turf(cryo_pod)
		if (!cryopod_turf)
			continue

		possible_turfs += cryopod_turf

	if (length(possible_turfs) < 1)
		return .

	spawn_point = pick(possible_turfs)

	. = spawn_point ? spawn_point : spawn_point_original
	return .

//misc

//prison vendor spawn disabler
/datum/area_spawn/lustwish_prison
	amount_to_spawn = 0
