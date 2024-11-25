SUBSYSTEM_DEF(ration)
	name = "Rations"
	wait = 15 MINUTES
	init_order = INIT_ORDER_RATION
	runlevels = RUNLEVEL_GAME
	flags = SS_NO_INIT
	var/cycle_active = FALSE

/datum/controller/subsystem/ration/fire(resumed = 0)
	if(!cycle_active)
		sleep(20 SECONDS) //Incase you join slightly after roundstart, and so it doesnt conflict with starting message.
		priority_announce("Attention citizens, a new ration cycle has begun. Applicable vending units will be able to accept your ration voucher until the cycle ends.", "Ration Cycle Notice.")
		cycle_active = TRUE
		for(var/A in SSeconomy.bank_accounts)
			var/datum/bank_account/B = SSeconomy.bank_accounts[A]
			B.rationvoucher()	
	else
		priority_announce("Attention citizens, the previous ration cycle has ended and vending units have now closed.", "Ration Cycle Notice.")
		cycle_active = FALSE
