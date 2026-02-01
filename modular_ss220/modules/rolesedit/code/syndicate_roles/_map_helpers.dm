//mapping helpers
/obj/effect/mapping_helpers/airlock/access/all/syndicate/officer/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_SYNDICATE_OFFICER
	return access_list

/obj/effect/mapping_helpers/airlock/access/any/syndicate/officer/get_access()
	var/list/access_list = ..()
	access_list += list(ACCESS_SYNDICATE_OFFICER)
	return access_list
