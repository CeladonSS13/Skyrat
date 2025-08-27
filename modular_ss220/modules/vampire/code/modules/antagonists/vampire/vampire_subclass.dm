/datum/vampire_subclass
	/// The subclass' name. Used for blackbox logging.
	var/name = "yell at coderbus"
	/// A list of powers that a vampire unlocks. The value of the list entry is equal to the blood total required for the vampire to unlock it.
	var/list/standard_powers
	/// A list of the powers a vampire unlocks when it reaches full power.
	var/list/fully_powered_abilities
	/// Whether or not a vampire heals more based on damage taken.
	var/improved_rejuv_healing = FALSE
	/// maximun number of thralls a vampire may have at a time. incremented as they grow stronger, up to a cap at full power.
	var/thrall_cap = 1
	/// If true, lets the vampire have access to their full power abilities without meeting the blood requirement, or needing a certain number of drained humans.
	var/full_power_override = FALSE
	/// Maximum number of dissections vampire can proceed from one target.
	var/dissect_cap = 1
	/// Maximum number of critical organs vampire can dissect.
	var/crit_organ_cap = 2
	/// Link to a spell with TGUI.
	var/datum/action/cooldown/spell/dissect_info/spell_TGUI
	/// Name addition for antag menu
	var/antag_menu_addition
	/// Associated list of all trophies bestia subclass got via round.
	var/list/trophies = list(
		INTERNAL_ORGAN_HEART = 0,
		INTERNAL_ORGAN_LUNGS = 0,
		INTERNAL_ORGAN_LIVER = 0,
		INTERNAL_ORGAN_KIDNEYS = 0,
		INTERNAL_ORGAN_EYES = 0,
		INTERNAL_ORGAN_EARS = 0,
	)


/datum/vampire_subclass/proc/on_blood_sucking(mob/living/carbon/human/H)
	return

/datum/vampire_subclass/proc/add_subclass_ability(datum/antagonist/vampire/vamp)
	for(var/thing in standard_powers)
		if(vamp.bloodtotal >= standard_powers[thing])
			vamp.add_ability(thing)


/datum/vampire_subclass/proc/add_full_power_abilities(datum/antagonist/vampire/vamp)
	for(var/thing in fully_powered_abilities)
		vamp.add_ability(thing)


/datum/vampire_subclass/umbrae
	name = "umbrae"
	antag_menu_addition = "умбра"
	standard_powers = list(/datum/action/cooldown/spell/cloak = 150,
							/datum/action/cooldown/spell/pointed/shadow_snare = 250,
							/datum/action/cooldown/spell/soul_anchor = 250,
							/datum/action/cooldown/spell/pointed/dark_passage = 400,
							/datum/action/cooldown/spell/shadow_blade = 600,
							/datum/action/cooldown/spell/pointed/shadow_boxing = 800)
	fully_powered_abilities = list(/datum/vampire_passive/full,
								/datum/action/cooldown/spell/eternal_darkness,
								/datum/vampire_passive/xray)

/datum/vampire_subclass/umbrae/on_blood_sucking(mob/living/carbon/human/H)
	var/list/lights = list()
	for(var/obj/machinery/light/L in SSmachines.get_machines_by_type_and_subtypes(/obj/machinery/light))
		if(L.status && L.z == H.z)
			lights += L

	var/obj/machinery/light/L = pick(lights)
	L.break_light_tube()

/datum/vampire_subclass/hemomancer
	name = "hemomancer"
	antag_menu_addition = "гемомансер"
	standard_powers = list(/datum/action/cooldown/spell/vamp_claws = 150,
							/datum/action/cooldown/spell/pointed/blood_tendrils = 250,
							/datum/action/cooldown/spell/pointed/blood_barrier = 250,
							/datum/action/cooldown/spell/jaunt/ethereal_jaunt/blood_pool = 400,
							/datum/action/cooldown/spell/list_target/predator_senses = 600,
							/datum/action/cooldown/spell/aoe/blood_eruption = 800)
	fully_powered_abilities = list(/datum/vampire_passive/full,
								/datum/action/cooldown/spell/blood_spill)

/datum/vampire_subclass/hemomancer/on_blood_sucking(mob/living/carbon/human/H)
	H.blood_volume = min(H.blood_volume + 5, BLOOD_VOLUME_NORMAL)

/datum/vampire_subclass/gargantua
	name = "gargantua"
	antag_menu_addition = "гаргантюа"
	standard_powers = list(/datum/action/cooldown/spell/blood_swell = 150,
							/datum/action/cooldown/spell/blood_rush = 250,
							/datum/action/cooldown/spell/aoe/stomp = 250,
							/datum/vampire_passive/blood_swell_upgrade = 400,
							/datum/action/cooldown/spell/overwhelming_force = 600,
							/datum/action/cooldown/spell/pointed/projectile/fireball/demonic_grasp = 800)
	fully_powered_abilities = list(/datum/vampire_passive/full,
								/datum/action/cooldown/mob_cooldown/charge/gargantua_charge)
	improved_rejuv_healing = TRUE

/datum/vampire_subclass/gargantua/on_blood_sucking(mob/living/carbon/human/H)
	H.adjustBruteLoss(-2)
	H.adjustFireLoss(-2)

/datum/vampire_subclass/dantalion
	name = "dantalion"
	antag_menu_addition = "данталион"
	standard_powers = list(/datum/action/cooldown/spell/pointed/enthrall = 150,
							/datum/action/cooldown/spell/thrall_commune = 150,
							/datum/action/cooldown/spell/pointed/pacify = 250,
							/datum/action/cooldown/spell/pointed/switch_places = 250,
							/datum/action/cooldown/spell/decoy = 400,
							/datum/vampire_passive/increment_thrall_cap = 400,
							/datum/action/cooldown/spell/aoe/rally_thralls = 600,
							/datum/vampire_passive/increment_thrall_cap/two = 600,
							/datum/action/cooldown/spell/share_damage = 800)
	fully_powered_abilities = list(/datum/vampire_passive/full,
								/datum/action/cooldown/spell/aoe/hysteria,
								/datum/vampire_passive/increment_thrall_cap/three)

/datum/vampire_subclass/dantalion/on_blood_sucking(mob/living/carbon/human/H)
	var/datum/antagonist/vampire/V = H.mind.has_antag_datum(/datum/antagonist/vampire)
	for(var/datum/antagonist/thrall/thrall in V.thralls)
		thrall.owner.current?.adjustBruteLoss(-3)
		thrall.owner.current?.adjustFireLoss(-3)
		thrall.owner.current?.adjustOxyLoss(-5)

/datum/vampire_subclass/bestia
	name = "bestia"
	antag_menu_addition = "бестия"
	standard_powers = list(/datum/action/cooldown/spell/dissect_info = 150,
							/datum/action/cooldown/spell/dissect = 150,
							/datum/action/cooldown/spell/infected_trophy = 150,
							/datum/action/cooldown/spell/lunge = 250,
							/datum/action/cooldown/spell/pointed/mark = 250,
							/datum/action/cooldown/spell/metamorphosis/bats = 400,
							/datum/action/cooldown/spell/anabiosis = 600,
							/datum/vampire_passive/dissection_cap = 600,
							/datum/action/cooldown/spell/bats_spawn = 800,
							/datum/vampire_passive/upgraded_grab = 800)
	fully_powered_abilities = list(/datum/vampire_passive/full,
								/datum/action/cooldown/spell/metamorphosis/hound,
								/datum/vampire_passive/dissection_cap/two)
	improved_rejuv_healing = TRUE

/datum/vampire_subclass/bestia/on_blood_sucking(mob/living/carbon/human/H)
	H.adjustBruteLoss(-2)
	H.adjustFireLoss(-2)

/datum/vampire_subclass/ancient
	name = "ancient"
	standard_powers = list(/datum/action/cooldown/spell/dissect_info,
							/datum/action/cooldown/spell/dissect,
							/datum/action/cooldown/spell/infected_trophy,
							/datum/action/cooldown/spell/vamp_claws,
							/datum/action/cooldown/spell/blood_swell,
							/datum/action/cooldown/spell/cloak,
							/datum/action/cooldown/spell/pointed/enthrall,
							/datum/action/cooldown/spell/thrall_commune,
							/datum/action/cooldown/spell/lunge,
							/datum/action/cooldown/spell/pointed/mark,
							/datum/action/cooldown/spell/pointed/blood_tendrils,
							// /obj/effect/proc_holder/spell/vampire/blood_barrier,
							/datum/action/cooldown/spell/blood_rush,
							/datum/action/cooldown/spell/aoe/stomp,
							/datum/action/cooldown/spell/pointed/shadow_snare,
							/datum/action/cooldown/spell/soul_anchor,
							/datum/action/cooldown/spell/pointed/pacify,
							/datum/action/cooldown/spell/pointed/switch_places,
							/datum/action/cooldown/spell/jaunt/ethereal_jaunt/blood_pool,
							/datum/action/cooldown/spell/metamorphosis/bats,
							/datum/vampire_passive/blood_swell_upgrade,
							/datum/action/cooldown/spell/pointed/dark_passage,
							/datum/action/cooldown/spell/decoy,
							/datum/action/cooldown/spell/aoe/blood_eruption,
							/datum/action/cooldown/spell/anabiosis,
							/datum/action/cooldown/spell/list_target/predator_senses,
							/datum/action/cooldown/spell/overwhelming_force,
							/datum/action/cooldown/spell/shadow_blade,
							/datum/action/cooldown/spell/aoe/rally_thralls,
							/datum/action/cooldown/spell/share_damage,
							/datum/action/cooldown/spell/pointed/projectile/fireball/demonic_grasp,
							/datum/action/cooldown/spell/pointed/shadow_boxing,
							/datum/action/cooldown/spell/bats_spawn,
							/datum/vampire_passive/upgraded_grab,
							/datum/vampire_passive/full,
							/datum/action/cooldown/spell/metamorphosis/hound,
							/datum/action/cooldown/spell/blood_spill,
							/datum/action/cooldown/mob_cooldown/charge/gargantua_charge,
							/datum/action/cooldown/spell/eternal_darkness,
							/datum/action/cooldown/spell/aoe/hysteria,
							/datum/action/cooldown/spell/aoe/raise_vampires,
							/datum/vampire_passive/xray)
	improved_rejuv_healing = TRUE
	thrall_cap = 150 // can thrall high pop
	dissect_cap = 6
	crit_organ_cap = 6

