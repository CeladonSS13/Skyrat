/datum/aas_config_entry/brig_cell_release_forced_announcement
	name = "Security Alert: Cell Timer Manual Release"
	announcement_lines_map = list(
		"Message" = "Таймер был отключен вручную %RELEASER для камеры: %CELL. Освобождение заключенного.",
	)
	vars_and_tooltips_map = list(
		"CELL" = "will be replaced with the cell name.",
		"RELEASER" = "will be replaced with the name of releaser.",
	)

/datum/aas_config_entry/brig_cell_restart
	name = "Security Alert: Cell Timer Restart"
	announcement_lines_map = list(
		"Message" = "Таймер был перезапущен %USER для заключенного: %OCCUPANT. Причина: %REASON.",
	)
	vars_and_tooltips_map = list(
		"OCCUPANT" = "will be replaced with the prisoner name.",
		"USER" = "will be replaced with door timer's user name.",
		"REASON" = "will be replaced with issued reason.",
	)

/datum/aas_config_entry/brig_cell_incarcerated
	name = "Security Alert: Incarcerated"
	announcement_lines_map = list(
		"Message" = "Заключенный %OCCUPANT (%PRISONERRANK) был приговорен на %TIME минут за нарушения: %CRIMES. Приговоривший - %ISSUERRANK %USER.",
	)
	vars_and_tooltips_map = list(
		"OCCUPANT" = "will be replaced with the prisoner name.",
		"PRISONERRANK" = "will be replaced with prisoner's rank in manifest - if exists, unknown otherwise.",
		"TIME" = "will be replaced with sentence time.",
		"CRIMES" = "will be replaced with issued crimes.",
		"ISSUERRANK" = "will be replaced with issuer card's rank.",
		"USER" = "will be replaced with issuer name.",
	)
