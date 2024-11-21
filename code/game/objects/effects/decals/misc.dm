//Used by spraybottles.
/obj/effect/decal/chempuff
	name = "chemicals"
	icon = 'icons/obj/chempuff.dmi'
	pass_flags = PASSTABLE | PASSGRILLE
	layer = FLY_LAYER

/obj/effect/decal/chempuff/blob_act(obj/structure/blob/B)
	return

/obj/effect/decal/fakelattice
	name = "lattice"
	desc = "A lightweight support lattice."
	icon = 'icons/obj/smooth_structures/lattice.dmi'
	icon_state = "lattice"
	density = TRUE

/obj/effect/decal/antlionblood
	name = "bloody mess"
	gender = PLURAL
	icon = 'icons/effects/blood.dmi'
	icon_state = "antsplatter"
	var/sound_to_play = 'sound/effects/blobattack.ogg'

/obj/effect/decal/antlionblood/Initialize(mapload, mob/living/source_mob, list/datum/disease/diseases)
	. = ..()
	if(sound_to_play)
		playsound(src, sound_to_play, 40, TRUE)
