//jobs
/datum/job/ds2/mining
	bounty_types = DYNE_JOB_COMMAND
	paycheck_department = ACCOUNT_DS2

/datum/job/ds2/service
	bounty_types = DS2_JOB_SERVICE
	paycheck_department = ACCOUNT_DS2

//spawners override
/obj/effect/mob_spawn/ghost_role/human/ds2/syndicate/miner
	spawner_job_path = /datum/job/ds2/mining

//outfits
/datum/outfit/ds2
	role_job = /datum/job/ds2

/datum/outfit/ds2/prisoner
	role_job = /datum/job/ds2/prisoner

/datum/outfit/ds2/syndicate_command
	role_job = /datum/job/ds2/command

/datum/outfit/ds2/syndicate/miner
	role_job = /datum/job/ds2/mining

/datum/outfit/ds2/syndicate/service
	role_job = /datum/job/ds2/service

/datum/outfit/ds2/syndicate/enginetech
	role_job = /datum/job/ds2/engineer
	skillchips = list(/obj/item/skillchip/job/engineer)

/datum/outfit/ds2/syndicate/researcher
	role_job = /datum/job/ds2/science

/datum/outfit/ds2/syndicate/stationmed
	role_job = /datum/job/ds2/science

/datum/outfit/ds2/syndicate/brigoff
	role_job = /datum/job/ds2/enforce

//closets
/obj/structure/closet/secure_closet/des_two/sa_locker
	req_access = list(ACCESS_SYNDICATE_DS, ACCESS_SYNDICATE_IP, ACCESS_SYNDICATE_LEADER)

/obj/structure/closet/secure_closet/des_two/cl_locker
	req_access = list(ACCESS_SYNDICATE_DS, ACCESS_SYNDICATE_IP, ACCESS_SYNDICATE_LEADER)

/obj/structure/closet/secure_closet/des_two/maa_locker
	req_access = list(ACCESS_SYNDICATE_DS, ACCESS_SYNDICATE_LEADER)
