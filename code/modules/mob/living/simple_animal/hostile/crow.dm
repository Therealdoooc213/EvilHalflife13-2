/*
/obj/item/reagent_containers/food/snacks/crow
	name = "crow"
	desc = "A dark feathered crow."
	icon_state = "crow"
	icon = 'icons/mob/animal.dmi'
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	foodtype = RAW
	verb_say = "squeaks"
	verb_yell = "squeaks"
	obj_flags = CAN_BE_HIT
	var/dead = FALSE
	max_integrity = 10

/obj/item/reagent_containers/food/snacks/crow/dead
	dead = TRUE

/obj/item/reagent_containers/food/snacks/crow/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)
	if(dead)
		icon_state = "[icon_state]l"

/obj/item/reagent_containers/food/snacks/crow/attack_hand(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(!(L.mobility_flags & MOBILITY_PICKUP))
			return
	user.changeNext_move(CLICK_CD_MELEE)
	if(dead)
		..()
	else
		if(isliving(user))
			var/mob/living/L = user
			if(prob(10))
				..()
			else
				if(isturf(loc))
					to_chat(user, "<span class='warning'>I fail to snatch [src]!</span>")
					playsound(src, 'sound/creatures/birdfly.ogg', 100, TRUE, -1)
					qdel(src)
					return
	..()

/obj/item/reagent_containers/food/snacks/crow/process()
	..()
	if(dead)
		return
	if(!isturf(loc)) //no floating out of bags
		return
	if(prob(8))
		playsound(src, pick('sound/creatures/CROW_01.ogg','sound/creatures/CROW_02.ogg','sound/creatures/CROW_03.ogg'), 100, TRUE, -1)

/obj/item/reagent_containers/food/snacks/crow/obj_destruction(damage_flag)
	//..()
	if(!dead)
		dead = TRUE
		playsound(src, 'sound/creatures/rat_death.ogg', 100, FALSE, -1)
		icon_state = "[icon_state]1"
		return 1
	. = ..()

/obj/item/reagent_containers/food/snacks/crow/Crossed(mob/living/L)
	. = ..()
	if(!dead)
		playsound(src, 'sound/creatures/birdfly.ogg', 100, TRUE, -1)
		qdel(src)


/obj/item/reagent_containers/food/snacks/crow/attackby(obj/item/I, mob/user, params)
	if(!dead)
		if(isliving(user) && isturf(loc))
			var/mob/living/L = user
			if(prob(10))
				..()
			else
				to_chat(user, "<span class='warning'>[src] gets away!</span>")
				playsound(src, 'sound/creatures/birdfly.ogg', 100, TRUE, -1)
				qdel(src)
				return
	..()
*/
