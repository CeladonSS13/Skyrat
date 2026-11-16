/obj/item/radio/headset/headset_cargo/bitrunning
	keyslot = /obj/item/encryptionkey/headset_bitrunning
	keyslot2 = /obj/item/encryptionkey/headset_mining

/obj/item/radio/headset/headset_cargo/bitrunning/bitrun_alt
	name = "Bitrunning bowman headset"
	desc = "Headset used by the combat bitrunners. Protects ears from flashbangs."
	icon_state = "com_headset_alt"
	keyslot2 = null

/obj/item/radio/headset/headset_cargo/bitrunning/bitrun_alt/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS))

/obj/item/encryptionkey/headset_bitrunning
	channels = list(RADIO_CHANNEL_BITRUN = 1)
	special_channels = RADIO_SPECIAL_CENTCOM	//weird thing for allowing bitrunners to speak in bit domain channel

/obj/item/radio/headset/headset_cargo/bitdefend
	name = "bitdefender radio headset"
	desc = "A headset used by the opposite force of bitrunners."
	keyslot = /obj/item/encryptionkey/headset_bitdefend

/obj/item/encryptionkey/headset_bitdefend
	name = "bitdefender radio encryption key"
	channels = list(RADIO_CHANNEL_BITDEFEND = 1)
	special_channels = RADIO_SPECIAL_CENTCOM
	icon = 'icons/map_icons/items/_item.dmi'
	icon_state = "/obj/item/encryptionkey/headset_bitrunning"
	post_init_icon_state = "cypherkey_cargo"
	greyscale_config = /datum/greyscale_config/encryptionkey_security
	greyscale_colors = "#820a16#280b1a"

//removing faction and adding our channels
/obj/machinery/telecomms/server/presets/supply/Initialize(mapload)
	. = ..()
	freq_listening -= FREQ_FACTION
	freq_listening += FREQ_BITRUN
	freq_listening += FREQ_BITDEFEND

/obj/machinery/telecomms/receiver/preset_left/Initialize(mapload)
	. = ..()
	freq_listening -= FREQ_FACTION
	freq_listening += FREQ_BITRUN
	freq_listening += FREQ_BITDEFEND

/obj/machinery/telecomms/bus/preset_two/Initialize(mapload)
	. = ..()
	freq_listening -= FREQ_FACTION
	freq_listening += FREQ_BITRUN
	freq_listening += FREQ_BITDEFEND

/datum/outfit/virtual_syndicate
	ears = /obj/item/radio/headset/headset_cargo/bitdefend

/datum/outfit/cin_soldier_corpse
	ears = /obj/item/radio/headset/headset_cargo/bitdefend

/datum/outfit/cin_soldier_player
	ears = /obj/item/radio/headset/headset_cargo/bitdefend
