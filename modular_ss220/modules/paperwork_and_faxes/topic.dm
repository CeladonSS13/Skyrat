/datum/admins/proc/reply_fax_topic(reply_fax_href, mob/user)
	if(!user || !check_rights(R_ADMIN))
		return

	var/obj/machinery/fax/fax_target = locate(reply_fax_href)

	if (!fax_target)
		return

	var/datum/fax_panel_interface/fax_ui = new /datum/fax_panel_interface(user)

	if (!fax_ui)
		return

	fax_ui.preselected_fax_name = fax_target.fax_name
	fax_ui.ui_interact(user)

	// var/template_input = input(user, "Select template", "Fax reply") in list("BLANK", "(Nanotrasen) Продолжайте наблюдение")
	// var/fax_text_default = ""

	// var/static/keepwatching_rsc = 'modular_ss220\modules\paperwork_and_faxes\images\keepwatching.jpeg'
	// if(template_input == "(Nanotrasen) Продолжайте наблюдение")
	// 	if (keepwatching_rsc)
	// 		src << browse_rsc(keepwatching_rsc, "keepwatching.jpeg")
	// 	fax_text_default = {"<center><img src="https://skyrat.ss220.space/images/thumb/e/ee/NTlogo.png/400px-NTlogo.png" width="200" height="123"></center>
	// 	<font color="darkgreen"><center><h1>Уведомление</h1></center></font> <hr> <br> <div align="justify"><center>
	// 	<img src="keepwatching.jpeg" width="380"></center>
	// 	</div> <br> <hr> <b>Место для штампа:</b> ◉ ◉ ◉ <hr>
	// 	<p><font color="grey" size=1><div align="justify">- Содержимое данного документа следует считать конфиденциальным. Если не указано иное, распространение содержащейся в данном документе информации среди третьих лиц и сторонних организаций строго запрещено.</div></font></p>
	// 	<p><font color="grey" size=1><div align="justify">- Невыполнение директив, содержащихся в данном документе, считается нарушением политики корпорации и может привести к наложению различных дисциплинарных взысканий.</div></font></p>
	// 	<p><font color="grey" size=1><div align="justify">- Данный документ считается действительным только при наличии печати офицера Центрального Командования.</div></font></p>
	// 	<hr> <font color="RoyalBlue"><center>Все права защищены.</center></font>
	// 	<font color="RoyalBlue"><center>(с) Корпорация NanoTrasen, 2029 — 2565 г.</center></font>"}
	// else if(template_input == "(Syndicate) Продолжайте наблюдение")
	// 	fax_text_default = {""}

	// var/fax_text = input(user, "Enter your reply here", "Fax reply", fax_text_default) as text|null
