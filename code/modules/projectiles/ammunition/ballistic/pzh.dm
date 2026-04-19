//bullet
/obj/projectile/bullet/a762_phaze
	name = "7.62x39mm bullet"
	damage = 50
	armour_penetration = 40
	icon_state = "bullet"
	wound_bonus = 50
///////////////////////////
// gulza/patron
/obj/item/ammo_casing/a762_phaze
	name = "7.62x39mm phaze round"
	desc = "A powerful rifle cartridge. Designed specifically for phaze Shift T-9."
	icon = 'icons/obj/weapons/guns/phz.dmi'
	icon_state = "762_casing_phaze"
	caliber = "762_phaze"
	projectile_type = /obj/projectile/bullet/a762_phaze
	harmful = TRUE
//////////////////////
//Magazine
/obj/item/ammo_box/magazine/m762_phaze
	name = "phaze Shift magazine (7.62x39mm)"
	desc = "Magazine for phaze Shift T-9 with 7.62x39mm rounds."
	icon = 'icons/obj/weapons/guns/phz.dmi'
	icon_state = "magazine_phaze"
	ammo_type = /obj/item/ammo_casing/a762_phaze
	caliber = "762_phaze"
	max_ammo = 30
////////////////////
/obj/item/ammo_box/magazine/m762_phaze/update_icon_state()
    . = ..()
    var/ammo = stored_ammo.len
    if(ammo <= 0)
        icon_state = "automatically_mag-0"
    else
        icon_state = "automatically_mag-[round(ammo, 5)]"
///////////////////
//Ammo box
/obj/item/ammo_box/a762_phaze
	name = "ammo box (7.62x39mm phaze)"
	desc = "A box with 7.62x39mm cartridges for phaze Shift T-9."
	icon = 'icons/obj/weapons/guns/phz.dmi'
	icon_state = "box_phaze-full"
	ammo_type = /obj/item/ammo_casing/a762_phaze
	caliber = "762_phaze"
	max_ammo = 60
/obj/item/ammo_box/a762_phaze/update_icon_state()
    . = ..()
    if(stored_ammo.len > 0)
        icon_state = "box_phaze-full"
    else
        icon_state = "box_phaze-empty"
//////////////////////
