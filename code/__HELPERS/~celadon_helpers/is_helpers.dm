#define isnucleation(A) (is_species(A, /datum/species/nucleation))
#define hastail(user) (istype(user.get_organ_slot(ORGAN_SLOT_TAIL), /obj/item/organ/tail) || istype(user.get_organ_slot(ORGAN_SLOT_EXTERNAL_TAIL), /obj/item/organ/tail))
#define haswings(user) (istype(user.get_organ_slot(ORGAN_SLOT_WINGS), /obj/item/organ/wings) || istype(user.get_organ_slot(ORGAN_SLOT_EXTERNAL_WINGS), /obj/item/organ/wings))
//blackmesa
#define isblackmesamob(A) (istype(A, /mob/living/basic/blackmesa))
#define isblackmesaxenmob(A) (istype(A, /mob/living/basic/blackmesa/xen))
#define isblackmesaheadcrab(A) (istype(A, /mob/living/basic/blackmesa/xen/headcrab))
#define isxenmob(A) (istype(A, /mob/living/simple_animal/hostile/blackmesa/xen))
