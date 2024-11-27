/datum/species/stalker
	name = "Stalker"
	id = "stalker"
	limbs_id = "stalker"
	possible_genders = list(PLURAL)
	nojumpsuit = TRUE
	changesource_flags = MIRROR_BADMIN | WABBAJACK | ERT_SPAWN
	siemens_coeff = 0
	speedmod = 0.66
	brutemod = 1.5
	burnmod = 1.5
	punchdamagelow = 4
	punchdamagehigh = 8
	screamsound = 'sound/voice/stalker/stalker_scream.ogg'
	deathsound = 'sound/voice/stalker/stalker_die.ogg'
	special_step_sounds = list('sound/movement/stalker/stalker_footstep1.ogg', 'sound/movement/stalker/stalker_footstep2.ogg', 'sound/movement/stalker/stalker_footstep3.ogg', 'sound/movement/stalker/stalker_footstep4.ogg' )
	special_step_volume = 40
	no_equip = list(ITEM_SLOT_GLOVES, ITEM_SLOT_FEET, ITEM_SLOT_ICLOTHING, ITEM_SLOT_EARS)
	species_traits = list(NO_UNDERWEAR,NO_DNA_COPY,NOTRANSSTING,NOEYESPRITES,NOFLASH)
	inherent_traits = list(TRAIT_NOGUNS, TRAIT_RESISTCOLD, TRAIT_RESISTHIGHPRESSURE,TRAIT_RESISTLOWPRESSURE,
							TRAIT_NOBREATH, TRAIT_RADIMMUNE, TRAIT_VIRUSIMMUNE,
							TRAIT_NOCRITDAMAGE, TRAIT_GENELESS, TRAIT_NOSOFTCRIT, TRAIT_NOHARDCRIT, TRAIT_NOPAIN)
	mutanteyes = /obj/item/organ/eyes/robotic
	liked_food = MEAT | RAW 
	species_language_holder = /datum/language_holder/stalker
	action_speed_coefficient = 1.2 //their hands are little metal prods, not very dextrous

/datum/species/stalker/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	C.real_name = "stalker [rand(111,999)]"
	C.name = C.real_name
	if(C.mind)
		C.mind.name = C.real_name
	C.dna.real_name = C.real_name
	C.cmode_music = 'sound/music/combat/crawlyard.ogg'
