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
	return "<a href='byond://?src=[srcref];user=[usrref];clear=1'>Очистить</a><a href='byond://?src=[srcref];user=[usrref];print=1'>Печать отчёта</a>"

/obj/item/healthanalyzer/Topic(href, href_list)
	. = ..()
	var/user_ref = href_list["user"]
	if(!user_ref) // reference
		return FALSE
	var/mob/user = locate(href_list["user"]) in GLOB.mob_list
	if (!user) // actual variable
		return FALSE
	winset(user, "mapwindow", "focus=true")

	if(!in_range(user, src))
		to_chat(user, span_notice("Нужно подойти ближе, чтобы нажать на кнопку."))
		return FALSE

	if(href_list["print"])
		click_ctrl_shift(usr)
		return TRUE

	if(href_list["clear"])
		to_chat(usr, "Вы очистили буфер данных [src].")
		last_scan_text = null
		last_scan_title = ""
		user << browse(null, "window=scanner")
		return TRUE

#undef HEALTH_ANALYZER_WINDOW_WIDTH
#undef HEALTH_ANALYZER_WINDOW_HEIGHT
