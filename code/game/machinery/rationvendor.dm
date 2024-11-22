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
	var/ration_quality = 3 //1 is terrible, 2 is lowgrade, 3 is standard, 4 is loyalty, 5 is great
	var/vortigaunt = FALSE //are they a vortigaunt role?

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
		say("Warning, an account is not detected on your ID card. Contact a local protection team member immediately.")
		playsound(src, 'sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return
	if(!account.ration_voucher)
		say("You do not have a usable ration voucher in your account.")
		playsound(src, 'sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
		return

	if(!do_after(user, 3 SECONDS, src))
		to_chat(usr, span_warning("Don't move while the machine is dispensing your ration!"))
		return

	var/username = user.get_face_name(user.get_id_name())
	var/datum/data/record/R = find_record("name", username, GLOB.data_core.security)
	if(R)
		if((R.fields["criminal"] == WANTED_ANTICITIZEN))
			say("Warning, your civil status is in question by local protection teams. Please apply.")
			playsound(src, 'sound/machines/combine_button_locked.ogg', 50, TRUE, extrarange = -3)
			return
		if((R.fields["criminal"] == WANTED_LOYALIST)) //Loyalists get high grade rations
			ration_quality++
		if((R.fields["criminal"] == WANTED_SUSPECT)) //Suspected people are given shit rations
			ration_quality--
	if(account?.account_job?.paycheck_department == ACCOUNT_SEC) //Metrocops and command staff get higher grade rations.
		ration_quality++
	if(account?.account_job.title == "Vortigaunt Slave") //Vortigaunt slaves get shitty rations
		vortigaunt = TRUE
		ration_quality--
	account.ration_voucher = FALSE
	dispense(ration_quality, vortigaunt)
	return

/obj/machinery/ration_vendor/proc/dispense(quality, vortigaunt)
	if(vortigaunt)
		say("Here is your designated meal, biotic.")
	else
		say("Enjoy your designated meal.")

	playsound(src, 'sound/machines/machine_vend.ogg', 50, TRUE, extrarange = -3)

	switch(quality)
		if(0 to 1)
			new /obj/item/storage/box/halflife/badration(loc)
		if(2)
			new /obj/item/storage/box/halflife/badration(loc)
		if(3)
			new /obj/item/storage/box/halflife/ration(loc)
		if(4)
			new /obj/item/storage/box/halflife/loyaltyration(loc)
		if(5 to 10)
			new /obj/item/storage/box/halflife/loyaltyration(loc)
