/datum/game_mode/traitor/agent
	name = "traitor+agent"
	config_tag = "traitoragent"
	report_type = "traitoragent"
	false_report_weight = 10
	traitors_possible = 3 //hard limit on traitors if scaling is turned off
	restricted_jobs = list("Dispatch", "Cyborg", "Synthetic")
	required_players = 15
	required_enemies = 1	// how many of each type are required
	recommended_enemies = 3
	reroll_friendly = 1
	announce_span = "Rebel Spies"
	announce_text = "Possible signs of undercover resistance movements."
	title_icon = "traitor"

	num_modifier = -1 //less traitors to account for the agent
	var/list/possible_agents = list()
	var/list/agents = list()
	var/const/agent_amount = 1 //hard limit on agents if scaling is turned off

/datum/game_mode/traitor/agent/can_start()
	if(!..())
		return 0
	possible_agents = get_players_for_role(ROLE_INFILTRATOR)
	if(possible_agents.len < required_enemies)
		return 0
	return 1

/datum/game_mode/traitor/agent/pre_setup()
	if(CONFIG_GET(flag/protect_roles_from_antagonist))
		restricted_jobs += protected_jobs

	if(CONFIG_GET(flag/protect_assistant_from_antagonist))
		restricted_jobs += "Assistant"

	var/list/datum/mind/possible_agents = get_players_for_role(ROLE_INFILTRATOR)

	var/num_agents = 1

	var/csc = CONFIG_GET(number/traitor_scaling_coeff)
	if(csc)
		num_agents = max(1, min(round(num_players() / (csc * 4)) + 2, round(num_players() / (csc * 2))))
	else
		num_agents = max(1, min(num_players(), agent_amount/2))

	if(possible_agents.len>0)
		for(var/j = 0, j < num_agents, j++)
			if(!possible_agents.len)
				break
			var/datum/mind/agent = antag_pick(possible_agents)
			antag_candidates -= agent
			possible_agents -= agent
			agent.special_role = ROLE_INFILTRATOR
			agents += agent
			agent.restricted_roles = restricted_jobs
		return ..()
	else
		return 0

/datum/game_mode/traitor/agent/post_setup()
	for(var/datum/mind/agent in agents)
		agent.add_antag_datum(/datum/antagonist/agent)
	return ..()

/datum/game_mode/traitor/agent/make_antag_chance(mob/living/carbon/human/character) //Assigns agent to latejoiners
	var/csc = CONFIG_GET(number/agent_scaling_coeff)
	var/agentcap = min( round(GLOB.joined_player_list.len / (csc * 4)) + 2, round(GLOB.joined_player_list.len / (csc * 2)))
	if(agents.len >= agentcap) //Caps number of latejoin antagonists
		..()
		return
	if(agents.len <= (agentcap - 2) || prob(100 / (csc * 4)))
		if(ROLE_INFILTRATOR in character.client.prefs.be_special)
			if(!is_banned_from(character.ckey, list(ROLE_INFILTRATOR, ROLE_SYNDICATE)) && !QDELETED(character))
				if(age_check(character.client))
					if(!(character.job in restricted_jobs))
						character.mind.make_agent()
						agents += character.mind
	if(QDELETED(character))
		return
	..()

/datum/game_mode/traitor/agent/generate_report()
	return "Although more specific threats are commonplace, you should always remain vigilant for Syndicate agents aboard your station. Syndicate communications have implied that many \
		Nanotrasen employees are Syndicate agents with hidden memories that may be activated at a moment's notice, so it's possible that these agents might not even know their positions."
	
/datum/game_mode/traitor/agent/generate_credit_text()
	var/list/round_credits = list()
	var/len_before_addition

	round_credits += "<center><h1>The [syndicate_name()] Spies:</h1>"
	len_before_addition = round_credits.len
	for(var/datum/mind/M in agents)
		var/datum/antagonist/agent/cling = M.has_antag_datum(/datum/antagonist/agent)
		if(cling)
			round_credits += "<center><h2>[M.name] as a combine undercover agent</h2>"
	for(var/datum/mind/traitor in traitors)
		round_credits += "<center><h2>[traitor.name] as a [syndicate_name()] traitor</h2>"
	if(len_before_addition == round_credits.len)
		round_credits += list("<center><h2>Uh oh, we lost track of the shape shifters!</h2>", "<center><h2>Nobody move!</h2>")
	round_credits += "<br>"

	round_credits += ..()
	return round_credits 
