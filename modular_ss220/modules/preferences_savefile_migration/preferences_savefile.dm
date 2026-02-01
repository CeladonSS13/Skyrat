/**
 * This is a cheap replica of the standard savefile version, only used for characters for now.
 * You can't really use the non-modular version, least you eventually want asinine merge
 * conflicts and/or potentially disastrous issues to arise, so here's your own.
 */
#define MODULAR_SAVEFILE_VERSION_MAX_1984 1

#define MODULAR_SAVEFILE_UP_TO_DATE_1984 -1

#define VERSION_TRANSLATE_RELIGION 1

/**
 * Checks if the modular side of the savefile is up to date.
 * If the return value is higher than 0, update_character_1984() will be called later.
 */
/datum/preferences/proc/savefile_needs_update_1984(list/save_data)
	var/savefile_version = save_data["modular_version_1984"]

	if(save_data.len && savefile_version < MODULAR_SAVEFILE_VERSION_MAX_1984)
		return savefile_version

	return MODULAR_SAVEFILE_UP_TO_DATE_1984


/// Loads the modular customizations of a character from the savefile
/datum/preferences/proc/load_character_1984(list/save_data)
	if(!save_data)
		save_data = list()

	var/needs_update = savefile_needs_update_1984(save_data)
	if(needs_update >= 0)
		update_character_1984(needs_update, save_data) // needs_update == savefile_version if we need an update (positive integer)

/// Brings a savefile up to date with modular preferences. Called if savefile_needs_update_1984() returned a value higher than 0
/datum/preferences/proc/update_character_1984(current_version, list/save_data)
	if(current_version < VERSION_TRANSLATE_RELIGION)
		update_religion_1984(save_data)


/datum/preferences/proc/update_religion_1984(list/save_data)
	var/static/alist/religion_translations = GLOB.religion_names?.len > 30 ? alist(
		"Apism" = GLOB.religion_names[1],
		"Buddhism" = GLOB.religion_names[2],
		"Chaos" = GLOB.religion_names[3],
		"Christianity" = GLOB.religion_names[4],
		"Clownism" = GLOB.religion_names[5],
		"Comedy" = GLOB.religion_names[6],
		"Cthulhu" = GLOB.religion_names[7],
		"Gorillism" = GLOB.religion_names[8],
		"Greytide" = GLOB.religion_names[9],
		"Hinduism" = GLOB.religion_names[10],
		"Honk" = GLOB.religion_names[11],
		"Honkism" = GLOB.religion_names[12],
		"Honkmother" = GLOB.religion_names[13],
		"Imperium" = GLOB.religion_names[14],
		"Islam" = GLOB.religion_names[15],
		"Judaism" = GLOB.religion_names[16],
		"Lampism" = GLOB.religion_names[17],
		"Monkeyism" = GLOB.religion_names[18],
		"Mormonism" = GLOB.religion_names[19],
		"Partying" = GLOB.religion_names[20],
		"Pastafarianism" = GLOB.religion_names[21],
		"Primatism" = GLOB.religion_names[22],
		"Rasta" = GLOB.religion_names[23],
		"Rastafarianism" = GLOB.religion_names[24],
		"Satanism" = GLOB.religion_names[25],
		"Science" = GLOB.religion_names[26],
		"Scientology" = GLOB.religion_names[27],
		"Servicianism" = GLOB.religion_names[28],
		"Sikhism" = GLOB.religion_names[29],
		"SubGenius" = GLOB.religion_names[30],
		"Toolboxia" = GLOB.religion_names[31],
	) : alist("ERROR" = "RELIGION NAMES GOT CHANGED AND HAVE FEWER NAMES! UPDATE /datum/preferences/proc/update_religion_1984(list/save_data)")

	// bible name

	var/old_bible_name = save_data[/datum/preference/name/bible::savefile_key]
	if (old_bible_name == "Default Bible Name")
		var/datum/preference/bible_name_pref = GLOB.preference_entries[/datum/preference/name/bible]
		write_preference(bible_name_pref, bible_name_pref.create_default_value())

	// deity name

	var/old_deity_name = save_data[/datum/preference/name/deity::savefile_key]
	if (old_deity_name == "Space Jesus")
		var/datum/preference/deity_name_pref = GLOB.preference_entries[/datum/preference/name/deity]
		write_preference(deity_name_pref, deity_name_pref.create_default_value())

	// religion name

	if (GLOB.religion_names?.len < 31)
		log_runtime("RELIGION NAMES GOT CHANGED AND HAVE FEWER NAMES! UPDATE /datum/preferences/proc/update_religion_1984(list/save_data), current length: [GLOB.religion_names?.len]")
		return

	var/old_religion_name = save_data[/datum/preference/name/religion::savefile_key]
	var/translated_name = religion_translations[old_religion_name]
	if (translated_name)
		var/datum/preference/religion_name_pref = GLOB.preference_entries[/datum/preference/name/religion]
		write_preference(religion_name_pref, translated_name)

/// Saves the modular customizations of a character on the savefile
/datum/preferences/proc/save_character_1984(list/save_data)
	save_data["modular_version_1984"] = MODULAR_SAVEFILE_VERSION_MAX_1984

#undef MODULAR_SAVEFILE_VERSION_MAX_1984
#undef MODULAR_SAVEFILE_UP_TO_DATE_1984

#undef VERSION_TRANSLATE_RELIGION
