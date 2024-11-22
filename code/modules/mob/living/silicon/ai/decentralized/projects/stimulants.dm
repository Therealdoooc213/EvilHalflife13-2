/datum/ai_project/stimulant_injection
	name = "Remote Stimulant Activation"
	description = "This ability will allow you to inject a dose of stimulants into a unit with a powered suit on."
	research_cost = 500
	ram_required = 0
	
	can_be_run = FALSE
	ability_path = /datum/action/innate/ai/ranged/stimulant_injection
	ability_recharge_cost = 300

/datum/ai_project/stimulant_injection/finish()
	add_ability(ability_path)

/datum/action/innate/ai/ranged/stimulant_injection
	name = "Remote Stimulant Activation"
	desc = "Remotely activate stimulants in someone wearing a charged combine suit, healing them slightly while making them less tired."
	button_icon_state = "electrified"
	uses = 1
	delete_on_empty = FALSE
	enable_text = span_notice("You prepare to remotely activate stimulants. Click a human wearing a charged combine suit.")
	disable_text = span_notice("You disable injection protocols.")

/datum/action/innate/ai/ranged/stimulant_injection/do_ability(mob/living/caller, params, atom/clicked_on)
	if(!istype(clicked_on, /mob/living/carbon/human))
		to_chat(owner, span_warning("You can only use this on humans!"))
		return FALSE
	var/mob/living/carbon/human/H = clicked_on

	if (H.w_uniform)
		if(H.w_uniform.powered_suit && H.w_uniform.suit_power > 0)
			unset_ranged_ability(owner)
			adjust_uses(-1)
			H.reagents.add_reagent(/datum/reagent/drug/caffeine, 5)
			H.reagents.add_reagent(/datum/reagent/medicine/tricordrazine, 3)
			H.adjust_tiredness(-60)
			to_chat(owner, span_notice("You succesfully inject stimulants into [H]."))
			to_chat(H, span_notice("Attention unit, Anti-Fatigue Rations are now at 3mg."))
		else
			to_chat(owner, span_warning("Their suit is not able to inject stimulants!"))
			return FALSE
	else
		to_chat(owner, span_warning("They are not wearing a suit!"))
		return FALSE

