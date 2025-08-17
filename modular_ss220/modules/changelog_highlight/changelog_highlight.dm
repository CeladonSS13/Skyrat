#define CHANGELOG_HIGHLIGHT_GENERATED_FILE_PATH "tools/ss1984_changelog_highlight_generated.json" // don't forget to update in in .py script

// The reason why this is subsystem, because we don't want for clients to execute it
// Instead, we do it one time at server-side and send data to clients, also in non-blocking way becaues of I/O

SUBSYSTEM_DEF(changelog_highlight)
	name = "Changelog Highlight SS1984"
	flags = SS_NO_FIRE
	runlevels = (RUNLEVEL_LOBBY | RUNLEVEL_SETUP | RUNLEVEL_GAME | RUNLEVEL_POSTGAME)
	init_stage = INITSTAGE_FIRST
	var/static/list/changelog_items_ss1984 = list()

/datum/controller/subsystem/changelog_highlight/Initialize()
	if (!fexists(CHANGELOG_HIGHLIGHT_GENERATED_FILE_PATH))
		return SS_INIT_NO_NEED
	var/list/json_data = json_load(CHANGELOG_HIGHLIGHT_GENERATED_FILE_PATH)
	if (!json_data || (length(json_data) < 1))
		return SS_INIT_FAILURE
	for(var/json_entry in json_data)
		var/date = json_entry["date"]
		if (!date || length(date) < 1) // date format is YYYY-MM-DD
			continue
		var/author = json_entry["author"]
		if (!author || length(author) < 1)
			continue
		var/list/changes = json_entry["changes"]
		if (!changes || length(changes) < 1 || !islist(changes))
			continue

		var/list/json_entry_list = list() // allocating new one to discard non-valid values in case they exist

		json_entry_list["date"] = date
		json_entry_list["author"] = author
		json_entry_list["changes"] = changes

		changelog_items_ss1984 += list(json_entry_list) // wrap inside other list, otherwise it adds all content as separate entries

	return SS_INIT_NO_MESSAGE

/datum/controller/subsystem/changelog_highlight/can_vv_get(var_name)
	. = ..()
	if (!.)
		return .
	// not sure about VV list content here, as we highly rely on that fact that changelog_items_ss1984 is valid
	// So this is why we do that
	if (var_name == "changelog_items_ss1984")
		. = FALSE
	return .

/datum/controller/subsystem/changelog_highlight/vv_edit_var(var_name, var_value)
	. = ..()
	if (!.)
		return .
	if (var_name == "changelog_items_ss1984")
		. = FALSE
	return .
