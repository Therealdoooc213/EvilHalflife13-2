/obj/machinery/combine_recharger
	name = "combine recharger"
	desc = "A wall mounted recharger unit which can refill the battery capacity of combine suits. It slowly restores power over time."
	icon = 'icons/obj/halflife/machinery.dmi'
	icon_state = "suitcharger"
	var/capacity = 100
	var/capacity_max = 100

/obj/machinery/combine_recharger/proc/adjust_capacity(change)
	capacity += change
	if(capacity > capacity_max)
		capacity = capacity_max
	if(capacity < 0)
		capacity = 0

/obj/machinery/combine_recharger/process(delta_time)
	if(capacity < capacity_max)
		capacity++

/obj/machinery/combine_recharger/examine(mob/user)
	. = ..()
	. += span_notice("It's capacity is at '[(capacity/capacity_max)*100]%'.")

/obj/machinery/combine_recharger/interact(mob/living/carbon/human/H)
	. = ..()
	if(.)
		return
	if (H.w_uniform)
		if(H.w_uniform.powered_suit)
			if(H.w_uniform.suit_power < H.w_uniform.max_suit_power && capacity > 19)
				H.w_uniform.adjust_suitpower(20)
				adjust_capacity(-20)
				playsound(src, 'sound/effects/suitchargeok1.ogg', 40, FALSE)
			else
				playsound(src, 'sound/effects/suitchargeno1.ogg', 40, FALSE)
		else
			to_chat(H, span_warning("You do not have a compatible suit for recharging."))
			playsound(src, 'sound/effects/suitchargeno1.ogg', 40, FALSE)
	return
