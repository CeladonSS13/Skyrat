/obj/item/ammo_box/magazine/m762_phaze
	name = "phaze Shift magazine (7.62x39mm)"
	desc = "Magazine for phaze Shift T-9 with 7.62x39mm rounds."
	icon = 'modular_celadon/modules/weapons_addon/code/weapon_PZH/icon/phz.dmi'
	icon_state = "magazine_phaze-30"
	base_icon_state="magazine_phaze"
	ammo_type = /obj/item/ammo_casing/a762_phaze
	caliber = "762_phaze"
	max_ammo = 30
//Update magazine icons
/obj/item/ammo_box/magazine/m762_phaze/update_icon_state()
    . = ..()
    var/ammo = stored_ammo.len
    if(ammo <= 0)
        icon_state = "[base_icon_state]-0"
    else
        icon_state = "[base_icon_state]-[round(ammo, 5)]"
