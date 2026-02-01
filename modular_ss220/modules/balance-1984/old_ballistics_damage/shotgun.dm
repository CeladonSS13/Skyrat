/obj/item/gun/ballistic/shotgun/katyusha
	fire_delay = 0.55 SECONDS

/obj/projectile/bullet/shotgun_slug
	// tg variant
	damage = 25
	armour_penetration = 30
	wound_bonus = 0
	exposed_wound_bonus = 15

/obj/projectile/bullet/shotgun_slug/milspec
	damage = 50
	armour_penetration = 30
	wound_bonus = 0
	exposed_wound_bonus = 15
	speed = 1.25

/obj/item/ammo_casing/shotgun/buckshot
	pellets = 12

/obj/projectile/bullet/pellet/shotgun_buckshot
	damage = 5
	wound_bonus = 5
	exposed_wound_bonus = 5
	speed = 1.1
	wound_falloff_tile = -0.5 //We would very much like this to cause wounds despite the low damage, so the drop off is relatively slow
	sharpness = SHARP_EDGED
	weak_against_armour = FALSE

/obj/projectile/bullet/pellet/shotgun_buckshot/milspec
	damage = 7.5

/obj/item/ammo_casing/shotgun/flechette/donk
	pellets = 6

/obj/projectile/bullet/pellet/shotgun_buckshot/magnum
	damage = 10
	exposed_wound_bonus = 5
	wound_bonus = 5
	armour_penetration = 5

/obj/item/ammo_casing/shotgun/express
	pellets = 15

/obj/projectile/bullet/pellet/shotgun_buckshot/express
	damage = 3
	wound_bonus = 0
	exposed_wound_bonus = 20

/obj/projectile/bullet/pellet/flechette
	damage = 2
	damage_falloff_tile = -0.2
	speed = 1.2

/datum/embedding/bullet/flechette
	embed_chance = 25
