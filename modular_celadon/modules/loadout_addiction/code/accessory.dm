/datum/loadout_item/accessory/armband_red
	name = "Red Armband"
	item_path = /obj/item/clothing/accessory/armband

/datum/loadout_item/accessory/armband_security
	restricted_roles = list(JOB_HEAD_OF_SECURITY, JOB_SECURITY_OFFICER, JOB_WARDEN, JOB_DETECTIVE, JOB_CORRECTIONS_OFFICER, JOB_CAPTAIN, JOB_BLUESHIELD, JOB_NT_REP, JOB_SECURITY_MEDIC)

/datum/loadout_item/accessory/press
	name = "Press Badge"
	item_path = /obj/item/clothing/accessory/press_badge
	restricted_roles = list(JOB_CURATOR, JOB_HEAD_OF_PERSONNEL, JOB_CAPTAIN, JOB_NT_REP)


///disabled

/datum/loadout_item/accessory/pride
	erp_item = TRUE
