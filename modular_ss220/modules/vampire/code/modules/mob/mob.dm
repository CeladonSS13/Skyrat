GLOBAL_LIST_INIT(holy_areas, typecacheof(list(
	/area/station/service/chapel,
	/area/station/maintenance/department/chapel
)))

/mob/living/carbon/proc/is_muzzled()
	return istype(wear_mask, /obj/item/clothing/mask/muzzle)

/datum/movespeed_modifier/vampire_cloak
	multiplicative_slowdown = -0.5
	movetypes = GROUND
	blacklisted_movetypes = (FLYING|FLOATING)

/datum/movespeed_modifier/status_effect/blood_rush
	multiplicative_slowdown = -0.5
	movetypes = GROUND
	blacklisted_movetypes = (FLYING|FLOATING)

/mob/proc/make_invisible()
	invisibility = 45
	alpha = 128
	remove_from_all_data_huds()

/mob/proc/reset_visibility()
	invisibility = initial(invisibility)
	alpha = initial(alpha)
	add_to_all_human_data_huds()
