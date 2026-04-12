

/datum/loadout_item/toys/plush/brigadier_general
	name = "Brigadier General Plushie"
	item_path = /obj/item/toy/plush/brigadier_general

/obj/item/toy/plush/brigadier_general
	name = "Brigadier general Gold Plushie"
	desc = "Эта игрушка была сделана в честь бригадного генерала Солнечной Федерации, погибшего в одном из самых ожесточенных боев \
	в истории Федерации. На задней части игрушки имеется бирка с надписью: \"Важно дойти до конца!\"."
	icon = 'modular_celadon/modules/loadout_addiction/icons/toys/plushies.dmi'
	icon_state = "brigadier_general"
	lefthand_file = 'modular_celadon/modules/loadout_addiction/icons/toys/plushies_lefthand.dmi'
	righthand_file = 'modular_celadon/modules/loadout_addiction/icons/toys/plushies_righthand.dmi'
	inhand_icon_state = "brigadier_general"
	COOLDOWN_DECLARE(speech_cooldown)
	squeak_override = list('sound/items/weapons/thudswoosh.ogg'=1)

/obj/item/toy/plush/brigadier_general/attack_self(mob/user)
	. = ..()
	if(!COOLDOWN_FINISHED(src, speech_cooldown))
		return
	say("Важно дойти до конца...")
	COOLDOWN_START(src, speech_cooldown, 5 SECONDS)
