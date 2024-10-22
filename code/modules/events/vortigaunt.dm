/datum/round_event_control/vortigaunt
	name = "Spawn Vortigaunt"
	typepath = /datum/round_event/ghost_role/vortigaunt
	max_occurrences = 1
	min_players = 15
	weight = 5
	earliest_start = 20 MINUTES
	dynamic_should_hijack = TRUE

/datum/round_event/ghost_role/vortigaunt
	minimum_required = 1
	role_name = "vortigaunt"
	fakeable = FALSE

/datum/round_event/ghost_role/vortigaunt/spawn_role()
	var/list/candidates = get_candidates(ROLE_SENTIENCE, null, ROLE_SENTIENCE)
	if(!candidates.len)
		return NOT_ENOUGH_PLAYERS

	var/mob/dead/selected = pick(candidates)

	var/datum/mind/player_mind = new /datum/mind(selected.key)
	player_mind.active = TRUE

	var/list/spawn_locs = list()
	for(var/X in GLOB.xeno_spawn)
		spawn_locs += X

	if(!spawn_locs.len)
		message_admins("No valid spawn locations found, aborting...")
		return MAP_ERROR

	var/mob/living/carbon/human/S = new ((pick(spawn_locs)))
	player_mind.transfer_to(S)
	player_mind.assigned_role = "Vortigaunt"
	player_mind.special_role = "Vortigaunt"
	S.set_species(/datum/species/vortigaunt)
	playsound(S, 'sound/magic/ethereal_exit.ogg', 50, 1, -1)
	message_admins("[ADMIN_LOOKUPFLW(S)] has been made into a Vortigaunt by an event.")
	log_game("[key_name(S)] was spawned as a Vortigaunt by an event.")
	spawned_mobs += S
	return SUCCESSFUL_SPAWN
