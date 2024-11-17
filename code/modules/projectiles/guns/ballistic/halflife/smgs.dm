/obj/item/gun/ballistic/automatic/mp7
	name = "\improper MP7 SMG"
	desc = "A burst pattern SMG."
	icon = 'icons/obj/guns/halflife/projectile.dmi'
	icon_state = "mp7"
	fire_sound = "sound/weapons/halflife/smgfire.ogg"
	mag_type = /obj/item/ammo_box/magazine/mp7
	bolt_type = BOLT_TYPE_LOCKING
	mag_display = TRUE
	weapon_weight = WEAPON_MEDIUM
	show_bolt_icon = FALSE
	burst_size = 1
	fire_delay = 1
	spread = 17
	semi_auto_spread = 16

/obj/item/gun/ballistic/automatic/mp7/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/mp7/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.1 SECONDS)
