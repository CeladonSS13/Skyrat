//edit the things so they are free to get but will need a job
/datum/loadout_item/pocket_items/toaster_implant
	restricted_roles = list(JOB_CLOWN)

/datum/loadout_item/pocket_items/theurgic_crystal
	restricted_roles = list(JOB_CHAPLAIN)

/datum/loadout_item/pocket_items/hypno_watch
	restricted_roles = list(JOB_PSYCHOLOGIST, JOB_CHIEF_MEDICAL_OFFICER)

//override to medics
/datum/loadout_item/pocket_items/paragon_box
	restricted_roles = list(JOB_PARAMEDIC, JOB_CHIEF_MEDICAL_OFFICER)

/datum/loadout_item/pocket_items/paragon_box_skinapplier
	restricted_roles = list(JOB_PARAMEDIC, JOB_CHIEF_MEDICAL_OFFICER)

//override to sec
/datum/loadout_item/pocket_items/jumperbox
	restricted_roles = list(ALL_JOBS_SEC)

/datum/loadout_item/pocket_items/jumperbox_skinapplier
	restricted_roles = list(ALL_JOBS_SEC)

/datum/loadout_item/accessory/mercbadge
	restricted_roles = list(ALL_JOBS_SEC)

/datum/loadout_item/shoes/rax_armadyne_boots
	restricted_roles = list(JOB_NT_REP, JOB_BLUESHIELD, JOB_CAPTAIN, JOB_HEAD_OF_SECURITY, JOB_VETERAN_ADVISOR, JOB_WARDEN)

//modular fixes

/obj/item/instrument/piano_synth/headphones/catear_headphone
	icon_state = "catear_headphone" // was "/obj/item/instrument/piano_synth/headphones/catear_headphone"
