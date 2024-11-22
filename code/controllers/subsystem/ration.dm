SUBSYSTEM_DEF(ration)
	name = "Rations"
	wait = 30 MINUTES
	init_order = INIT_ORDER_RATION
	runlevels = RUNLEVEL_GAME
	flags = SS_NO_INIT

/datum/controller/subsystem/ration/fire(resumed = 0)
	sleep(20 SECONDS) //Incase you join slightly after roundstart, and so it doesnt conflict with starting message.
	priority_announce("Attention citizens, a new ration cycle has begun. Redeem your accounts voucher at an applicable vending unit.", "Ration Cycle Notice.")
	for(var/A in SSeconomy.bank_accounts)
		var/datum/bank_account/B = SSeconomy.bank_accounts[A]
		B.rationvoucher()	

