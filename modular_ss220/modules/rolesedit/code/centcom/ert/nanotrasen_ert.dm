
//closets override
/obj/structure/closet/secure_closet/ert_com
	req_access = list(ACCESS_CENT_SPECOPS)
	req_one_access = list(ACCESS_CENT_SPECOPS_LEADER, ACCESS_CENT_SPECOPS_OFFICER)

/obj/structure/closet/secure_closet/ert_sec
	req_access = list(ACCESS_CENT_SPECOPS)
	req_one_access = list(ACCESS_CENT_SECURITY, ACCESS_CENT_SPECOPS_LEADER, ACCESS_CENT_SPECOPS_OFFICER)

/obj/structure/closet/secure_closet/ert_med
	req_access = list(ACCESS_CENT_SPECOPS)
	req_one_access = list(ACCESS_CENT_MEDICAL, ACCESS_CENT_SPECOPS_LEADER, ACCESS_CENT_SPECOPS_OFFICER)

/obj/structure/closet/secure_closet/ert_engi
	req_access = list(ACCESS_CENT_SPECOPS)
	req_one_access = list(ACCESS_CENT_STORAGE, ACCESS_CENT_SPECOPS_LEADER, ACCESS_CENT_SPECOPS_OFFICER)


//trims
/datum/id_trim/centcom/ert/commander
	assignment = JOB_ERT_COMMANDER
	trim_state = "trim_ert_commander"
	sechud_icon_state = SECHUD_EMERGENCY_RESPONSE_TEAM_COMMANDER

/datum/id_trim/centcom/ert/commander/New()
	. = ..()

	access = (SSid_access.get_region_access_list(list(REGION_CENTCOM, REGION_ALL_STATION)) + ACCESS_CENT_SPECOPS + ACCESS_CENT_SPECOPS_LEADER)

/datum/id_trim/centcom/ert/security
	assignment = JOB_ERT_OFFICER
	trim_state = "trim_securityofficer"
	subdepartment_color = COLOR_SECURITY_RED
	sechud_icon_state = SECHUD_SECURITY_RESPONSE_OFFICER
	big_pointer = FALSE
	honorifics = list("Officer")
	honorific_positions = HONORIFIC_POSITION_LAST | HONORIFIC_POSITION_NONE

/datum/id_trim/centcom/ert/security/New()
	. = ..()

	access = list(ACCESS_CENT_GENERAL, ACCESS_CENT_SPECOPS, ACCESS_CENT_SECURITY, ACCESS_CENT_LIVING) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)))

/datum/id_trim/centcom/ert/engineer
	assignment = JOB_ERT_ENGINEER
	trim_state = "trim_stationengineer"
	subdepartment_color = COLOR_ENGINEERING_ORANGE
	sechud_icon_state = SECHUD_ENGINEERING_RESPONSE_OFFICER
	big_pointer = FALSE

/datum/id_trim/centcom/ert/engineer/New()
	. = ..()

	access = list(ACCESS_CENT_GENERAL, ACCESS_CENT_SPECOPS, ACCESS_CENT_LIVING, ACCESS_CENT_STORAGE) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)))

/datum/id_trim/centcom/ert/medical
	assignment = JOB_ERT_MEDICAL_DOCTOR
	trim_state = "trim_medicaldoctor"
	subdepartment_color = COLOR_MEDICAL_BLUE
	sechud_icon_state = SECHUD_MEDICAL_RESPONSE_OFFICER
	big_pointer = FALSE
	honorifics = list("Doctor", "Dr.")
	honorific_positions = HONORIFIC_POSITION_LAST | HONORIFIC_POSITION_NONE

/datum/id_trim/centcom/ert/medical/New()
	. = ..()

	access = list(ACCESS_CENT_GENERAL, ACCESS_CENT_SPECOPS, ACCESS_CENT_MEDICAL, ACCESS_CENT_LIVING) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)))

/datum/id_trim/centcom/ert/chaplain
	assignment = JOB_ERT_CHAPLAIN
	trim_state = "trim_chaplain"
	subdepartment_color = COLOR_SERVICE_LIME
	sechud_icon_state = SECHUD_RELIGIOUS_RESPONSE_OFFICER
	big_pointer = FALSE
	honorifics = list("Chaplain")
	honorific_positions = HONORIFIC_POSITION_LAST | HONORIFIC_POSITION_NONE

/datum/id_trim/centcom/ert/chaplain/New()
	. = ..()

	access = list(ACCESS_CENT_GENERAL, ACCESS_CENT_SPECOPS, ACCESS_CENT_SECURITY, ACCESS_CENT_LIVING) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)))

/datum/id_trim/centcom/ert/janitor
	assignment = JOB_ERT_JANITOR
	trim_state = "trim_ert_janitor"
	subdepartment_color = COLOR_SERVICE_LIME
	sechud_icon_state = SECHUD_JANITORIAL_RESPONSE_OFFICER
	big_pointer = FALSE
	honorifics = list("Custodian")
	honorific_positions = HONORIFIC_POSITION_LAST | HONORIFIC_POSITION_NONE

/datum/id_trim/centcom/ert/janitor/New()
	. = ..()

	access = list(ACCESS_CENT_GENERAL, ACCESS_CENT_LIVING) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)))

/datum/id_trim/centcom/ert/clown
	assignment = JOB_ERT_CLOWN
	trim_state = "trim_clown"
	subdepartment_color = COLOR_MAGENTA
	sechud_icon_state = SECHUD_ENTERTAINMENT_RESPONSE_OFFICER
	big_pointer = FALSE

/datum/id_trim/centcom/ert/clown/New()
	. = ..()

	access = list(ACCESS_CENT_GENERAL, ACCESS_CENT_LIVING) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)) - ACCESS_CHANGE_IDS)
