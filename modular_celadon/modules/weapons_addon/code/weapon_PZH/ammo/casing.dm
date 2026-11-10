#define CALIBER_762PHASE "7.62x39 Phase"

/obj/item/ammo_casing/a762_phaze
    name = "7.62x39mm phase round"
    desc = "A powerful rifle cartridge. Designed specifically for phase Shift T-9."
    icon = 'modular_celadon/modules/weapons_addon/icons/phase_shift.dmi'
    icon_state = "762_casing_phaze"
    caliber = CALIBER_762PHASE
    projectile_type = /obj/projectile/bullet/a762_phaze
    harmful = TRUE

/obj/item/ammo_casing/a762_phaze/a762_phaze_plasma
    name = "7.62x39mm plasma phase round"
    desc = "A powerful rifle cartridge containing plasma instead of a bullet. Designed specifically for Phase Shift T-9."
    icon_state = "762_casing_phaze_plasma"
    projectile_type = /obj/projectile/energy/a762_phaze/plasma

/obj/item/ammo_casing/a762_phaze/a762_phaze_energy
    name = "7.62x39mm energy phase round"
    desc = "A powerful rifle cartridge containing energy instead of a bullet. Designed specifically for Phase Shift T-9."
    icon_state = "762_casing_phaze_energy"
    projectile_type = /obj/projectile/energy/a762_phaze/energy
