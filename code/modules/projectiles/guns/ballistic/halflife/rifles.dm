/obj/item/gun/ballistic/automatic/ar2
	name = "\improper OSIPR"
	desc = "A pulse rifle often dubbed the 'AR2'. Boasts superior armor piercing capabilities, accuracy, and firepower. Usually biolocked to only be usable by authorised individuals."
	icon = 'icons/obj/guns/halflife/projectile.dmi'
	icon_state = "ar2"
	item_state = "arg"
	fire_sound = "sound/weapons/halflife/ar2fire.ogg"
	mag_type = /obj/item/ammo_box/magazine/ar2
	force = 10
	spread = 12
	semi_auto_spread = 11
	recoil = 0.8
	fire_delay = 2
	burst_size = 1
	mag_display = TRUE
	weapon_weight = WEAPON_MEDIUM
	pin = /obj/item/firing_pin/implant/mindshield

/obj/item/gun/ballistic/automatic/ar2/nopin
	pin = null

/obj/item/gun/ballistic/automatic/ar2/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.2 SECONDS)

//old rifles that are exclusively loot. Similar to the AR2, but slightly less accurate, and no armor piercing by default. Slightly more damage too, but fires slower.
/obj/item/gun/ballistic/automatic/m4a1
	name = "\improper M4A1 Rifle"
	desc = "A old M4A1 pattern rifle. Not as good as the combine's rifles, but still powerful."
	icon = 'icons/obj/guns/halflife/projectile.dmi'
	icon_state = "m4a1"
	item_state = "lwt650"
	fire_sound = "sound/weapons/dmrshot.ogg"
	vary_fire_sound = FALSE 
	load_sound = "sound/weapons/rifleload.ogg"
	load_empty_sound = "sound/weapons/rifleload.ogg"
	rack_sound = "sound/weapons/riflerack.ogg"
	eject_sound = "sound/weapons/rifleunload.ogg"
	eject_empty_sound = "sound/weapons/rifleunload.ogg"
	mag_type = /obj/item/ammo_box/magazine/m4a1
	force = 10
	fire_delay = 2
	burst_size = 1
	spread = 14
	semi_auto_spread = 13
	recoil = 1
	can_suppress = FALSE
	can_bayonet = TRUE
	knife_x_offset = 27
	knife_y_offset = 12
	mag_display = TRUE
	weapon_weight = WEAPON_MEDIUM
	w_class = WEIGHT_CLASS_BULKY

/obj/item/gun/ballistic/automatic/m4a1/no_mag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/m4a1/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.4 SECONDS)

//the crossbow

/obj/item/gun/ballistic/bow/crossbow/rebar
	name = "Heated Rebar Crossbow"
	desc = "A handcrafted crossbow that fires heated rods of rebar."
	icon = 'icons/obj/guns/halflife/projectile.dmi'
	fire_sound = "sound/weapons/halflife/crossbowfire.ogg"
	draw_sound = 'sound/weapons/halflife/crossbowbolt_load.ogg'
	icon_state = "rebarxbow"
	item_state = "rebarxbow"
	vary_fire_sound = FALSE
	force = 12
	spread = 0
	mag_type = /obj/item/ammo_box/magazine/internal/bow/rebar
