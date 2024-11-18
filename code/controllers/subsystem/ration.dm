SUBSYSTEM_DEF(ration)
	name = "Rations"
	wait = 300 MINUTES
	init_order = INIT_ORDER_RATION
	runlevels = RUNLEVEL_GAME
	flags = SS_NO_INIT

	var/list/bank_accounts = list() //List of normal accounts (not department accounts)

/datum/controller/subsystem/ration/fire(resumed = 0)
	for(var/A in bank_accounts)
		var/datum/bank_account/B = bank_accounts[A]
		B.rationvoucher()	
	dispatch_announcement_to_players("Attention Citizens, a new ration cycle has begun. Redeem your account's voucher at an applicable vending unit.", GLOB.player_list)

