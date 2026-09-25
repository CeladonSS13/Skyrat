/obj/item/ammo_box/magazine/m762_phaze
	name = "phaze Shift magazine (7.62x39mm)"
	desc = "Magazine for phaze Shift T-9 with 7.62x39mm rounds."
	icon = 'modular_celadon/modules/weapons_addon/icons/phz.dmi'
	icon_state = "magazine_phaze"
	base_icon_state = "magazine_phaze"
	ammo_type = /obj/item/ammo_casing/a762_phaze
	caliber = CALIBER_762PHAZE
	multiple_sprite_use_base = TRUE
	max_ammo = 30
//Update magazine icons
/obj/item/ammo_box/magazine/m762_phaze/update_icon_state()
	. = ..()
	var/ammo_count = stored_ammo ? stored_ammo.len : 0
	var/rounded_ammo = round(ammo_count, 5)
	var/display_ammo = (rounded_ammo == 0 && ammo_count > 0) ? 5 : rounded_ammo
	icon_state = "[base_icon_state]-[display_ammo]"
