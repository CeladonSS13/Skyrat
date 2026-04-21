/obj/item/ammo_box/a762_phaze
    name = "ammo box (7.62x39mm phaze)"
    desc = "A box with 7.62x39mm cartridges for phaze Shift T-9."
    icon = 'modular_celadon/modules/weapons_addon/code/weapon_PZH/icon/phz.dmi'
    icon_state = "box_phaze-full"
    ammo_type = /obj/item/ammo_casing/a762_phaze
    caliber = PHAZE762
    max_ammo = 60
/obj/item/ammo_box/a762_phaze/update_icon_state()
    . = ..()
    if(stored_ammo.len > 0)
        icon_state = "box_phaze-full"
