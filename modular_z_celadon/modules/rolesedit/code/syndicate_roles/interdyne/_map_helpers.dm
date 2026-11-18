//mapping helpers
/obj/effect/mapping_helpers/airlock/access/all/syndicate/ip/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_SYNDICATE_IP
	return access_list

/obj/effect/mapping_helpers/airlock/access/any/syndicate/ip/get_access()
	var/list/access_list = ..()
	access_list += list(ACCESS_SYNDICATE_IP)
	return access_list
