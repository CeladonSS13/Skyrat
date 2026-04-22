/obj/projectile/bullet/a762_phaze
    name = "7.62x39mm bullet"
    damage = 30
    armour_penetration = 25
    icon_state = "bullet"
    wound_bonus = 30
    damage_type = BRUTE
    armor_flag = BULLET
    hitsound_wall = SFX_RICOCHET
    sharpness = SHARP_POINTY

/obj/projectile/energy/a762_phaze/plasma
    name = "7.62x39mm plasma"
    damage = 25
    armour_penetration = 70
    icon = 'modular_celadon/modules/weapons_addon/icons/phz.dmi'
    icon_state = "plasma_jet"
    damage_type = BURN
    armor_flag = BULLET
    wound_bonus = 30
    impact_effect_type = /obj/effect/temp_visual/impact_effect/energy

/obj/projectile/energy/a762_phaze/energy
    name = "7.62x39mm energy"
    damage = 15
    armour_penetration = 10
    wound_bonus= 15
    icon = 'modular_celadon/modules/weapons_addon/icons/phz.dmi'
    icon_state = "energy"
    damage_type = BURN
    armor_flag = ENERGY
    impact_effect_type = /obj/effect/temp_visual/impact_effect/energy
