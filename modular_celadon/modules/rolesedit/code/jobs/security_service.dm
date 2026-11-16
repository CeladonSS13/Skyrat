//start landmark
/obj/effect/landmark/start/depsec/service
	name = "service_sec"
	department = SEC_DEPT_SERVICE

//checkpoint area
/area/station/security/checkpoint/service
	name = "Security Post - Service"
	icon_state = "checkpoint_service"

//id trim
/datum/id_trim/job/security_officer/service
	assignment = JOB_SECURITY_OFFICER_SERVICE
	subdepartment_color = COLOR_SERVICE_LIME
	department_access = list(
		ACCESS_BAR,
		ACCESS_JANITOR,
		ACCESS_SERVICE,
		ACCESS_BRIG_ENTRANCE,
		ACCESS_HYDROPONICS,
		ACCESS_KITCHEN,
		ACCESS_MINERAL_STOREROOM,
		ACCESS_MORGUE,
		ACCESS_SECURITY,
		ACCESS_THEATRE,
		ACCESS_WEAPONS,
	)
	elevated_access = list(
		ACCESS_BAR,
		ACCESS_JANITOR,
		ACCESS_SERVICE,
		ACCESS_BRIG_ENTRANCE,
		ACCESS_HYDROPONICS,
		ACCESS_KITCHEN,
		ACCESS_MINERAL_STOREROOM,
		ACCESS_MORGUE,
		ACCESS_SECURITY,
		ACCESS_THEATRE,
		ACCESS_WEAPONS,
	)
	honorifics = list("Bouncer", "Officer")

//headset
/obj/item/radio/headset/headset_sec/alt/department/service
	keyslot = /obj/item/encryptionkey/headset_sec
	keyslot2 = /obj/item/encryptionkey/headset_service
