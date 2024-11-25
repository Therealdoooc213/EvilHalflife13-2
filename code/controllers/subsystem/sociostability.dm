SUBSYSTEM_DEF(sociostability)
	name = "Sociostability"
	wait = 3 MINUTES
	init_order = INIT_ORDER_SOCIOSTABILITY
	runlevels = RUNLEVEL_GAME
	var/sociostability = SOCIOSTABILITY_GREAT

/datum/controller/subsystem/sociostability/fire(resumed = 0)
	if(sociostability < SOCIOSTABILITY_GREAT)
		modifystability(SOCIOSTABILITY_PASSIVE_GAIN)


/datum/controller/subsystem/sociostability/proc/modifystability(amount)
	sociostability += amount
	if(sociostability > SOCIOSTABILITY_GREAT)
		sociostability = SOCIOSTABILITY_GREAT
	else if (sociostability < SOCIOSTABILITY_TERRIBLE)
		sociostability = SOCIOSTABILITY_TERRIBLE

///This just gets the amount of sociostability that has been lost in comparison to the max/starting value.
/datum/controller/subsystem/sociostability/proc/getloss()
	var/loss = abs(sociostability - SOCIOSTABILITY_GREAT) //ex: stability is 700. 700-1000 = -300, then absolute value is 300. 300 stability has been lost.
	return loss
