
/datum/component/interactable
	/// A hard reference to the parent
	var/mob/living/carbon/human/self = null
	/// A list of interactions that the user can engage in.
	var/list/datum/interaction/interactions
	var/interact_last = 0
	var/interact_next = 0

/datum/component/interactable/Initialize(...)
	if(QDELETED(parent))
		qdel(src)
		return

	if(!ishuman(parent))
		return COMPONENT_INCOMPATIBLE

	self = parent

	build_interactions_list()

/datum/component/interactable/proc/build_interactions_list()
	interactions = list()
	for(var/iterating_interaction_id in GLOB.interaction_instances)
		var/datum/interaction/interaction = GLOB.interaction_instances[iterating_interaction_id]
		if(interaction.lewd)
			continue // SS1984 REMOVAL OF ERP INTERACTIONS
		interactions.Add(interaction)

/datum/component/interactable/RegisterWithParent()
	RegisterSignal(parent, COMSIG_CLICK_CTRL_SHIFT, PROC_REF(open_interaction_menu))

/datum/component/interactable/UnregisterFromParent()
	UnregisterSignal(parent, COMSIG_CLICK_CTRL_SHIFT)

/datum/component/interactable/Destroy(force)
	self = null
	interactions = null
	return ..()

/datum/component/interactable/proc/open_interaction_menu(datum/source, mob/user)
	SIGNAL_HANDLER

	if(!ishuman(user))
		return
	build_interactions_list()
	INVOKE_ASYNC(src, PROC_REF(ui_interact), user)
	return CLICK_ACTION_SUCCESS

/datum/component/interactable/proc/can_interact(datum/interaction/interaction, mob/living/carbon/human/target)
	if(!interaction.allow_act(target, self))
		return FALSE
	if(interaction.lewd) // SS1984 EDIT NO INTERACTIONS WITH ERP
		return FALSE
	if(!interaction.distance_allowed && !target.Adjacent(self))
		return FALSE
	if(interaction.category == INTERACTION_CAT_HIDE)
		return FALSE
	if(self == target && interaction.usage == INTERACTION_OTHER)
		return FALSE
	return TRUE

/// UI Control
/datum/component/interactable/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "InteractionMenu")
		ui.open()

/datum/component/interactable/ui_status(mob/user, datum/ui_state/state)
	if(!ishuman(user))
		return UI_CLOSE

	return UI_INTERACTIVE // This UI is always interactive as we handle distance flags via can_interact

/datum/component/interactable/ui_data(mob/user)
	var/list/data = list()
	var/list/descriptions = list()
	var/list/categories = list()
	var/list/display_categories = list()
	var/list/colors = list()
	for(var/datum/interaction/interaction in interactions)
		if(!can_interact(interaction, user))
			continue
		if(!categories[interaction.category])
			categories[interaction.category] = list(interaction.name)
		else
			categories[interaction.category] += interaction.name
			var/list/sorted_category = sort_list(categories[interaction.category])
			categories[interaction.category] = sorted_category
		descriptions[interaction.name] = interaction.description
		colors[interaction.name] = interaction.color
	data["descriptions"] = descriptions
	data["colors"] = colors
	for(var/category in categories)
		display_categories += category
	data["categories"] = sort_list(display_categories)
	data["ref_user"] = REF(user)
	data["ref_self"] = REF(self)
	data["self"] = self.name
	data["block_interact"] = interact_next >= world.time
	data["interactions"] = categories

	// SS1984 EDIT REMOVAL OF ERP PARTS

	return data

// SS1984 REMOVAL OF ERP STRIP

/datum/component/interactable/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	if(!ishuman(ui.user))
		return

	if(params["interaction"])
		var/interaction_id = params["interaction"]
		if(GLOB.interaction_instances[interaction_id])
			var/mob/living/carbon/human/user = locate(params["userref"])
			if(!can_interact(GLOB.interaction_instances[interaction_id], user))
				return FALSE
			GLOB.interaction_instances[interaction_id].act(user, locate(params["selfref"]))
			var/datum/component/interactable/interaction_component = user.GetComponent(/datum/component/interactable)
			interaction_component.interact_last = world.time
			interact_next = interaction_component.interact_last + INTERACTION_COOLDOWN
			interaction_component.interact_next = interact_next
			return TRUE

	if(params["item_slot"])
		// SS1984 REMOVAL OF ERP SLOTS
		return TRUE

	message_admins("Unhandled interaction '[params["interaction"]]'. Inform coders.")

// SS1984 REMOVAL OF ERP START, END
