/mob/living/carbon/human/canUseHUD()
	. = ..()
	if (!.)
		return FALSE
	var/area/cur_area = get_area(src)
	if (!cur_area)
		return .
	. = !istype(cur_area, /area/virtual_domain)
	return .
