#define COOLDOWN_NO_DISPLAY_TIME (180 SECONDS)

/datum/action/cooldown
	// Charge system variables
	/// The max number of charges this action can have
	var/max_charges = 1
	/// Current number of charges available
	var/current_charges = 1
	/// Time when next charge will be replenished
	var/next_charge_time = 0
	/// Time between charge replenishments
	var/charge_replenish_time = 0
	/// Whether the action starts with full charges
	var/starts_with_full_charges = TRUE

/datum/action/cooldown/New(Target, original = TRUE)
	. = ..()
	if(active_background_icon_state)
		base_background_icon_state ||= background_icon_state
	if(active_overlay_icon_state)
		base_overlay_icon_state ||= overlay_icon_state
	if(active_icon_state)
		base_icon_state ||= button_icon_state

	if(isnull(melee_cooldown_time))
		melee_cooldown_time = cooldown_time

	if(starts_with_full_charges)
		current_charges = max_charges

	if(original)
		create_sequence_actions()

/datum/action/cooldown/update_button_status(atom/movable/screen/movable/action_button/button, force = FALSE)
	. = ..()

	// Handle charge display
	if(max_charges > 1)
		var/charge_text = "[current_charges]/[max_charges]"
		if(next_charge_time > world.time)
			charge_text += " ([round((next_charge_time - world.time)/10, 0.1)]s)"
		button.maptext = MAPTEXT_TINY_UNICODE(charge_text)
	else
		// Original cooldown display for single-charge abilities
		var/time_left = max(next_use_time - world.time, 0)
		if(!text_cooldown || !owner || time_left == 0 || time_left >= COOLDOWN_NO_DISPLAY_TIME)
			button.maptext = ""
		else
			if (cooldown_rounding > 0)
				button.maptext = MAPTEXT_TINY_UNICODE("[round(time_left/10, cooldown_rounding)]")
			else
				button.maptext = MAPTEXT_TINY_UNICODE("[round(time_left/10)]")

	if(!IsAvailable() || !is_action_active(button))
		return
	// If we don't change the icon state, or don't apply a special overlay,
	if(active_background_icon_state || active_icon_state || active_overlay_icon_state)
		return
	// ...we need to show it's active somehow. So, make it greeeen
	button.color = COLOR_GREEN

/datum/action/cooldown/IsAvailable(feedback = FALSE)
	if(max_charges > 1 && current_charges <= 0)
		if(feedback)
			owner.balloon_alert(owner, "no charges left!")
		return FALSE
	return ..()

/datum/action/cooldown/StartCooldown(override_cooldown_time, override_melee_cooldown_time)
	// Handle charge system
	if(max_charges > 1)
		current_charges--
		if(current_charges < max_charges)
			next_charge_time = world.time + charge_replenish_time
			START_PROCESSING(SSfastprocess, src)
	else
		// Original cooldown behavior for single-charge abilities
		if(shared_cooldown != NONE)
			StartCooldownOthers(override_cooldown_time)
		StartCooldownSelf(override_cooldown_time)

	if(isnum(override_melee_cooldown_time))
		next_melee_use_time = world.time + override_melee_cooldown_time
	else
		next_melee_use_time = world.time + melee_cooldown_time

/datum/action/cooldown/process()
	if(max_charges > 1)
		// Charge replenishment logic
		if(current_charges < max_charges && next_charge_time <= world.time)
			current_charges++
			build_all_button_icons(UPDATE_BUTTON_STATUS)
			if(current_charges < max_charges)
				next_charge_time = world.time + charge_replenish_time
			else
				STOP_PROCESSING(SSfastprocess, src)
	else
		// Original cooldown processing
		if(!owner || (next_use_time - world.time) <= 0)
			build_all_button_icons(UPDATE_BUTTON_STATUS)
			STOP_PROCESSING(SSfastprocess, src)
			return

		build_all_button_icons(UPDATE_BUTTON_STATUS)

/datum/action/cooldown/ResetCooldown()
	if(max_charges > 1)
		current_charges = max_charges
		next_charge_time = 0
	else
		next_use_time = world.time
	build_all_button_icons(UPDATE_BUTTON_STATUS)

#undef COOLDOWN_NO_DISPLAY_TIME
