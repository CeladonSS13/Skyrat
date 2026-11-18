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

//interlink tram

#define INTERLINK_CELADON_LINE_1 "intlceladon_1"


#define INTERLINK_CELADON_PORT 1
#define INTERLINK_CELADON_CENTRAL 2
#define INTERLINK_CELADON_STARBOARD 3

/obj/effect/landmark/transport/transport_id/interlink_tram_celadon
	specific_transport_id = INTERLINK_CELADON_LINE_1

/obj/effect/landmark/transport/nav_beacon/tram/nav/interlink_tram_celadon
	name = INTERLINK_CELADON_LINE_1
	specific_transport_id = TRAM_NAV_BEACONS

/obj/effect/landmark/transport/nav_beacon/tram/platform/interlink_tram_celadon/left
	name = "Port"
	specific_transport_id = INTERLINK_CELADON_LINE_1
	platform_code = INTERLINK_CELADON_PORT
	tgui_icons = list("Reception" = "briefcase", "Botany" = "leaf", "Chemistry" = "flask")

/obj/effect/landmark/transport/nav_beacon/tram/platform/interlink_tram_celadon/middle
	name = "Central"
	specific_transport_id = INTERLINK_CELADON_LINE_1
	platform_code = INTERLINK_CELADON_CENTRAL
	tgui_icons = list("Shuttle" = "plane-departure", "Security" = "gavel")

/obj/effect/landmark/transport/nav_beacon/tram/platform/interlink_tram_celadon/right
	name = "Starboard"
	specific_transport_id = INTERLINK_CELADON_LINE_1
	platform_code = INTERLINK_CELADON_STARBOARD
	tgui_icons = list("Medical" = "plus", "Engineering" = "wrench", "Dormitories" = "bed")

/obj/machinery/transport/tram_controller/interlink_tram_celadon
	configured_transport_id = INTERLINK_CELADON_LINE_1
