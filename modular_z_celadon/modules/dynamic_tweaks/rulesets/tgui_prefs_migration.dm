/datum/preferences/migrate_antagonists()
	..()
	migrate_antagonist(ROLE_HERETIC, list(ROLE_HERETIC_SMUGGLER, ROLE_MIDROUND_HERETIC))
	migrate_antagonist(ROLE_CHANGELING, list(ROLE_STOWAWAY_CHANGELING, ROLE_MIDROUND_CHANGELING))
