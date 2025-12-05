//centcom access mappers
/// centcom admiral
/obj/effect/mapping_helpers/airlock/access/any/admin/admiral/get_access()
	var/list/access_list = ..()
	access_list += list(ACCESS_CENT_ADMIRAL)
	return access_list

/obj/effect/mapping_helpers/airlock/access/all/admin/admiral/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_CENT_ADMIRAL
	return access_list

/// centcom fleet admiral
/obj/effect/mapping_helpers/airlock/access/any/admin/fleet_admiral/get_access()
	var/list/access_list = ..()
	access_list += list(ACCESS_CENT_FLEET_ADMIRAL)
	return access_list

/obj/effect/mapping_helpers/airlock/access/all/admin/fleet_admiral/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_CENT_FLEET_ADMIRAL
	return access_list

/// centcom specops leader
/obj/effect/mapping_helpers/airlock/access/any/admin/specops_leader/get_access()
	var/list/access_list = ..()
	access_list += list(ACCESS_CENT_SPECOPS_LEADER)
	return access_list

/obj/effect/mapping_helpers/airlock/access/all/admin/specops_leader/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_CENT_SPECOPS_LEADER
	return access_list

/// centcom blackops
/obj/effect/mapping_helpers/airlock/access/any/admin/blackops/get_access()
	var/list/access_list = ..()
	access_list += list(ACCESS_CENT_BLACKOPS)
	return access_list

/obj/effect/mapping_helpers/airlock/access/all/admin/blackops/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_CENT_BLACKOPS
	return access_list

/// centcom specops officer
/obj/effect/mapping_helpers/airlock/access/any/admin/specops_officer/get_access()
	var/list/access_list = ..()
	access_list += list(ACCESS_CENT_SPECOPS_OFFICER)
	return access_list

/obj/effect/mapping_helpers/airlock/access/all/admin/specops_officer/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_CENT_SPECOPS_OFFICER
	return access_list

/// centcom security
/obj/effect/mapping_helpers/airlock/access/any/admin/security/get_access()
	var/list/access_list = ..()
	access_list += list(ACCESS_CENT_SECURITY)
	return access_list

/obj/effect/mapping_helpers/airlock/access/all/admin/security/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_CENT_SECURITY
	return access_list

/// centcom cargo office
/obj/effect/mapping_helpers/airlock/access/any/admin/supply/get_access()
	var/list/access_list = ..()
	access_list += list(ACCESS_CENT_SUPPLY)
	return access_list

/obj/effect/mapping_helpers/airlock/access/all/admin/supply/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_CENT_SUPPLY
	return access_list

/// centcom official access
/obj/effect/mapping_helpers/airlock/access/any/admin/official/get_access()
	var/list/access_list = ..()
	access_list += list(ACCESS_CENT_OFFICIAL)
	return access_list

/obj/effect/mapping_helpers/airlock/access/all/admin/official/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_CENT_OFFICIAL
	return access_list
