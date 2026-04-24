// ============================================================
// Phaze SHIFT T-9
// ============================================================
/obj/item/gun/ballistic/automatic/automatically_weapon
    name = "Phaze Shift T-9"
    desc = "A high-precision automatic rifle equipped with an active heat dissipation system. When a critical temperature is reached in the receiver, the internal mechanism pushes the rod into the groove outside the weapon."
    icon = 'modular_celadon/modules/weapons_addon/icons/phz.dmi'
    icon_state = "automatically"
    base_icon_state = "automatically"
    inhand_icon_state = "automatically"
    w_class = WEIGHT_CLASS_BULKY
    accepted_magazine_type = /obj/item/ammo_box/magazine/m762_phaze
    can_suppress = TRUE
    burst_size = 1
    fire_delay = 0
    actions_types = list()
    bolt_type = BOLT_TYPE_LOCKING
    projectile_damage_multiplier = 1.2
    mag_display = TRUE
    mag_display_ammo = TRUE
    empty_indicator = TRUE
    fire_sound = 'modular_celadon/modules/weapons_addon/code/weapon_PZH/sound/bad-explosion.ogg'
    fire_sound_volume = 100
    // System heat
    var/current_heat = 0
    var/max_heat = 100
    var/heat_per_shot = 5
    var/cool_down_per_second = 2
    var/overheated = FALSE
    var/rod_extended = FALSE
    var/cooling_timer = null
    var/image/current_rod_overlay
    var/image/current_mag_overlay
/obj/item/gun/ballistic/automatic/automatically_weapon/Initialize(mapload)
    . = ..()
    AddComponent(/datum/component/automatic_fire, 0.3 SECONDS)
    start_cooling_loop()
    update_overlays()
/obj/item/gun/ballistic/automatic/automatically_weapon/Destroy()
    if(cooling_timer)
        deltimer(cooling_timer)
    return ..()
/obj/item/gun/ballistic/automatic/automatically_weapon/proc/start_cooling_loop()
    if(cooling_timer)
        deltimer(cooling_timer)
    cooling_timer = addtimer(CALLBACK(src, PROC_REF(cooling_loop)), 1 SECONDS, TIMER_LOOP|TIMER_STOPPABLE)
/obj/item/gun/ballistic/automatic/automatically_weapon/proc/cooling_loop()
    if(current_heat <= 0)
        return
    current_heat = max(0, current_heat - cool_down_per_second)
    update_heat_state()
/obj/item/gun/ballistic/automatic/automatically_weapon/proc/update_heat_state()
    if(overheated)
        return
    if(current_heat >= max_heat)
        overheat()
        return
    var/new_rod_extended = (current_heat >= max_heat * 0.7)
    if(rod_extended != new_rod_extended)
        rod_extended = new_rod_extended
        update_icon()
/obj/item/gun/ballistic/automatic/automatically_weapon/update_icon()
    . = ..()
    if(current_rod_overlay)
        cut_overlay(current_rod_overlay)
        current_rod_overlay = null
    if(overheated)
        current_rod_overlay = image(icon, "automatically_rod")
        current_rod_overlay.layer = FLOAT_LAYER
        add_overlay(current_rod_overlay)
    else if(rod_extended)
        current_rod_overlay = image(icon, "automatically_rod_warning")
        current_rod_overlay.layer = FLOAT_LAYER
        add_overlay(current_rod_overlay)
/obj/item/gun/ballistic/automatic/automatically_weapon/can_shoot()
    . = ..()
    if(overheated)
        return FALSE
    return .
/obj/item/gun/ballistic/automatic/automatically_weapon/shoot_live_shot(mob/living/user, pointblank, atom/target, params, distro, pointblank_zone)
    if(overheated)
        to_chat(user, span_warning("[src] is overheated! Wait for it to cool down."))
        return FALSE
    . = ..()
    if(.)
        current_heat += heat_per_shot
        update_heat_state()
        if(current_heat >= max_heat)
            to_chat(user, span_userdanger("[src] overheats! The cooling rod extends. Wait for cooldown!"))
            addtimer(CALLBACK(src, PROC_REF(reset_overheat)), 5 SECONDS)
    update_overlays()
    update_icon()
/obj/item/gun/ballistic/automatic/automatically_weapon/proc/overheat()
    overheated = TRUE
    rod_extended = FALSE
    update_icon()
/obj/item/gun/ballistic/automatic/automatically_weapon/proc/reset_overheat()
    overheated = FALSE
    current_heat = 0
    rod_extended = FALSE
    update_icon()
    if(ismob(loc))
        to_chat(loc, span_notice("[src] has cooled down and is ready to fire again."))
/obj/item/gun/ballistic/automatic/automatically_weapon/examine(mob/user)
    . = ..()
    var/heat_percent = (current_heat / max_heat) * 100
    if(heat_percent > 0)
        . += span_info("The barrel is [round(heat_percent)]% of its maximum temperature.")
    if(overheated)
        . += span_warning("The cooling rod is fully extended! The weapon is too hot to fire.")
    else if(rod_extended)
        . += span_info("The cooling rod is extended. The weapon is hot but still operational.")

//obj/item/gun/ballistic/automatic/automatically_weapon/update_overlays() // Etot kysok nysjno bydat sdelat small
//    if(current_mag_overlay)
//        cut_overlay(current_mag_overlay)
//        current_mag_overlay = null
//    if(magazine)
//        var/ammo = magazine.ammo_count(TRUE)
//        var/mag_icon_state = "automatically_mag"
//        if(ammo > 25)
//            mag_icon_state = "automatically_mag-30"
//        else if(ammo > 20)
//            mag_icon_state = "automatically_mag-25"
//        else if(ammo > 15)
//            mag_icon_state = "automatically_mag-20"
//        else if(ammo > 10)
//            mag_icon_state = "automatically_mag-15"
//        else if(ammo > 5)
//           mag_icon_state = "automatically_mag-10"
//       else if(ammo > 0)
//            mag_icon_state = "automatically_mag-5"
//        else
//            mag_icon_state = "automatically_mag-0"
//        current_mag_overlay = image(icon, mag_icon_state)
//        current_mag_overlay.layer = FLOAT_LAYER
//        add_overlay(current_mag_overlay)
//Update magazine icons
/obj/item/gun/ballistic/automatic/automatically_weapon/update_overlays()
    if(current_mag_overlay)
        cut_overlay(current_mag_overlay)
        current_mag_overlay = null
    if(magazine)
        var/ammo = magazine.ammo_count(TRUE)
        var/mag_icon_state = "automatically_mag"

        if(ammo > 0)
            mag_icon_state = "automatically_mag-[round(ammo, 5)]"
        else
            mag_icon_state = "automatically_mag-0"

        current_mag_overlay = image(icon, mag_icon_state)
        current_mag_overlay.layer = FLOAT_LAYER
        add_overlay(current_mag_overlay)
