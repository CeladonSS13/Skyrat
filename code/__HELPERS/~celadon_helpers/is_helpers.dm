#define isnucleation(A) (is_species(A, /datum/species/nucleation))
#define hastail(user) (istype(user.get_organ_slot(ORGAN_SLOT_TAIL), /obj/item/organ/tail) || istype(user.get_organ_slot(ORGAN_SLOT_EXTERNAL_TAIL), /obj/item/organ/tail))
#define haswings(user) (istype(user.get_organ_slot(ORGAN_SLOT_WINGS), /obj/item/organ/wings) || istype(user.get_organ_slot(ORGAN_SLOT_EXTERNAL_WINGS), /obj/item/organ/wings))
#define isxenmob(A) (istype(A, /mob/living/simple_animal/hostile/blackmesa/xen))
