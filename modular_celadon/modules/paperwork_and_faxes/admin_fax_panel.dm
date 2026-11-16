/datum/fax_panel_interface
	var/preselected_fax_name

/datum/fax_panel_interface/ui_static_data(mob/user)
	. = ..()
	var/list/data = .
	if (!data)
		return .

	data["preselected_fax_name"] = preselected_fax_name

	var/static/list/fax_templates = list(
		list(
			"templateName" = "Blank",
			"fromWho" = "",
			"paperName" = "",
			"stamp" = "",
			"paperText" = "",
			"stampX" = 0,
			"stampY" = 0,
		),
		list(
			"templateName" = "(NT) Продолжайте наблюдение",
			"fromWho" = "Nanotrasen",
			"paperName" = "Nanotrasen Official Report",
			"stamp" = /obj/item/stamp/centcom::name,
			"paperText" = {"\
				<center>\[ntlogo\]</center> \
				<font color="darkgreen"><center><h1>Уведомление</h1></center></font> <hr> <br> <div align="justify"> \
				<center>\[keepwatching\]</center> \
				</div> <br> <hr> <b>Место для штампа:</b> ◉ ◉ ◉ <hr> \
				<p><font color="grey" size=1><div align="justify">- Содержимое данного документа следует считать конфиденциальным. Если не указано иное, распространение содержащейся в данном документе информации среди третьих лиц и сторонних организаций строго запрещено.</div></font></p> \
				<p><font color="grey" size=1><div align="justify">- Невыполнение директив, содержащихся в данном документе, считается нарушением политики корпорации и может привести к наложению различных дисциплинарных взысканий.</div></font></p> \
				<p><font color="grey" size=1><div align="justify">- Данный документ считается действительным только при наличии печати офицера Центрального Командования.</div></font></p> \
				<hr> <font color="RoyalBlue"><center>Все права защищены.</center></font> \
				<font color="RoyalBlue"><center>(с) Корпорация NanoTrasen, 2029 — 2565 г.</center></font>\
			"},
			"stampX" = 140,
			"stampY" = 390,
		),
		list(
			"templateName" = "(Syndicate) Продолжайте наблюдение",
			"fromWho" = "Syndicate",
			"paperName" = "Syndicate Report",
			"stamp" = /obj/item/stamp/syndicate::name,
			"paperText" = {"\
				<center>\[syndicatelogo\]</center> \
				<font color="red"><center><h1>Уведомление</h1></center></font> <hr> <br> <div align="justify"> \
				<center>\[keepwatching\]</center> \
				</div> <br> <hr> <b>Место для штампа:</b> ◉ ◉ ◉ <hr> \
				<p><font color="grey" size=1><div align="justify">- Содержимое данного документа строго конфиденциально. Если не указано иное, распространение содержащейся в данном документе информации строго запрещено.</div></font></p> \
				<p><font color="grey" size=1><div align="justify">- Невыполнение директив, содержащихся в данном документе, может привести к незамедлительному расторжению контракта.</div></font></p> \
				<hr> <font color="darkred"><center>Смерть NanoTrasen!</center></font> \
				<font color="darkred"><center>(с) Syndicate.</center></font>\
			"},
			"stampX" = 140,
			"stampY" = 390,
		),
	)

	data["fax_templates"] = fax_templates

	return data
