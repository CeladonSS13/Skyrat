/obj/item/clothing/mask/fakemoustache/italian/Initialize(mapload)
	. = ..()
	if (check_holidays(APRIL_FOOLS))
		AddComponent(/datum/component/speechmod, replacements = strings("celadon/oguzok.json", "oguzok"), end_string = list(" Предатель!"," Иуды!"," Инвалиды!", " Уроды!"), end_string_chance = 3, slots = ITEM_SLOT_MASK)
	else
		AddComponent(/datum/component/speechmod, replacements = strings("celadon/italian_replacement_ru.json", "italian"), end_string = list(" Равиоли, равиоли, подскажи мне формуоли!"," Мамма-мия!"," Мамма-мия! Какая острая фрикаделька!", " Ла ла ла ла ла фуникули+ фуникуля+!"), end_string_chance = 3, slots = ITEM_SLOT_MASK)
