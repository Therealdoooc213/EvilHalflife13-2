//works similar to the experiment machine (experiment.dm) except it just holds more and more prisoners

/obj/machinery/fugitive_capture
	name = "combine fugitive capture machine"
	desc = "Much, MUCH bigger on the inside to transport prisoners safely. Only used for fugitives marked by Overwatch, you can't put any anticitizens in here you've marked over the course of the shift."
	icon = 'icons/obj/machines/research.dmi'
	icon_state = "bluespace-prison"
	density = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF //ha ha no getting out!!

/obj/machinery/fugitive_capture/examine(mob/user)
	. = ..()
	. += span_notice("Add a prisoner by dragging them into the machine.")

/obj/machinery/fugitive_capture/MouseDrop_T(mob/target, mob/user)
	var/mob/living/fugitive_hunter = user
	if(!isliving(fugitive_hunter))
		return
	if(fugitive_hunter.stat || (!(fugitive_hunter.mobility_flags & MOBILITY_STAND) || !(fugitive_hunter.mobility_flags & MOBILITY_UI)) || !Adjacent(fugitive_hunter) || !target.Adjacent(fugitive_hunter) || !ishuman(target))
		return
	var/mob/living/carbon/human/fugitive = target
	var/datum/antagonist/fugitive/fug_antag = fugitive.mind.has_antag_datum(/datum/antagonist/fugitive)
	if(!fug_antag)
		to_chat(fugitive_hunter, span_warning("This is not a globally wanted fugitive!"))
		return
	if(do_after(fugitive_hunter, 5 SECONDS, fugitive))
		add_prisoner(fugitive, fug_antag)

/obj/machinery/fugitive_capture/proc/add_prisoner(mob/living/carbon/human/fugitive, datum/antagonist/fugitive/antag)
	fugitive.forceMove(src)
	antag.is_captured = TRUE
	to_chat(fugitive, span_userdanger("You are thrown into a vast void of space, and as you fall further into oblivion the comparatively small entrance to reality gets smaller and smaller until you cannot see it anymore. You have failed to avoid capture."))
	fugitive.ghostize(TRUE) //so they cannot suicide, round end stuff.
	SSsociostability.modifystability(20) //Returns the sociostability a fugitive took when they spawned

/obj/machinery/computer/shuttle/hunter
	name = "shuttle console"
	shuttleId = "huntership"
	possible_destinations = "huntership_away;huntership_home;huntership_custom"

/obj/machinery/computer/camera_advanced/shuttle_docker/syndicate/hunter
	name = "shuttle navigation computer"
	desc = "Used to designate a precise transit location to travel to."
	shuttleId = "huntership"
	lock_override = CAMERA_LOCK_STATION
	shuttlePortId = "huntership_custom"
	see_hidden = FALSE
