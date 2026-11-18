/obj/effect/mapping_helpers/airlock/access/any/tarkon
	icon_state = "access_helper_syn"

/obj/effect/mapping_helpers/airlock/access/any/tarkon/general/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_TARKON
	return access_list

/obj/effect/mapping_helpers/airlock/access/all/tarkon/command/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_TARKON_COMMAND
	return access_list

/obj/effect/mapping_helpers/airlock/access/any/tarkon/command/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_TARKON_COMMAND
	return access_list

/obj/effect/mapping_helpers/airlock/access/all/tarkon/director/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_TARKON_DIRECTOR
	return access_list

/obj/effect/mapping_helpers/airlock/access/any/tarkon/director/get_access()
	var/list/access_list = ..()
	access_list += ACCESS_TARKON_DIRECTOR
	return access_list

/obj/effect/mapping_helpers/airlock/special_electronics/tarkon
	name = "airlock special electronics helper"
	electronics_type = /obj/item/electronics/airlock/special/tarkon
