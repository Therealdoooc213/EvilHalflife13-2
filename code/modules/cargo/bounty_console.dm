#define PRINTER_TIMEOUT 10

/obj/machinery/computer/bounty
	name = "\improper Combine bounty console"
	desc = "Used to check and claim bounties offered by Overwatch."
	icon_state = "med_console"
	icon_keyboard = null
	icon_screen = null
	req_one_access = list(ACCESS_SECURITY, ACCESS_DETECTIVE)
	circuit = /obj/item/circuitboard/computer/bounty
	light_color = "#E2853D"//orange
	var/printer_ready = 0 //cooldown var
	var/static/datum/bank_account/cargocash

/obj/machinery/computer/bounty/Initialize(mapload)
	. = ..()
	printer_ready = world.time + PRINTER_TIMEOUT
	cargocash = SSeconomy.get_dep_account(ACCOUNT_CAR)

/obj/machinery/computer/bounty/proc/print_paper()
	new /obj/item/paper/bounty_printout(loc)

/obj/item/paper/bounty_printout
	name = "paper - Bounties"

/obj/item/paper/bounty_printout/Initialize(mapload)
	. = ..()
	info = "<h2>Overwatch Cargo Bounties</h2></br>"
	update_appearance(UPDATE_ICON)
	for(var/datum/bounty/B in GLOB.bounties_list)
		if(B.claimed)
			continue
		info += {"<h3>[B.name]</h3>
		<ul><li>Reward: [B.reward_string()]</li>
		<li>Completed: [B.completion_string()]</li></ul>"}

/obj/machinery/computer/bounty/proc/get_list_to_use()
	return GLOB.bounties_list

/obj/machinery/computer/bounty/ui_interact(mob/user, datum/tgui/ui)
	var/list/list_to_use = get_list_to_use()
	if(!list_to_use.len)
		setup_bounties()
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "CargoBountyConsole", name)
		ui.open()

/obj/machinery/computer/bounty/ui_data(mob/user)
	var/list/data = list()
	var/list/bountyinfo = list()
	for(var/datum/bounty/B in get_list_to_use())
		bountyinfo += list(list("name" = B.name, "description" = B.description, "reward_string" = B.reward_string(), "completion_string" = B.completion_string() , "claimed" = B.claimed, "can_claim" = B.can_claim(), "priority" = B.high_priority, "bounty_ref" = REF(B)))
	data["stored_cash"] = cargocash.account_balance
	data["bountydata"] = bountyinfo
	return data

/obj/machinery/computer/bounty/ui_act(action,params)
	if(..())
		return
	switch(action)
		if("ClaimBounty")
			var/datum/bounty/cashmoney = locate(params["bounty"]) in get_list_to_use()
			if(cashmoney)
				cashmoney.claim(usr)
			return TRUE
		if("Print")
			if(printer_ready < world.time)
				printer_ready = world.time + PRINTER_TIMEOUT
				print_paper()
				return
