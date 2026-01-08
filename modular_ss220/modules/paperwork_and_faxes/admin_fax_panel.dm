/datum/fax_panel_interface
	var/preselected_fax_name
	// var/static/html_keep_watching = replacetext(icon2html('modular_ss220/modules/paperwork_and_faxes/images/keepwatching.jpeg', world, "keepwatching"),
	// 	"<img", "<img " + "width=380")

/datum/fax_panel_interface/ui_assets(mob/user)
	. = ..()
	var/list/data = .
	if (!data)
		return .

	data += get_asset_datum(/datum/asset/simple/fax_templates_images)
	return data

/datum/fax_panel_interface/ui_static_data(mob/user)
	. = ..()
	var/list/data = .
	if (!data)
		return .

	data["preselected_fax_name"] = preselected_fax_name

	// var/html = icon2html('modular_nova/master_files/icons/donator/donator_chat_icon.dmi', world, "ratge")
	// if (html)
	// 	var/style_string = "style=\"width:100%;height:100%;display:block;\""
	// 	html = replacetext(html, "<img", "<img " + style_string)
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

	var/static/list/fax_templates = list(
		list(
			"templateName" = "Blank",
			"fromWho" = "",
			"paperName" = "",
			"stamp" = "",
			"paperText" = "",
		),
		list(
			"templateName" = "(NT) Продолжайте наблюдение",
			"fromWho" = "Nanotrasen",
			"paperName" = "Nanotrasen Official Report",
			"stamp" = /obj/item/stamp/centcom::name,
			"paperText" = {"\
				<center><img src=resolveAsset("ntlogo.png") width="200" height="123"></center> \
				<font color="darkgreen"><center><h1>Уведомление</h1></center></font> <hr> <br> <div align="justify"> \
				<center><img src=resolveAsset("keepwatching.jpeg") width="280"></center> \
				</div> <br> <hr> <b>Место для штампа:</b> ◉ ◉ ◉ <hr> \
				<p><font color="grey" size=1><div align="justify">- Содержимое данного документа следует считать конфиденциальным. Если не указано иное, распространение содержащейся в данном документе информации среди третьих лиц и сторонних организаций строго запрещено.</div></font></p> \
				<p><font color="grey" size=1><div align="justify">- Невыполнение директив, содержащихся в данном документе, считается нарушением политики корпорации и может привести к наложению различных дисциплинарных взысканий.</div></font></p> \
				<p><font color="grey" size=1><div align="justify">- Данный документ считается действительным только при наличии печати офицера Центрального Командования.</div></font></p> \
				<hr> <font color="RoyalBlue"><center>Все права защищены.</center></font> \
				<font color="RoyalBlue"><center>(с) Корпорация NanoTrasen, 2029 — 2565 г.</center></font>\
			"},
		),
		list(
			"templateName" = "(Syndicate) Продолжайте наблюдение",
			"fromWho" = "Syndicate",
			"paperName" = "Syndicate Report",
			"stamp" = /obj/item/stamp/syndicate::name,
			"paperText" = "321",
		),
	)

	data["fax_templates"] = fax_templates

	return data
