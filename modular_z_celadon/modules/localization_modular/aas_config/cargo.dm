/datum/aas_config_entry/goodycase_destroyed
	announcement_lines_map = list(
		"Delivered" = "",
		"Locked" = "Ящик с вещами %OWNER уничтожен в %LOCATION.")

/datum/aas_config_entry/bitrunning_QS_ready_announcement
	announcement_lines_map = list(
		"Message" = "Отчет квантового сервера: тепловые системы в пределах рабочих параметров. Переходим к настройке домена."
	)

/datum/aas_config_entry/cargo_orders_announcement
	announcement_lines_map = list(
		"Single Order" = "Был запрошен новый заказ.",
		"Multiple Orders" = "%AMOUNT новых заказов было запрошено.",
	)

/datum/aas_config_entry/department_orders
	announcement_lines_map = list(
		"Order Placed" = "Заказ отдела был размещен %PERSON для %ORDER.",
		"Cooldown Reset" = "Срок действия заказа отдела истек! Теперь можно разместить новый заказ!",
	)

/datum/aas_config_entry/department_orders_cargo
	announcement_lines_map = list(
		"Message" = "Размещен новый заказ отдела %DEPARTMENT"
	)
