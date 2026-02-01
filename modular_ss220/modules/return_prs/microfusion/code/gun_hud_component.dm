/datum/element/ammo_hud/proc/update_microfusion(obj/item/gun/microfusion/to_update)
	SIGNAL_HANDLER

	var/atom/movable/screen/ammo_counter/hud = get_hud(parent_item = to_update)
	if(isnull(hud))
		return

	if(!to_update.phase_emitter)
		hud.icon_state = "microfusion_counter_no_emitter"
		hud.maptext = null
		return
	if(to_update.phase_emitter.damaged)
		hud.icon_state = "microfusion_counter_damaged"
		hud.maptext = null
		return
	if(!to_update.cell)
		hud.icon_state = "microfusion_counter_no_emitter"
		hud.maptext = null
		return

	var/obj/item/ammo_casing/energy/shot = to_update.microfusion_lens
	var/battery_percent = FLOOR(clamp(to_update.cell.charge / to_update.cell.maxcharge, 0, 1) * 100, 1)
	var/shot_cost_percent = FLOOR(clamp(shot.e_cost / to_update.cell.maxcharge, 0, 1) * 100, 1)
	var/phase_emitter_state = to_update.phase_emitter.get_heat_icon_state()
	if(!to_update.cell.charge)
		hud.icon_state = "microfusion_counter_[phase_emitter_state]"
		hud.maptext = span_maptext("<div align='center' valign='middle' style='position:relative'><font color='[COLOR_YELLOW]'>[battery_percent]%</font><br><font color='[COLOR_RED]'>[shot_cost_percent]%</font></div>")
		return

	hud.icon_state = "microfusion_counter_[phase_emitter_state]"
	hud.cut_overlays()
	hud.maptext_x = -12

	if(!to_update.can_shoot())
		hud.icon_state = "microfusion_counter_[phase_emitter_state]"
		hud.maptext = span_maptext("<div align='center' valign='middle' style='position:relative'><font color='[COLOR_YELLOW]'>[battery_percent]%</font><br><font color='[COLOR_RED]'>[shot_cost_percent]%</font></div>")
		return
	if(battery_percent <= 25)
		hud.maptext = span_maptext("<div align='center' valign='middle' style='position:relative'><font color='[COLOR_YELLOW]'>[battery_percent]%</font><br><font color='[COLOR_CYAN]'>[shot_cost_percent]%</font></div>")
		return
	hud.maptext = span_maptext("<div align='center' valign='middle' style='position:relative'><font color='[COLOR_VIBRANT_LIME]'>[battery_percent]%</font><br><font color='[COLOR_CYAN]'>[shot_cost_percent]%</font></div>")
