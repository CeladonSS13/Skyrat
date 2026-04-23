#define PHAZE762 "762-caliber"
/obj/item/ammo_casing/a762_phaze
    name = "7.62x39mm phaze round"
    desc = "A powerful rifle cartridge. Designed specifically for phaze Shift T-9."
    icon = 'modular_celadon/modules/weapons_addon/icons/phz.dmi'
    icon_state = "762_casing_phaze"
    caliber = PHAZE762
    projectile_type = /obj/projectile/bullet/a762_phaze
    harmful = TRUE
/obj/item/ammo_casing/a762_phaze/a762_phaze_plasma
    name = "7.62x39mm plasma phaze round"
    desc = "A powerful rifle cartridge containing plasma instead of a bullet. Designed specifically for Phaze Shift T-9."
    icon_state = "762_casing_phaze_plasma"
    projectile_type = /obj/projectile/energy/a762_phaze_plasma
/obj/item/ammo_casing/a762_phaze/a762_phaze_energy
    name = "7.62x39mm energy phaze round"
    desc = "A powerful rifle cartridge containing energy instead of a bullet. Designed specifically for Phaze Shift T-9."
    icon_state = "762_casing_phaze_energy"
    projectile_type = /obj/projectile/energy/a762_phaze_energy
