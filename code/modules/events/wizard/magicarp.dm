/datum/round_event_control/wizard/magicarp //these fish is loaded
	name = "Magicarp"
	weight = 1
	typepath = /datum/round_event/wizard/magicarp
	max occurrences = 0
	earliest_start = 0 MINUTES

/datum/round_event/wizard/magicarp
	announceWhen	= 3
	startWhen = 50

/datum/round_event/wizard/magicarp/setup()
	startWhen = rand(40, 60)

/datum/round_event/wizard/magicarp/announce(fake)
	priority_announce("Unknown magical entities have been detected near [station_name()], please stand-by.", "Lifesign Alert")

/datum/round_event/wizard/magicarp/start()
	for(var/obj/effect/landmark/carpspawn/C in GLOB.landmarks_list)
		if(prob(5))
			new /mob/living/simple_animal/hostile/carp/ranged/chaos(C.loc)
		else
			new /mob/living/simple_animal/hostile/carp/ranged(C.loc)

/mob/living/simple_animal/hostile/carp/ranged
	name = "magicarp"
	desc = "50% magic, 50% carp, 100% horrible."
	icon_gib = "magicarp_gib"
	ranged = 1
	retreat_distance = 2
	minimum_distance = 0 //Between shots they can and will close in to nash
	projectiletype = /obj/projectile/magic
	projectilesound = 'sound/weapons/emitter.ogg'
	maxHealth = 50
	health = 50
	gold_core_spawnable = NO_SPAWN
	greyscale_config = /datum/greyscale_config/carp_magic
	random_color = FALSE
	var/allowed_projectile_types = list(/obj/projectile/magic/animate, /obj/projectile/magic/resurrection,
	/obj/projectile/magic/death, /obj/projectile/magic/teleport, /obj/projectile/magic/door, /obj/projectile/magic/fireball,
	/obj/projectile/magic/spellblade, /obj/projectile/magic/arcane_barrage)

/mob/living/simple_animal/hostile/carp/ranged/Initialize(mapload)
	projectiletype = pick(allowed_projectile_types)
	return ..()

/mob/living/simple_animal/hostile/carp/ranged/wizard
	faction = list("wizard")

/mob/living/simple_animal/hostile/carp/ranged/wizard/sentience_act()
	faction -= "wizard"

/mob/living/simple_animal/hostile/carp/ranged/chaos
	name = "chaos magicarp"
	desc = "50% carp, 100% magic, 150% horrible."
	color = "#00FFFF"
	maxHealth = 75
	health = 75

/mob/living/simple_animal/hostile/carp/ranged/chaos/Shoot()
	projectiletype = pick(allowed_projectile_types)
	..()
