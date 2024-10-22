#define HIJACK_ZOMBIE 1
#define XEN 2
#define DEPARTMENT_RESUPPLY 3
#define RATION_DELIVERY 4


/datum/round_event_control/shuttle_loan
	name = "Shuttle Loan"
	typepath = /datum/round_event/shuttle_loan
	max occurrences = 1
	earliest_start = 7 MINUTES
	max_alert = SEC_LEVEL_DELTA

/datum/round_event/shuttle_loan
	announceWhen = 1
	endWhen = 500
	var/dispatched = 0
	var/dispatch_type = 0
	var/bonus_points = 1750
	var/thanks_msg = "The cargo dropship will return in five minutes. A credit stipend has been transferred to your supply department."

/datum/round_event/shuttle_loan/setup()
	dispatch_type = pick(HIJACK_ZOMBIE, DEPARTMENT_RESUPPLY, XEN, RATION_DELIVERY)

/datum/round_event/shuttle_loan/announce(fake)
	SSshuttle.shuttle_loan = src
	switch(dispatch_type)
		if(HIJACK_ZOMBIE)
			priority_announce("Cargo: A necrotic infestation has recently taken over a spare dropship. Allow it's transfer to your district and clear it for a stipend reward.","Airwatch")
		if(DEPARTMENT_RESUPPLY)
			priority_announce("Cargo: Additional resources have been allocated to your district and may be claimed by accepting a transfer at your cargo dropship.","Airwatch")
			thanks_msg = "The cargo shuttle should return in 5 minutes."
			bonus_points = 0
		if(XEN)
			priority_announce("Cargo: A severe xenian infestation has recently taken over a spare dropship. Allow it's transfer to your district and clear it for a stipend reward.","Airwatch")
			bonus_points = 2000
		if(RATION_DELIVERY)
			priority_announce("Cargo: A neighboring district has accidentally delivered their rations to you. A return is not mandatory.", "Airwatch")
			thanks_msg = "The cargo shuttle should return in 5 minutes."
			bonus_points = 0

/datum/round_event/shuttle_loan/proc/loan_shuttle()
	priority_announce(thanks_msg, "Cargo shuttle commandeered by Airwatch.")

	dispatched = 1
	var/datum/bank_account/D = SSeconomy.get_dep_account(ACCOUNT_CAR)
	if(D)
		D.adjust_money(bonus_points)
	endWhen = activeFor + 1

	SSshuttle.supply.mode = SHUTTLE_CALL
	SSshuttle.supply.destination = SSshuttle.getDock("supply_home")
	SSshuttle.supply.setTimer(3000)

	switch(dispatch_type)
		if(HIJACK_ZOMBIE)
			SSshuttle.centcom_message += "Necrotics incoming."
		if(DEPARTMENT_RESUPPLY)
			SSshuttle.centcom_message += "Department resupply incoming."
		if(XEN)
			SSshuttle.centcom_message += "Xenian Infestation incoming."
		if(RATION_DELIVERY)
			SSshuttle.centcom_message += "Ration delivery for [station_name()]"

/datum/round_event/shuttle_loan/tick()
	if(dispatched)
		if(SSshuttle.supply.mode != SHUTTLE_IDLE)
			endWhen = activeFor
		else
			endWhen = activeFor + 1

/datum/round_event/shuttle_loan/end()
	if(SSshuttle.shuttle_loan && SSshuttle.shuttle_loan.dispatched)
		//make sure the shuttle was dispatched in time
		SSshuttle.shuttle_loan = null

		var/list/empty_shuttle_turfs = list()
		var/list/area/shuttle/shuttle_areas = SSshuttle.supply.shuttle_areas
		for(var/place in shuttle_areas)
			var/area/shuttle/shuttle_area = place
			for(var/turf/open/floor/T in shuttle_area)
				if(T.is_blocked_turf())
					continue
				empty_shuttle_turfs += T
		if(!empty_shuttle_turfs.len)
			return

		var/list/shuttle_spawns = list()
		switch(dispatch_type)
			if(HIJACK_ZOMBIE)

				shuttle_spawns.Add(/mob/living/simple_animal/hostile/halflife/zombie)
				shuttle_spawns.Add(/mob/living/simple_animal/hostile/halflife/zombie/fast)
				shuttle_spawns.Add(/mob/living/simple_animal/hostile/halflife/zombie)
				if(prob(50))
					shuttle_spawns.Add(/mob/living/simple_animal/hostile/halflife/zombie/zombine)

			if(XEN)

				shuttle_spawns.Add(/mob/living/simple_animal/hostile/halflife/zombie/fungal)
				shuttle_spawns.Add(/mob/living/simple_animal/hostile/halflife/zombie/fungal)
				shuttle_spawns.Add(/mob/living/simple_animal/hostile/halflife/headcrab)
				shuttle_spawns.Add(/mob/living/simple_animal/hostile/halflife/headcrab/armored)
				shuttle_spawns.Add(/mob/living/simple_animal/hostile/halflife/headcrab/armored)
				if(prob(75))
					shuttle_spawns.Add(/mob/living/simple_animal/hostile/halflife/headcrab)
				if(prob(50))
					shuttle_spawns.Add(/mob/living/simple_animal/hostile/halflife/headcrab)

			if(DEPARTMENT_RESUPPLY)
				var/list/crate_types = list(
					/datum/supply_pack/security/armor,
					/datum/supply_pack/materials/tools,
					/datum/supply_pack/medical/bloodpacks,
					/datum/supply_pack/medical/medvial,
					/datum/supply_pack/organic/rations,
					/datum/supply_pack/misc/water_miner
					)
				for(var/crate in crate_types)
					var/datum/supply_pack/pack = SSshuttle.supply_packs[crate]
					pack.generate(pick_n_take(empty_shuttle_turfs))
				for(var/i in 1 to 5)
					var/decal = pick(/obj/effect/decal/cleanable/food/flour, /obj/effect/decal/cleanable/robot_debris, /obj/effect/decal/cleanable/oil)
					new decal(pick_n_take(empty_shuttle_turfs))
			if(RATION_DELIVERY)
				for(var/i in 1 to 6)
					shuttle_spawns.Add(/obj/item/storage/box/halflife/ration)
	
		var/false_positive = 0
		while(shuttle_spawns.len && empty_shuttle_turfs.len)
			var/turf/T = pick_n_take(empty_shuttle_turfs)
			if(T.contents.len && false_positive < 5)
				false_positive++
				continue

			var/spawn_type = pick_n_take(shuttle_spawns)
			new spawn_type(T)

//items that appear only in shuttle loan events

/obj/item/storage/belt/fannypack/yellow/bee_terrorist/PopulateContents()
	new /obj/item/grenade/plastic/c4 (src)
	new /obj/item/reagent_containers/pill/cyanide(src)
	new /obj/item/grenade/chem_grenade/facid(src)

/obj/item/paper/fluff/bee_objectives
	name = "Objectives of a Bee Liberation Front Operative"
	info = "<b>Objective #1</b>. Liberate all bees on the NT transport vessel 2416/B. <b>Success!</b>  <br><b>Objective #2</b>. Escape alive. <b>Failed.</b>"

/obj/machinery/syndicatebomb/shuttle_loan/Initialize(mapload)
	. = ..()
	setAnchored(TRUE)
	timer_set = rand(480, 600) //once the supply shuttle docks (after 5 minutes travel time), players have between 3-5 minutes to defuse the bomb
	activate()
	update_appearance(UPDATE_ICON)

/obj/item/paper/fluff/cargo/bomb
	name = "hastly scribbled note"
	info = "GOOD LUCK!"

/obj/item/paper/fluff/cargo/bomb/allyourbase
	info = "Somebody set us up the bomb!"

#undef HIJACK_ZOMBIE
#undef XEN
#undef DEPARTMENT_RESUPPLY
#undef RATION_DELIVERY
