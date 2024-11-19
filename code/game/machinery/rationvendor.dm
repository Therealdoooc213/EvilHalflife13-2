/obj/machinery/ration_vendor
	name = "\improper Ration Vendor"
	desc = "A machine that will deliver you a suitable ration depending on your status, and if you have a ration voucher loaded on your account."
	icon_state = "ration_dispenser"
	icon = 'icons/obj/vending.dmi'
	resistance_flags = FIRE_PROOF
	max_integrity = 1500 //Because it is pretty important, and there probably will only be one of them. 
	var/datum/bank_account/account  //person's account.
	var/obj/item/card/id/C //the account of the person using the vendor unit.

/obj/machinery/ration_vendor/interact(mob/living/carbon/human/user)
	. = ..()
	if(.)
		return
	C = user.get_idcard(TRUE)
	if(!istype(C))
		say("No ID card detected.") // No unidentified crew.
		playsound(src, 'sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return
	if(C.registered_account)
		account = C.registered_account
	else
		say("No account detected.")  //No homeless crew.
		playsound(src, 'sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return
	if(!account.ration_voucher)
		say("You do not have a usable ration voucher in your account.")
		playsound(src, 'sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return

	var/username = user.get_face_name(user.get_id_name())
	var/datum/data/record/R = find_record("name", username, GLOB.data_core.security)
	if(R)
		if((R.fields["criminal"] == WANTED_ANTICITIZEN))
			say("Warning, your civil status is in question by local protection teams. Please apply.")
			playsound(src, 'sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
			return
		if((R.fields["criminal"] == WANTED_LOYALIST)) //Loyalists get high grade rations
			account.ration_voucher = FALSE
			say("Enjoy your designated meal.")
			new /obj/item/storage/box/halflife/loyaltyration(loc)
			playsound(src, 'sound/machines/machine_vend.ogg', 50, TRUE, extrarange = -3)
			return
		if((R.fields["criminal"] == WANTED_SUSPECT)) //Suspected people are given shit rations
			account.ration_voucher = FALSE
			say("Enjoy your designated meal.")
			new /obj/item/storage/box/halflife/badration(loc)
			playsound(src, 'sound/machines/machine_vend.ogg', 50, TRUE, extrarange = -3)
			return
	if(account?.account_job?.paycheck_department == ACCOUNT_SEC) //Metrocops and command staff get high grade rations.
		account.ration_voucher = FALSE
		say("Enjoy your designated meal.")
		new /obj/item/storage/box/halflife/loyaltyration(loc)
		playsound(src, 'sound/machines/machine_vend.ogg', 50, TRUE, extrarange = -3)
		return
	if(account?.account_job.title == "Vortigaunt Slave") //Vortigaunt slaves get shitty rations
		account.ration_voucher = FALSE
		say("Here is your designated meal, biotic.")
		new /obj/item/storage/box/halflife/badration(loc)
		playsound(src, 'sound/machines/machine_vend.ogg', 50, TRUE, extrarange = -3)
		return
	account.ration_voucher = FALSE
	say("Enjoy your designated meal.")
	new /obj/item/storage/box/halflife/ration(loc)
	playsound(src, 'sound/machines/machine_vend.ogg', 50, TRUE, extrarange = -3)
	return
