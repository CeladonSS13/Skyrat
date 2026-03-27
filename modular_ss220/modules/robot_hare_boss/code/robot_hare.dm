/mob/living/simple_animal/hostile/megafauna/robothare
	name = "robot hare"
	desc = "An aggressive robot."
	health = 1500
	maxHealth = 1500
	attack_verb_continuous = "drills"
	attack_verb_simple = "drills"
	attack_sound = 'sound/items/weapons/bladeslice.ogg'
	icon_state = "robothare_folded"
	icon_living = "robothare"
	health_doll_icon = "robothare"
	friendly_verb_continuous = "stares down"
	friendly_verb_simple = "stare down"
	icon = 'modular_ss220/modules/robot_hare_boss/icons/robot_hare.dmi'
	faction = list(FACTION_BOSS) //asteroid mobs? get that shit out of my beautiful square house
	speak_emote = list("beeps")
	armour_penetration = 50
	melee_damage_lower = 15
	melee_damage_upper = 15
	mob_biotypes = MOB_ROBOTIC|MOB_SPECIAL
	speed = 10
	move_to_delay = 0
	ranged = TRUE
	ranged_cooldown_time = 4 SECONDS
	aggro_vision_range = 21 //so it can see to one side of the arena to the other
	loot = list(/obj/item/hierophant_club)
	//crusher_loot = /obj/item/crusher_trophy/vortex_talisman
	wander = FALSE
	gps_name = "Carrot Signal"
	//achievement_type = /datum/award/achievement/boss/hierophant_kill
	//crusher_achievement_type = /datum/award/achievement/boss/hierophant_crusher
	SET_BASE_PIXEL(-32, -16)
	//score_achievement_type = /datum/award/score/hierophant_score
	del_on_death = FALSE
	death_sound = 'sound/effects/magic/repulse.ogg'
	// attack_action_types = list(/datum/action/innate/megafauna_attack/blink,
	// 						   /datum/action/innate/megafauna_attack/chaser_swarm,
	// 						   /datum/action/innate/megafauna_attack/cross_blasts,
	// 						   /datum/action/innate/megafauna_attack/blink_spam)

	/// folded state, do not auto-agressive
	var/folded = TRUE


	// icon = 'modular_ss220/modules/robot_hare_boss/icons/robot_hare.dmi'
	// icon_state = "robothare_folded"
	// icon_living = "robothare"
	// icon_dead = "hare_dead"
	// mob_biotypes = MOB_ROBOTIC|MOB_SPECIAL
	// mouse_opacity = MOUSE_OPACITY_ICON
	// friendly_verb_continuous = "stares down"
	// friendly_verb_simple = "stares down"
	// speak_emote = list("buzz")
	// speed = 3
	// move_to_delay = 8
	// maxHealth = 300
	// health = 300
	// obj_damage = 40
	// melee_damage_lower = 25
	// melee_damage_upper = 25
	// attack_verb_continuous = "drills"
	// attack_verb_simple = "drills"
	// attack_sound = 'sound/items/weapons/bladeslice.ogg'
	// attack_vis_effect = ATTACK_EFFECT_MECHFIRE
	// vision_range = 2 // don't aggro unless you basically antagonize it, though they will kill you worse than a goliath will
	// aggro_vision_range = 9
	// move_force = MOVE_FORCE_VERY_STRONG
	// move_resist = MOVE_FORCE_VERY_STRONG
	// pull_force = MOVE_FORCE_VERY_STRONG
	// butcher_results = list(/obj/item/food/meat/slab/bear = 3, /obj/item/stack/sheet/bone = 2)
	// guaranteed_butcher_results = list(/obj/item/stack/sheet/animalhide/goliath_hide/polar_bear_hide = 1)
	// loot = list()
	// stat_attack = HARD_CRIT
	// robust_searching = TRUE
	// footstep_type = FOOTSTEP_OBJ_MACHINE



// /mob/living/simple_animal/hostile/megafauna/robothare/Destroy()
// 	QDEL_NULL(spawned_beacon_ref)
// 	return ..()
