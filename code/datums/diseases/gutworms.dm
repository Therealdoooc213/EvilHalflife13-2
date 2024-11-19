/datum/disease/gutworms
	form = "Disease"
	name = "Gut Worms"
	max_stages = 5
	spread_text = "Foodborne"
	spread_flags = DISEASE_SPREAD_NON_CONTAGIOUS
	cure_text = "Spaceacillin, or waiting until it clears up naturally"
	cures = list(/datum/reagent/medicine/spaceacillin)
	agent = "microscopic pathogenic worms"
	viable_mobtypes = list(/mob/living/carbon/human)
	cure_chance = 6
	desc = "A dangerous food-borne parasite that infests raw food and will cause severe stomach issues, but will eventually pass on it's own."
	required_organs = list(/obj/item/organ/stomach)
	severity = DISEASE_SEVERITY_HARMFUL

/datum/disease/gutworms/stage_act()
	..()
	switch(stage)
		if(2)
			if(prob(5))
				to_chat(affected_mob, span_danger("Your stomach rumbles, and a dull ache emanates from your gut."))
			if(prob(5))
				to_chat(affected_mob, span_danger("You feel weak and dizzy..."))
				affected_mob.adjust_confusion(3 SECONDS)
				affected_mob.adjustStaminaLoss(20)
		if(4)
			if(prob(2))
				to_chat(affected_mob, span_userdanger("You feel terrible, as a deep pain appears in your gut."))
				affected_mob.adjust_dizzy(3)
				affected_mob.adjust_confusion(3 SECONDS)
			if(prob(2))
				to_chat(affected_mob, span_danger("Your stomach rumbles violently, prickles of pain emanating from your gut."))
				affected_mob.adjust_nutrition(-15)
		if(5)
			if(prob(10))
				to_chat(affected_mob, span_danger("A deep ache appears in your stomach, as you suddenly hurl!"))
				affected_mob.vomit(20)
			if(prob(5))
				to_chat(affected_mob, span_danger("You feel very weak and dizzy..."))
				affected_mob.adjust_confusion(3 SECONDS)
				affected_mob.adjustStaminaLoss(30)
			if(prob(5))
				to_chat(affected_mob, span_danger("Your stomach rumbles violently, prickles of pain emanating from your gut."))
				affected_mob.adjust_nutrition(-25)
			if(prob(15))
				to_chat(affected_mob, span_danger("You vomit violently, and you can see worms wriggling inside the expulsion! Maybe it's over now..."))
				affected_mob.vomit(20)
				cure()
	return

