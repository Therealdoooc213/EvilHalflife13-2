/mob/living/simple_animal/hostile/halflife/zombie
	name = "Zombie"
	desc = "A shambling human, taken over by a parasitic head crab."
	icon = 'icons/mob/halflife.dmi'
	icon_state = "zombie"
	icon_living = "zombie"
	icon_dead = "zombie_dead"
	faction = list("headcrab")
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	stat_attack = UNCONSCIOUS //braains
	maxHealth = 100
	health = 100
	projectile_bonus_damage = 0.8 //so melee can be competitive against them, while projectiles dont instantly wipe them
	speak_chance = 1
	speak = list("G-GOD HELP ME!","OH G-GOD!","K-KILL ME!")
	harm_intent_damage = 5
	melee_damage_lower = 18
	melee_damage_upper = 21
	sharpness = SHARP_EDGED
	wound_bonus = 5
	bare_wound_bonus = 5
	attack_vis_effect = ATTACK_EFFECT_CLAW
	attacktext = "claws"
	attack_sound = 'sound/creatures/halflife/zombieattack.ogg'
	combat_mode = TRUE
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	status_flags = CANPUSH
	move_to_delay = 5
	deathsound = 'sound/creatures/halflife/zombiedeath.ogg'
	var/no_crab_state = "zombie_dead_nocrab"
	var/crabless_possible = TRUE
	var/headcrabspawn = /mob/living/simple_animal/hostile/halflife/headcrab
	var/idle_sound_chance = 40
	var/sound_vary = TRUE
	var/fungalheal = FALSE
	var/aggro_sound = 'sound/creatures/halflife/zombieaggro.ogg'
	var/idle_sounds = list('sound/creatures/halflife/zombiesound.ogg', 'sound/creatures/halflife/zombiesound2.ogg', 'sound/creatures/halflife/zombiesound3.ogg')

/mob/living/simple_animal/hostile/halflife/zombie/Aggro()
	. = ..()
	set_combat_mode(TRUE)
	if(prob(50))
		playsound(src, aggro_sound, 50, sound_vary)

/mob/living/simple_animal/hostile/halflife/zombie/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(prob(idle_sound_chance))
		var/chosen_sound = pick(idle_sounds)
		playsound(src, chosen_sound, 50, sound_vary)
	//If there is fungal infestation on the ground, and the zombie can heal off of it, do so
	if(fungalheal)
		if(locate(/obj/structure/alien/weeds) in src.loc)
			adjustHealth(-maxHealth*0.05)


/mob/living/simple_animal/hostile/halflife/zombie/death(gibbed)
	if(prob(25) && crabless_possible) //25% chance to spawn a headcrab on death
		icon_dead = no_crab_state
		icon_state = no_crab_state
		new headcrabspawn(get_turf(src))
	..()

/mob/living/simple_animal/hostile/halflife/zombie/zombine
	name = "Zombine"
	desc = "A shambling combine soldier, taken over by a parasitic head crab."
	icon_state = "zombine"
	icon_living = "zombie"
	icon_dead = "zombine_dead"
	maxHealth = 160
	health = 160
	speak = list("S-Sector, nnnot... secur-e-e...","B-Biotics-s...","O-Over...watch... r-r-reserve...")
	attack_sound = 'sound/creatures/halflife/zombineattack.ogg'
	deathsound = 'sound/creatures/halflife/zombinedeath.ogg'
	crabless_possible = FALSE
	aggro_sound = 'sound/creatures/halflife/zombineaggro.ogg'
	idle_sounds = list('sound/creatures/halflife/zombinesound1.ogg', 'sound/creatures/halflife/zombinesound2.ogg', 'sound/creatures/halflife/zombinesound3.ogg', 'sound/creatures/halflife/zombinesound4.ogg')

/mob/living/simple_animal/hostile/halflife/zombie/fast
	name = "Fast Zombie"
	desc = "A terrifying skinless human, taken over by a parasitic head crab."
	icon_state = "fastzombie"
	icon_living = "fastzombie"
	icon_dead = "fastzombie_dead"
	faction = list("headcrab")
	maxHealth = 80
	health = 80
	speak_chance = 0
	melee_damage_lower = 7
	melee_damage_upper = 9
	rapid_melee = 4 //attacks quite fast
	attack_sound = 'sound/creatures/halflife/fastzombieattack.ogg'
	combat_mode = TRUE
	move_to_delay = 3
	speed = -1
	ranged = 1 //for jumping
	deathsound = 'sound/creatures/halflife/fastzombiedeath.ogg'
	no_crab_state = "fastzombie_nocrab"
	idle_sound_chance = 100
	sound_vary = FALSE
	aggro_sound = 'sound/creatures/halflife/fastzombiealert.ogg'
	idle_sounds = list('sound/creatures/halflife/fastzombie_breath.ogg', 'sound/creatures/halflife/fastzombiesound1.ogg', 'sound/creatures/halflife/fastzombiesound2.ogg', 'sound/creatures/halflife/fastzombiesound3.ogg')
	var/charging = FALSE
	var/revving_charge = FALSE
	var/dash_speed = 1

/mob/living/simple_animal/hostile/halflife/zombie/fast/OpenFire()
	if(charging)
		return
	var/tturf = get_turf(target)
	if(!isturf(tturf))
		return
	if(get_dist(src, target) <= 7)
		charge()
		ranged_cooldown = world.time + ranged_cooldown_time

/mob/living/simple_animal/hostile/halflife/zombie/fast/proc/charge(atom/chargeat = target, delay = 5)
	if(!chargeat)
		return
	var/chargeturf = get_turf(chargeat)
	if(!chargeturf)
		return
	var/dir = get_dir(src, chargeturf)
	var/turf/T = get_ranged_target_turf(chargeturf, dir, 2)
	if(!T)
		return
	charging = TRUE
	revving_charge = TRUE
	walk(src, 0)
	setDir(dir)
	SLEEP_CHECK_DEATH(delay)
	revving_charge = FALSE
	playsound(src, 'sound/creatures/halflife/fastzombieleap.ogg', 40, sound_vary)
	walk_towards(src, T, dash_speed)
	SLEEP_CHECK_DEATH(get_dist(src, T) * dash_speed)
	walk(src, 0) // cancel the movement
	charging = FALSE

/mob/living/simple_animal/hostile/halflife/zombie/fast/Move()
	if(revving_charge)
		return FALSE
	..()

/mob/living/simple_animal/hostile/halflife/zombie/fungal
	name = "Fungal Zombie"
	desc = "A shambling human, taken over by a parasitic head crab. This one is covered in a spreading fungal infection."
	icon_state = "fungalzombie"
	icon_living = "fungalzombie"
	icon_dead = "fungalzombie_dead"
	no_crab_state = "fungalzombie_nocrab"
	maxHealth = 160
	health = 160
	fungalheal = TRUE
	move_to_delay = 6
	headcrabspawn = /mob/living/simple_animal/hostile/halflife/headcrab/armored
	var/datum/action/cooldown/spell/conjure/xenfloor/infest

/mob/living/simple_animal/hostile/halflife/zombie/fungal/Initialize(mapload)
	. = ..()
	infest = new(src)
	infest.Grant(src)

/mob/living/simple_animal/hostile/halflife/zombie/poison
	name = "Poison Zombie"
	desc = "A bloated, fleshy human taken over by a parasitic poison headcrab."
	icon_state = "poisonzombie"
	icon_living = "poisonzombie"
	icon_dead = "poisonzombie_dead"
	maxHealth = 160
	health = 160
	move_to_delay = 7
	speed = 1.2
	speak = list("Mrrrraaaaghhhhh...","ggg-ggrrahhh...","P-p...o...he-l..")
	deathsound = 'sound/creatures/halflife/poison/pz_die1.ogg'
	crabless_possible = FALSE
	aggro_sound = 'sound/creatures/halflife/poison/pz_alert1.ogg'
	idle_sounds = list('sound/creatures/halflife/poison/pz_breathe_loop1.ogg')
	sound_vary = FALSE
	ranged_cooldown_time = 60
	ranged = 1
	var/crabs_left = 3
	var/nowthrowing = FALSE
	var/revving_throw = FALSE
	var/brood_type = /mob/living/simple_animal/hostile/halflife/headcrab/poison

/mob/living/simple_animal/hostile/halflife/zombie/poison/OpenFire()
	if(nowthrowing)
		return
	if(crabs_left < 1)
		return
	var/tturf = get_turf(target)
	if(!isturf(tturf))
		return
	if(get_dist(src, target) <= 7)
		throwcrab()
		ranged_cooldown = world.time + ranged_cooldown_time

/mob/living/simple_animal/hostile/halflife/zombie/poison/proc/throwcrab(atom/throwat = target, delay = 10)
	if(!throwat)
		return
	var/throwturf = get_turf(throwat)
	if(!throwturf)
		return
	var/dir = get_dir(src, throwturf)
	var/turf/T = get_ranged_target_turf(throwturf, dir, 2)
	if(!T)
		return
	nowthrowing = TRUE
	revving_throw = TRUE
	walk(src, 0)
	setDir(dir)
	playsound(src, 'sound/creatures/halflife/poison/pz_warn1.ogg', 40, sound_vary)
	SLEEP_CHECK_DEATH(delay)
	revving_throw = FALSE
	playsound(src, 'sound/creatures/halflife/poison/pz_throw3.ogg', 40, sound_vary)
	var/mob/living/simple_animal/hostile/halflife/headcrab/poison/P = new brood_type(src.loc)
	P.charge(T)
	SLEEP_CHECK_DEATH(delay)
	nowthrowing = FALSE
	crabs_left--

/mob/living/simple_animal/hostile/halflife/zombie/poison/Move()
	if(revving_throw || nowthrowing)
		return FALSE
	..()



//leaping headcrabs
/mob/living/simple_animal/hostile/halflife/headcrab
	name = "Headcrab"
	desc = "A parasitic headcrab."
	icon = 'icons/mob/halflife.dmi'
	icon_state = "headcrab"
	icon_living = "headcrab"
	icon_dead = "headcrab_dead"
	faction = list("headcrab")
	mob_biotypes = MOB_ORGANIC
	stat_attack = UNCONSCIOUS //braains
	maxHealth = 30
	health = 30
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 10
	bare_wound_bonus = 10
	sharpness = SHARP_EDGED
	attack_vis_effect = ATTACK_EFFECT_BITE
	ranged = 1 //for leaping
	attacktext = "bites"
	attack_sound = 'sound/creatures/halflife/headcrabbite.ogg'
	combat_mode = TRUE
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	move_to_delay = 8
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/xen = 1)
	deathsound = 'sound/creatures/halflife/headcrabdeath.ogg'
	var/charging = FALSE
	var/revving_charge = FALSE
	var/dash_speed = 1
	var/dash_delay = 5
	var/delaysound
	var/leapsound = 'sound/creatures/halflife/headcrableap.ogg'
	var/soundvary = TRUE

/mob/living/simple_animal/hostile/halflife/headcrab/OpenFire()
	if(charging)
		return
	var/tturf = get_turf(target)
	if(!isturf(tturf))
		return
	if(get_dist(src, target) <= 7)
		charge()
		ranged_cooldown = world.time + ranged_cooldown_time

/mob/living/simple_animal/hostile/halflife/headcrab/proc/charge(atom/chargeat = target, delay = dash_delay)
	if(!chargeat)
		return
	var/chargeturf = get_turf(chargeat)
	if(!chargeturf)
		return
	var/dir = get_dir(src, chargeturf)
	var/turf/T = get_ranged_target_turf(chargeturf, dir, 2)
	if(!T)
		return
	charging = TRUE
	revving_charge = TRUE
	walk(src, 0)
	setDir(dir)
	if(delaysound)
		playsound(src, delaysound, 40, soundvary)
	SLEEP_CHECK_DEATH(delay)
	revving_charge = FALSE
	playsound(src, leapsound, 40, soundvary)
	walk_towards(src, T, dash_speed)
	SLEEP_CHECK_DEATH(get_dist(src, T) * dash_speed)
	walk(src, 0) // cancel the movement
	charging = FALSE

/mob/living/simple_animal/hostile/halflife/headcrab/Move()
	if(revving_charge)
		return FALSE
	..()

/mob/living/simple_animal/hostile/halflife/headcrab/armored
	name = "Armored Headcrab"
	desc = "A parasitic headcrab with a hardened fungal carapace."
	icon_state = "armoredheadcrab"
	icon_living = "armoredheadcrab"
	icon_dead = "armoredheadcrab_dead"
	maxHealth = 60
	health = 60
	projectile_bonus_damage = 0.8

/mob/living/simple_animal/hostile/halflife/headcrab/poison
	name = "Poison Headcrab"
	desc = "An extra large and dark headcrab, with pronounced fangs."
	icon_state = "poisonheadcrab"
	icon_living = "poisonheadcrab"
	icon_dead = "poisonheadcrab_dead"
	maxHealth = 45
	health = 45
	dash_delay = 10
	soundvary = FALSE

	rapid_melee = 0.2 // attacks rather slow

	deathsound = 'sound/creatures/halflife/poison/ph_death.ogg'
	attack_sound = 'sound/creatures/halflife/poison/ph_poisonbite.ogg'
	delaysound = 'sound/creatures/halflife/poison/ph_scream.ogg'
	leapsound = 'sound/creatures/halflife/poison/ph_jump.ogg'

	var/poison_type = /datum/reagent/toxin
	var/poison_per_attack = 7 //one bite is about 22.5 toxin damage, though it takes quite a while for it to run it's course. Not a whole lot, but it goes through armor, and is generally harder to heal than brute damage.

	var/aggro_sound = 'sound/creatures/halflife/poison/ph_rattle.ogg'
	var/idle_sounds = list('sound/creatures/halflife/poison/ph_talk1.ogg', 'sound/creatures/halflife/poison/ph_talk2.ogg', 'sound/creatures/halflife/poison/ph_talk3.ogg')

/mob/living/simple_animal/hostile/halflife/headcrab/poison/Aggro()
	. = ..()
	set_combat_mode(TRUE)
	if(prob(50))
		playsound(src, aggro_sound, 50, soundvary)

/mob/living/simple_animal/hostile/halflife/headcrab/poison/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(prob(25))
		var/chosen_sound = pick(idle_sounds)
		playsound(src, chosen_sound, 50, soundvary)

/mob/living/simple_animal/hostile/halflife/headcrab/poison/AttackingTarget()
	..()
	if(isliving(target))
		var/mob/living/L = target
		if(target.reagents)
			L.reagents.add_reagent(poison_type, poison_per_attack)


/mob/living/simple_animal/hostile/halflife/hunter
	name = "Hunter"
	desc = "A large tripod synth. Armored, and deadly."
	icon = 'icons/mob/halflife_large.dmi'
	icon_state = "hunter"
	icon_living = "hunter"
	icon_dead = "hunter_dead"
	faction = list("combine")
	mob_biotypes = MOB_ORGANIC
	stat_attack = UNCONSCIOUS
	maxHealth = 300
	health = 300
	projectile_bonus_damage = 0.8 //so melee can be slightly more competitive
	harm_intent_damage = 25
	melee_damage_lower = 20
	melee_damage_upper = 25
	sharpness = SHARP_EDGED
	bare_wound_bonus = 10
	attack_vis_effect = ATTACK_EFFECT_CLAW
	attacktext = "claws"
	attack_sound = 'sound/creatures/halflife/hunter/hunter_skewer1.ogg'
	combat_mode = TRUE
	atmos_requirements = list("min_oxy" = 0, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 0, "min_co2" = 0, "max_co2" = 0, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	status_flags = CANPUSH
	footstep_type = FOOTSTEP_MOB_HUNTER
	speed = -1
	deathsound = 'sound/creatures/halflife/hunter/hunter_die3.ogg'
	var/aggro_sound = list('sound/creatures/halflife/hunter/hunter_foundenemy1.ogg', 'sound/creatures/halflife/hunter/hunter_foundenemy2.ogg', 'sound/creatures/halflife/hunter/hunter_foundenemy3.ogg', 'sound/creatures/halflife/hunter/hunter_pain.ogg')
	var/idle_sounds = list('sound/creatures/halflife/hunter/hunter_idle1.ogg', 'sound/creatures/halflife/hunter/hunter_idle2.ogg', 'sound/creatures/halflife/hunter/hunter_idle3.ogg', 'sound/creatures/halflife/hunter/hunter_scan.ogg')

	ranged = 1
	rapid = 3
	retreat_distance = 4
	minimum_distance = 4
	projectilesound = 'sound/creatures/halflife/hunter/hunter_fire1.ogg'
	casingtype = /obj/item/ammo_casing/caseless/flechette

	var/charge_cooldown = 0
	var/charge_cooldown_time = 10 SECONDS

	var/playstyle_string = span_notice("You are a Hunter, a large synth designed for protecting striders and hunting down malignants in a swift manner. You can fire bursts of flechettes by clicking, and can Alt-Click to charge at an enemy to send them flying.")

/mob/living/simple_animal/hostile/halflife/hunter/Aggro()
	. = ..()
	set_combat_mode(TRUE)
	if(prob(50))
		var/chosen_sound = pick(aggro_sound)
		playsound(src, chosen_sound, 50, FALSE)

/mob/living/simple_animal/hostile/halflife/hunter/Life(seconds_per_tick = SSMOBS_DT, times_fired)
	..()
	if(stat)
		return
	if(prob(15))
		var/chosen_sound = pick(idle_sounds)
		playsound(src, chosen_sound, 50, FALSE)

/mob/living/simple_animal/hostile/halflife/hunter/proc/hunter_charge(move_dir, times_ran)
	if(times_ran >= 5)
		return
	var/turf/T = get_step(get_turf(src), move_dir)
	if(ismineralturf(T))
		var/turf/closed/mineral/M = T
		M.attempt_drill()
	if(T.density)
		return
	for(var/obj/structure/window/W in T.contents)
		return
	for(var/obj/machinery/door/D in T.contents)
		return
	for(var/obj/structure/halflife/fence/F in T.contents)
		return
	for(var/obj/machinery/turnstile/S in T.contents)
		return
	forceMove(T)
	playsound(src,'sound/creatures/halflife/hunter/hunter_footstep1.ogg', 200, 1)
	var/list/hit_things = list()
	var/throwtarget = get_edge_target_turf(src, move_dir)
	for(var/mob/living/L in T.contents - hit_things - src)
		if(faction_check_mob(L))
			return
		hit_things += L
		visible_message(span_boldwarning("[src] slams into [L]!"))
		to_chat(L, span_userdanger("[src] slams into you, sending you flying!"))
		L.safe_throw_at(throwtarget, 5, 1, src)
		L.Paralyze(20)
		L.adjustBruteLoss(30)
		playsound(src,'sound/creatures/halflife/hunter/hunter_chargehit.ogg', 200, 1)
	addtimer(CALLBACK(src, PROC_REF(hunter_charge), move_dir, (times_ran + 1)), 2)

/mob/living/simple_animal/hostile/halflife/hunter/proc/hunter_begincharge(target)
	if(charge_cooldown + charge_cooldown_time > world.time)
		to_chat(src, span_warning("Your charge ability is still on cooldown!"))
		return

	charge_cooldown = world.time
	var/dir_to_target = get_dir(get_turf(src), get_turf(target))
	setDir(dir_to_target)
	playsound(src,'sound/creatures/halflife/hunter/hunter_charge.ogg', 200, 1)
	visible_message(span_boldwarning("[src] prepares to charge!"))
	addtimer(CALLBACK(src, PROC_REF(hunter_charge), dir_to_target, 0), 5)

/mob/living/simple_animal/hostile/halflife/hunter/AltClickOn(atom/A)
	hunter_begincharge(A)

/mob/living/simple_animal/hostile/halflife/hunter/Login()
	..()
	to_chat(src, playstyle_string)
