/mob/living/carbon/human/get_movespeed_modifiers()
	var/list/considering = ..()
	. = considering
	if(HAS_TRAIT(src, TRAIT_IGNORESLOWDOWN))
		for(var/id in .)
			var/list/data = .[id]
			if(data[MOVESPEED_DATA_INDEX_FLAGS] & IGNORE_NOSLOW)
				.[id] = data

/mob/living/carbon/human/movement_delay()
	. = ..()
	if(dna && dna.species)
		. += dna.species.movement_delay(src)

/mob/living/carbon/human/slip(knockdown_amount, obj/O, lube, stun, forcedrop)
	if(HAS_TRAIT(src, TRAIT_NOSLIPALL))
		return 0
	if (!(lube & GALOSHES_DONT_HELP))
		if(HAS_TRAIT(src, TRAIT_NOSLIPWATER))
			return 0
		if(shoes && istype(shoes, /obj/item/clothing))
			var/obj/item/clothing/CS = shoes
			if (CS.clothing_flags & NOSLIP)
				return 0
	if (lube & SLIDE_ICE)
		if(HAS_TRAIT(src, TRAIT_NOSLIPICE))
			return 0
		if(shoes && istype(shoes, /obj/item/clothing))
			var/obj/item/clothing/CS = shoes
			if (CS.clothing_flags & NOSLIP_ICE)
				return 0
	return ..()

/mob/living/carbon/human/experience_pressure_difference(pressure_difference)
	if(pressure_difference > 100)
		playsound_local(null, 'sound/effects/space_wind_big.ogg', clamp(pressure_difference / 50, 10, 100), 1)
	else
		playsound_local(null, 'sound/effects/space_wind.ogg', clamp(pressure_difference, 10, 100), 1)
	if(dna.species.has_heavy_gravity(src))
		return FALSE
	if(shoes && istype(shoes, /obj/item/clothing))
		var/obj/item/clothing/S = shoes
		if((S.clothing_flags & NOSLIP))
			return 0
	return ..()

/mob/living/carbon/human/mob_has_gravity()
	. = ..()
	if(!.)
		if(mob_negates_gravity())
			. = 1

/mob/living/carbon/human/mob_negates_gravity()
	return ((shoes && shoes.negates_gravity()) || (dna.species.negates_gravity(src)) || HAS_TRAIT(src, TRAIT_MAGBOOTS))

/mob/living/carbon/human/mob_has_heavy_gravity()
	return (shoes && shoes.negates_gravity() || (dna.species.has_heavy_gravity(src)) || HAS_TRAIT(src, TRAIT_MAGBOOTS))

/mob/living/carbon/human/Move(NewLoc, direct)
	. = ..()
	
	if(loc == NewLoc)
		if(!has_gravity(loc))
			return

		if(w_uniform)
			if(mobility_flags & MOBILITY_STAND)
				var/obj/item/clothing/under/C = w_uniform
				C.step_action()

		if(shoes)
			if(mobility_flags & MOBILITY_STAND)
				var/obj/item/clothing/shoes/S = shoes
				S.step_action()

/mob/living/carbon/human/Process_Spacemove(movement_dir = 0) //Temporary laziness thing. Will change to handles by species reee.
	if(dna.species.space_move(src))
		return TRUE
	return ..()
