//jobs
/datum/job/interdyne_planetary_base/command
	bounty_types = DYNE_JOB_COMMAND

//outfits
/datum/outfit/interdyne_planetary_base
	role_job = /datum/job/interdyne_planetary_base

/datum/outfit/interdyne_planetary_base/ice
	role_job = /datum/job/interdyne_planetary_base_icebox

/datum/outfit/interdyne_planetary_base/shaftminer
	role_job = /datum/job/interdyne_planetary_base/mining

/datum/outfit/interdyne_planetary_base/shaftminer/ice
	role_job = /datum/job/interdyne_planetary_base_icebox/mining

/datum/outfit/interdyne_planetary_base/shaftminer/deckofficer
	role_job = /datum/job/interdyne_planetary_base/command

/datum/outfit/lavaland_syndicate/shaftminer/deckofficer
	role_job = /datum/job/interdyne_planetary_base/command

//closet
/obj/structure/closet/secure_closet/interdynefob/deckofficer_locker
	req_access = list(ACCESS_SYNDICATE_LEADER, ACCESS_SYNDICATE_IP)
