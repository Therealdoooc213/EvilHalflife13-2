/datum/round_event_control/carp_migration
	name = "Zombie Migration"
	typepath = /datum/round_event/carp_migration
	weight = 15
	min_players = 2
	earliest_start = 10 MINUTES
	max_occurrences = 1
	max_alert = SEC_LEVEL_DELTA

/datum/round_event/carp_migration
	announceWhen	= 3
	startWhen = 40
	var/hasAnnounced = FALSE

/datum/round_event/carp_migration/setup()
	startWhen = rand(40, 60)

/datum/round_event/carp_migration/announce(fake)
	priority_announce("Attention Ground Units. Unknown biological entities have been detected near [station_name()], please stand-by.", "Lifesign Alert")


/datum/round_event/carp_migration/start()
	var/mob/living/simple_animal/hostile/halflife/zombie/fish
	for(var/obj/effect/landmark/carpspawn/C in GLOB.landmarks_list)
		if(prob(SSsociostability.getloss() / 20)) //less sociostability = more dangerous zombies
			var/type = pickweight(list("zombine" = 40, "fast" = 30, "poison" = 30))
			switch(type)
				if("zombine")
					fish = new /mob/living/simple_animal/hostile/halflife/zombie/zombine(C.loc)
				if("fast")
					fish = new /mob/living/simple_animal/hostile/halflife/zombie/fast(C.loc)
				if("poison")
					fish = new /mob/living/simple_animal/hostile/halflife/zombie/poison(C.loc)
		else if(prob(60))
			fish = new /mob/living/simple_animal/hostile/halflife/zombie(C.loc)
		else
			fish = new /mob/living/simple_animal/hostile/halflife/headcrab(C.loc)
	fishannounce(fish)

/datum/round_event/carp_migration/proc/fishannounce(atom/fish)	
	if (!hasAnnounced)
		announce_to_ghosts(fish) //Only anounce the first fish
		hasAnnounced = TRUE
