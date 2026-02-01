// Trims for various Centcom corpses. (used by ruins and in events)
/datum/id_trim/centcom/corpse/bridge_officer
	access = list(ACCESS_CENT_OFFICER)

/datum/id_trim/centcom/corpse/commander
	access = list(ACCESS_CENT_GENERAL, ACCESS_CENT_SECURITY, ACCESS_CENT_SPECOPS, ACCESS_CENT_OFFICER, ACCESS_CENT_MEDICAL, ACCESS_CENT_STORAGE)

/datum/id_trim/centcom/corpse/private_security
	access = list(ACCESS_CENT_GENERAL, ACCESS_CENT_SECURITY, ACCESS_CENT_SPECOPS, ACCESS_CENT_OFFICER, ACCESS_CENT_MEDICAL, ACCESS_CENT_STORAGE, ACCESS_SECURITY, ACCESS_MECH_SECURITY)

/datum/id_trim/centcom/corpse/assault
	access = list(ACCESS_CENT_GENERAL, ACCESS_CENT_SECURITY, ACCESS_CENT_SPECOPS, ACCESS_CENT_SPECOPS_LEADER, ACCESS_CENT_MEDICAL, ACCESS_CENT_STORAGE, ACCESS_SECURITY, ACCESS_MECH_SECURITY)


//Centcom job ranks override

/// Trim for Centcom Officials. Basic access.
/datum/id_trim/centcom/official
	access = list(ACCESS_CENT_GENERAL, ACCESS_CENT_LIVING, ACCESS_CENT_OFFICIAL, ACCESS_COMMAND, ACCESS_GATEWAY, ACCESS_EVA, ACCESS_VAULT, ACCESS_SECURITY, ACCESS_BRIG_ENTRANCE, ACCESS_DETECTIVE, ACCESS_LAWYER, ACCESS_COURT, ACCESS_WEAPONS, ACCESS_CARGO, ACCESS_SERVICE, ACCESS_CONSTRUCTION, ACCESS_SCIENCE, ACCESS_MEDICAL)

/// head intern access, a bit big for intern, but still no bridge access
/datum/outfit/centcom/centcom_intern/leader
	id_trim = /datum/id_trim/centcom/intern/head

/// Trim for Centcom Elite Bartenders.
/datum/id_trim/centcom/bartender
	access = list(ACCESS_CENT_GENERAL, ACCESS_CENT_LIVING, ACCESS_CENT_BAR, ACCESS_BAR, ACCESS_KITCHEN)

/// Trim for Centcom Medical Officers.
/datum/id_trim/centcom/medical_officer
	access = list(ACCESS_CENT_GENERAL, ACCESS_CENT_LIVING, ACCESS_CENT_MEDICAL, ACCESS_MEDICAL, ACCESS_SURGERY, ACCESS_PARAMEDIC, ACCESS_PSYCHOLOGY, ACCESS_PHARMACY, ACCESS_PLUMBING, ACCESS_MECH_MEDICAL)


///commanders trims
/datum/id_trim/centcom/naval
	assignment = JOB_NAVAL_ENSIGN

/datum/id_trim/centcom/naval/New()
	. = ..()
	access = (SSid_access.get_region_access_list(list(REGION_CENTCOM, REGION_ALL_STATION)))


/datum/id_trim/centcom/naval/lieutenant
	assignment = JOB_NAVAL_LIEUTENANT

/datum/id_trim/centcom/naval/lieutenant/New()
	. = ..()
	access = (SSid_access.get_region_access_list(list(REGION_CENTCOM, REGION_ALL_STATION)) + ACCESS_CENT_SPECOPS)

/datum/id_trim/centcom/naval/ltcr
	assignment = JOB_NAVAL_LTCR

/datum/id_trim/centcom/naval/ltcr/New()
	. = ..()
	access = (SSid_access.get_region_access_list(list(REGION_CENTCOM, REGION_ALL_STATION)) + ACCESS_CENT_SPECOPS + ACCESS_CENT_SPECOPS_LEADER + ACCESS_CENT_OFFICER)

/datum/id_trim/centcom/commander/New()
	. = ..()

	access = (SSid_access.get_region_access_list(list(REGION_CENTCOM, REGION_CENTCOM_SPECOPS, REGION_ALL_STATION)) + ACCESS_CENT_OFFICER)

/datum/id_trim/centcom/naval/commander
	assignment = JOB_NAVAL_COMMANDER

/datum/id_trim/centcom/naval/commander/New()
	. = ..()

	access = (SSid_access.get_region_access_list(list(REGION_CENTCOM, REGION_CENTCOM_SPECOPS, REGION_ALL_STATION)) + ACCESS_CENT_OFFICER)

/datum/id_trim/centcom/specops_officer
	assignment = JOB_CENTCOM_SPECIAL_OFFICER
	big_pointer = TRUE

/datum/id_trim/centcom/specops_officer/New()
	. = ..()

	access = (SSid_access.get_region_access_list(list(REGION_CENTCOM, REGION_CENTCOM_SPECOPS, REGION_ALL_STATION)) + ACCESS_CENT_OFFICER + ACCESS_CENT_SPECOPS_OFFICER)

/datum/id_trim/centcom/naval/captain
	assignment = JOB_NAVAL_CAPTAIN

/datum/id_trim/centcom/naval/captain/New()
	. = ..()

	access = SSid_access.get_region_access_list(list(REGION_CENTCOM, REGION_CENTCOM_SPECOPS, REGION_CENTCOM_CAPTAIN, REGION_ALL_STATION))

/datum/id_trim/centcom/naval/rear_admiral
	assignment = JOB_NAVAL_REAR_ADMIRAL

/datum/id_trim/centcom/naval/rear_admiral/New()
	. = ..()

	access = (SSid_access.get_region_access_list(list(REGION_ALL_CENTCOM, REGION_ALL_STATION)) - ACCESS_CENT_FLEET_ADMIRAL)

/datum/id_trim/centcom/admiral/New()
	. = ..()

	access = (SSid_access.get_region_access_list(list(REGION_ALL_CENTCOM, REGION_ALL_STATION)) - ACCESS_CENT_FLEET_ADMIRAL)

/datum/id_trim/centcom/naval/admiral
	assignment = JOB_NAVAL_ADMIRAL

/datum/id_trim/centcom/naval/admiral/New()
	. = ..()

	access = (SSid_access.get_region_access_list(list(REGION_ALL_CENTCOM, REGION_ALL_STATION)) - ACCESS_CENT_FLEET_ADMIRAL)

/datum/id_trim/centcom/naval/fleet_admiral
	assignment = JOB_NAVAL_FLEET_ADMIRAL

/datum/id_trim/centcom/naval/fleet_admiral/New()
	. = ..()

	access = (SSid_access.get_region_access_list(list(REGION_ALL_CENTCOM, REGION_ALL_STATION)))
