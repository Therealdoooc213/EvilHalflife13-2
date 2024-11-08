/datum/round_event_control/agent
	name = "Spawn Agent"
	typepath = /datum/round_event/ghost_role/agent
	max occurrences = 1
	min_players = 10
	earliest_start = 5 MINUTES

/datum/round_event/ghost_role/agent
	var/success_spawn = 0
	minimum_required = 1
	role_name = "combine infiltration agent"
	fakeable = FALSE
	// LAME jobs that people typically do not care about
	var/static/list/possible_jobs = list("Citizen", "Clerk")

/datum/round_event/ghost_role/agent/kill()
	if(!success_spawn && control)
		control.occurrences--
	return ..()

/datum/round_event/ghost_role/agent/spawn_role()
	//selecting a spawn_loc
	if(!SSjob.latejoin_trackers.len)
		return MAP_ERROR

	//selecting a candidate player
	var/list/candidates = get_candidates(ROLE_INFILTRATOR, null, ROLE_INFILTRATOR)
	if(!candidates.len)
		return NOT_ENOUGH_PLAYERS

	// Select the job we spawn as
	var/datum/job/selected_job
	var/list/datum/job/potential_job_list = list()
	var/list/datum/job/job_datum_list = list()
	for(var/jobname in possible_jobs)
		var/datum/job/job_datum = SSjob.GetJob(jobname)
		if(!job_datum || !istype(job_datum))
			continue
		potential_job_list |= job_datum // Backup in case all jobs are somehow filled, just bypass job limits
		if((job_datum.current_positions >= job_datum.total_positions) && job_datum.total_positions != -1)
			continue
		job_datum_list |= job_datum

	if(!potential_job_list.len)
		return "No valid possible_jobs"

	if(!job_datum_list.len)
		job_datum_list = potential_job_list

	selected_job = pick(job_datum_list)

	var/mob/dead/selected_candidate = pick_n_take(candidates)
	var/key = selected_candidate.key

	var/datum/mind/Mind = create_agent_mind(key)
	Mind.active = TRUE

	var/mob/living/carbon/human/agent = create_event_agent()
	Mind.transfer_to(agent)
	Mind.add_antag_datum(/datum/antagonist/infiltrator)

	spawned_mobs += agent
	message_admins("[ADMIN_LOOKUPFLW(agent)] has been made into a combine agent by an event.")
	log_game("[key_name(agent)] was spawned as a combine agent by an event.")

	if(SSshuttle.arrivals)
		SSshuttle.arrivals.QueueAnnounce(agent, selected_job.title)
	Mind.assigned_role = selected_job.title //sets up the manifest properly
	selected_job.equip(agent)

	var/obj/item/card/id/id = agent.get_idcard()
	if(id && istype(id))
		id.assignment = selected_job.title
		id.originalassignment = selected_job.title
		id.update_label()
	
	GLOB.data_core.manifest_inject(agent, force = TRUE)
	agent.update_move_intent_slowdown() //prevents you from going super duper fast
	return SUCCESSFUL_SPAWN


/proc/create_event_agent(spawn_loc)
	var/mob/living/carbon/human/new_agent = new(spawn_loc)
	if(!spawn_loc)
		SSjob.SendToLateJoin(new_agent)
	new_agent.randomize_human_appearance(~(RANDOMIZE_SPECIES))
	new_agent.dna.update_dna_identity()
	return new_agent

/proc/create_agent_mind(key)
	var/datum/mind/Mind = new /datum/mind(key)
	Mind.special_role = ROLE_INFILTRATOR
	return Mind
