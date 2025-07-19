// interdyne code
#define SECHUD_SYNDICATE_INTERDYNE_GREEN "hudinterdynegreen"
#define SECHUD_SYNDICATE_INTERDYNE_GREEN_MINER "hudinterdynegreenminer"
#define SECHUD_SYNDICATE_INTERDYNE_GREEN_HEAD "hudinterdynegreenhead"
#define ACCESS_SYNDICATE_IP "syndicate_interdyne"
// ds 2 code
#define ACCESS_SYNDICATE_DS "syndicate_deepspace"

// mapping helpers

/obj/effect/mapping_helpers/airlock/access/all/syndicate/ds/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_SYNDICATE_DS
	return access_list

/obj/effect/mapping_helpers/airlock/access/any/syndicate/ds/get_access()
	var/list/access_list = ..()
	access_list += list(ACCESS_SYNDICATE_DS)
	return access_list

/obj/effect/mapping_helpers/airlock/access/all/syndicate/ip/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_SYNDICATE_IP
	return access_list

/obj/effect/mapping_helpers/airlock/access/any/syndicate/ip/get_access()
	var/list/access_list = ..()
	access_list += list(ACCESS_SYNDICATE_IP)
	return access_list
