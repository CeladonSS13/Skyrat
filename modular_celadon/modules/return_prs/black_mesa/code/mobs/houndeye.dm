/mob/living/basic/blackmesa/xen/houndeye
	name = "houndeye"
	desc = "Some highly aggressive alien creature. Thrives in toxic environments."
	icon = 'modular_celadon/modules/return_prs/black_mesa/icons/mobs.dmi'
	icon_state = "houndeye"
	icon_living = "houndeye"
	icon_dead = "houndeye_dead"
	icon_gib = null
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES
	speak_emote = list("growls", "snarls", "grumbles")
	speed = 1
	maxHealth = 100
	health = 100
	obj_damage = 50
	melee_damage_lower = 20
	melee_damage_upper = 20
	attack_sound = 'sound/items/weapons/bite.ogg'
	gold_core_spawnable = HOSTILE_SPAWN
	loot = list(/obj/item/stack/sheet/bluespace_crystal)
	alert_sounds = list(
		'modular_celadon/modules/return_prs/black_mesa/sound/mobs/houndeye/he_alert1.ogg',
		'modular_celadon/modules/return_prs/black_mesa/sound/mobs/houndeye/he_alert2.ogg',
		'modular_celadon/modules/return_prs/black_mesa/sound/mobs/houndeye/he_alert3.ogg',
		'modular_celadon/modules/return_prs/black_mesa/sound/mobs/houndeye/he_alert4.ogg',
		'modular_celadon/modules/return_prs/black_mesa/sound/mobs/houndeye/he_alert5.ogg'
	)
	var/list/charge_sounds = list(
		'modular_celadon/modules/return_prs/black_mesa/sound/mobs/houndeye/charge1.ogg',
		'modular_celadon/modules/return_prs/black_mesa/sound/mobs/houndeye/charge2.ogg',
		'modular_celadon/modules/return_prs/black_mesa/sound/mobs/houndeye/charge3.ogg'
	)
	/// Charging ability
	var/datum/action/cooldown/mob_cooldown/charge/basic_charge/charge
	var/charge_cooldown = 6 SECONDS
	var/charge_cooldown_time

/mob/living/basic/blackmesa/xen/houndeye/Initialize(mapload)
	. = ..()
	charge = new /datum/action/cooldown/mob_cooldown/charge/basic_charge()
	charge.Grant(src)

/mob/living/basic/blackmesa/xen/houndeye/Destroy()
	QDEL_NULL(charge)
	return ..()

/mob/living/basic/blackmesa/xen/houndeye/bullet_act(obj/projectile/proj)
	. = ..()
	if(!(client) && !(QDELETED(proj)))
		if(!isdead(src) && !(world.time <= charge_cooldown_time))
			if(charge_sounds)
				playsound(src, pick(charge_sounds), 70)
			charge_cooldown_time = world.time + charge_cooldown
			charge.Trigger(proj.firer)
			charge.do_charge(charge.owner, proj.firer, charge.charge_delay, charge.charge_past)
