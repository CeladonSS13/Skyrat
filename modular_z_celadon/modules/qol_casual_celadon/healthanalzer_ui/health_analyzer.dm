#define HEALTH_ANALYZER_WINDOW_WIDTH 500
#define HEALTH_ANALYZER_WINDOW_HEIGHT 450

/obj/item/healthanalyzer
	var/last_scan_title = "Analyzing results"

/obj/item/healthanalyzer/proc/show_results(mob/user)
	if (!user)
		return
	var/datum/browser/popup = new(user, "scanner", last_scan_title, HEALTH_ANALYZER_WINDOW_WIDTH, HEALTH_ANALYZER_WINDOW_HEIGHT)
	popup.set_content("[get_header(user)]<hr>[last_scan_text]")
	popup.open()
	ui_interact(user)

/obj/item/healthanalyzer/proc/get_header(mob/user)
	var/srcref = REF(src)
	var/usrref = REF(user)
	return "<a href='byond://?src=[srcref];user=[usrref];clear=1'>Очистить</a><a href='byond://?src=[srcref];user=[usrref];print=1'>Печать отчёта</a><a href='byond://?src=[srcref];user=[usrref];switch_mode=1'>Сменить режим</a>"

/obj/item/healthanalyzer/examine(mob/user)
	. = ..()
	if(last_scan_text && last_scan_title)
		if(in_range(user, src) || istype(user, /mob/dead/observer))
			show_results(user)
		else
			. += span_notice("Нужно подойти ближе, чтобы прочесть содержмое.")

/obj/item/healthanalyzer/Topic(href, href_list)
	. = ..()
	var/user_ref = href_list["user"]
	if(!user_ref) // reference
		return FALSE
	var/mob/user = locate(user_ref) in GLOB.alive_mob_list
	if (!user) // actual variable
		return FALSE
	winset(user, "mapwindow", "focus=true")

	if(isdead(user)) // might be not necessary since GLOB.alive_mob_list, but let's keep it for safety
		return FALSE

	if(!in_range(user, src))
		to_chat(user, span_notice("Нужно подойти ближе, чтобы нажать на кнопку."))
		return FALSE

	if(href_list["print"])
		click_ctrl_shift(user)
		return TRUE

	if(href_list["switch_mode"])
		attack_self(user)
		return TRUE

	if(href_list["clear"])
		to_chat(user, "Вы очистили буфер данных [src].")
		last_scan_text = null
		last_scan_title = ""
		user << browse(null, "window=scanner")
		return TRUE

#undef HEALTH_ANALYZER_WINDOW_WIDTH
#undef HEALTH_ANALYZER_WINDOW_HEIGHT
