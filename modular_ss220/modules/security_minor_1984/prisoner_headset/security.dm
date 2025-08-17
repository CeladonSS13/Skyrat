/obj/structure/closet/secure_closet/brig/PopulateContents()
	..()

	new /obj/item/radio/headset( src )

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
