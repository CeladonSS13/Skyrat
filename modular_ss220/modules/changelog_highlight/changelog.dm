/datum/changelog/ui_static_data()
	. = ..()
	if (!.)
		return .
	var/list/data = .
	if (!data)
		return .
	if (!SSchangelog_highlight || !SSchangelog_highlight.changelog_items_ss1984)
		return .
	var/list/our_changelogs = list()
	for(var/json_entry in SSchangelog_highlight.changelog_items_ss1984)
		our_changelogs += list(json_entry) // no validation required, it's already done
	data["our_changelogs"] = our_changelogs
	var/html = icon2html('modular_nova/master_files/icons/donator/donator_chat_icon.dmi', world, "ratge")
	if (html)
		var/style_string = "style=\"width:100%;height:100%;display:block;\""
		html = replacetext(html, "<img", "<img " + style_string)
		data["our_icon_html"] = html
	return data
