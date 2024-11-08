/datum/antagonist/fugitive
	name = "Fugitive"
	roundend_category = "Fugitive"
	silent = TRUE //greet called by the event
	show_in_antagpanel = FALSE
	prevent_roundtype_conversion = FALSE
	antag_hud_name = "fugitive"
	var/datum/team/fugitive/fugitive_team
	var/is_captured = FALSE
	var/backstory = "error"

/datum/antagonist/fugitive/apply_innate_effects(mob/living/mob_override)
	add_team_hud(mob_override || owner.current)

/datum/antagonist/fugitive/on_gain()
	forge_objectives()
	. = ..()

/datum/antagonist/fugitive/proc/forge_objectives() //this isn't the actual survive objective because it's about who in the team survives
	var/datum/objective/survive = new /datum/objective
	survive.owner = owner
	survive.explanation_text = "Avoid capture from the fugitive hunters."
	objectives += survive

/datum/antagonist/fugitive/greet(back_story)
	to_chat(owner, span_boldannounce("You are the Fugitive!"))
	backstory = back_story
	switch(backstory)
		if("vortigaunt")
			to_chat(owner, "<B>We have freed ourselves from the chains that bind, and evaded capture from the oppressors.</B>")
			to_chat(owner, "<B>Free we are, but our journey is yet to conclude. Survival shall be key... More shall hunt us, we must prepare.</B>")
		if("rebel")
			to_chat(owner, "<B>You were with a rebel cell previously in another district, but they were all but wiped out.</B>")
			to_chat(owner, "<B>Barely evading capture, you managed to leave and get to this district.</B>")
			to_chat(owner, "<B>You do not know if they know your identity, but regardless, you must find a way to survive.</B>")
		if("refugees")
			to_chat(owner, "<B>You've barely made it out of your last district, but all is not over.</B>")
			to_chat(owner, "<B>Once again, you're barely slipping under the fingers of the combine, and must struggle to survive.</B>")
			to_chat(owner, "<B>Survive as best you can. Maybe you can get out of here once the populace begins their relocation cycle...</B>")

	to_chat(owner, span_boldannounce("You have escaped another district of the city, but are not free yet. Try to survive and evade capture by any means necessary."))
	owner.announce_objectives()

/datum/antagonist/fugitive/create_team(datum/team/fugitive/new_team)
	if(!new_team)
		for(var/datum/antagonist/fugitive/H in GLOB.antagonists)
			if(!H.owner)
				continue
			if(H.fugitive_team)
				fugitive_team = H.fugitive_team
				return
		fugitive_team = new /datum/team/fugitive
		return
	if(!istype(new_team))
		stack_trace("Wrong team type passed to [type] initialization.")
	fugitive_team = new_team

/datum/antagonist/fugitive/get_team()
	return fugitive_team

/datum/team/fugitive/roundend_report() //shows the number of fugitives, but not if they won in case there is no security
	var/list/fugitives = list()
	for(var/datum/antagonist/fugitive/fugitive_antag in GLOB.antagonists)
		if(!fugitive_antag.owner)
			continue
		fugitives += fugitive_antag
	if(!fugitives.len)
		return

	var/list/result = list()

	result += "<div class='panel redborder'><B>[fugitives.len]</B> [fugitives.len == 1 ? "fugitive" : "fugitives"] took refuge in [station_name()]!"

	for(var/datum/antagonist/fugitive/antag in fugitives)
		if(antag.owner)
			result += "<b>[printplayer(antag.owner)]</b>"

	return result.Join("<br>")

/datum/action/innate/yalpcomms
	name = "Yalp Elor Communion"
	desc = "Allows talking with the brothers of Yalp Elor."
	button_icon = 'icons/mob/actions/actions_cult.dmi'
	button_icon_state = "yalp_comms"
	background_icon_state = "bg_tech"

/datum/action/innate/yalpcomms/Activate()
	var/input = stripped_input(usr, "Input a message to send to your brothers.", "Yalp Elor Communion", "")
	if(!input || !IsAvailable(feedback = FALSE))
		return

	yalp_speech(usr, input)

/datum/action/innate/yalpcomms/proc/yalp_speech(mob/living/user, message)
	if(!message)
		return
	user.whisper(html_decode(message), language = /datum/language/common) // yogs
	var/my_message = span_boldnotice("<b>Brother [findtextEx(user.name, user.real_name) ? user.name : "[user.real_name] (as [user.name])"]:</b> [message]")
	for(var/i in GLOB.player_list)
		var/mob/M = i
		if(isfugitive(M))
			to_chat(M, my_message)
		else if(M in GLOB.dead_mob_list)
			to_chat(M, "[FOLLOW_LINK(M, user)] [my_message]")
	user.log_talk(message, LOG_SAY, tag="Yalp Elor")

