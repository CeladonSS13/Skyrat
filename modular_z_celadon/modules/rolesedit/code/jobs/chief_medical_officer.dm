
//chief medical officer

/datum/job/chief_medical_officer
	antagonist_restricted = FALSE

/obj/structure/closet/secure_closet/chief_medical/PopulateContents()
	..()

	new /obj/item/healthanalyzer/advanced(src) //returning adv health analyzer
