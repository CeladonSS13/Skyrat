//debug radiokey
/obj/item/encryptionkey/debug
	name = "unknown radio encryption key"
	channels = list(RADIO_CHANNEL_COMMON = 1,
		RADIO_CHANNEL_INTERDYNE = 1,
		RADIO_CHANNEL_CYBERSUN = 1,
		RADIO_CHANNEL_SYNDICATE = 1,
		RADIO_CHANNEL_UPLINK = 1,
		RADIO_CHANNEL_GUILD = 1,
		RADIO_CHANNEL_FACTION = 1,
		RADIO_CHANNEL_SOLFED = 1,
		RADIO_CHANNEL_TARKON = 1,
		RADIO_CHANNEL_CENTCOM = 1,
		RADIO_CHANNEL_COMMAND = 1,
		RADIO_CHANNEL_SECURITY = 1,
		RADIO_CHANNEL_ENGINEERING = 1,
		RADIO_CHANNEL_SCIENCE = 1,
		RADIO_CHANNEL_MEDICAL = 1,
		RADIO_CHANNEL_SUPPLY = 1,
		RADIO_CHANNEL_SERVICE = 1,
		RADIO_CHANNEL_AI_PRIVATE = 1,
		RADIO_CHANNEL_ENTERTAINMENT = 1,)
	special_channels = RADIO_SPECIAL_CENTCOM | RADIO_SPECIAL_SYNDIE | RADIO_SPECIAL_BINARY
	language_data = list(
		/datum/language/machine = 100,
		/datum/language/piratespeak = 100,
		/datum/language/beachbum = 100,
		/datum/language/codespeak = 100,
		/datum/language/monkey = 100,
		/datum/language/vox = 100,
		/datum/language/aphasia = 100,
		/datum/language/narsie = 100,
		/datum/language/uncommon = 100,
		/datum/language/common = 100,
		/datum/language/draconic = 100,
		/datum/language/slime = 100,
		/datum/language/moffic = 100,
		/datum/language/sylvan = 100,
		/datum/language/shadowtongue = 100,
		/datum/language/terrum = 100,
		/datum/language/nekomimetic = 100,
		/datum/language/skrell = 100,
		/datum/language/kobold = 100,
		/datum/language/ratvar = 100,
		/datum/language/xenocommon = 100,
		/datum/language/buzzwords = 100,
		/datum/language/akulan = 100,
		/datum/language/calcic = 100,
		/datum/language/canilunzt = 100,
		/datum/language/gutter = 100,
		/datum/language/mushroom = 100,
		/datum/language/panslavic = 100,
		/datum/language/schechi = 100,
		/datum/language/siiktajr = 100,
		/datum/language/spacer = 100,
		/datum/language/spinwarder = 100,
		/datum/language/voltaic = 100,
		/datum/language/xerxian = 100,
		/datum/language/yangyu = 100,
		/datum/language/primitive_catgirl = 100,
		/datum/language/carptongue = 100,
		/datum/language/drone = 100,
		/datum/language/ashtongue = 100,
		/datum/language/chitinclick = 100,
	)

/obj/item/radio/headset/headset_cent/alt/leader/debug
	name = "\improper Unknown bowman headset"
	desc = "A headset especially for ... personnel. Protects ears from flashbangs."
	keyslot = /obj/item/encryptionkey/debug
	subspace_transmission = FALSE
	subspace_switchable = TRUE
	freerange = TRUE

/obj/item/radio/headset/silicon/ai/faction
	keyslot2 = /obj/item/encryptionkey/debug

// /obj/machinery/computer/cryopod
// 	radio = /obj/item/radio/headset/silicon/ai/faction
