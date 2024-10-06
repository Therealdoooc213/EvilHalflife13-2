/obj/machinery/vending/miningvendor
	name = "\improper Miner Vendor"
	desc = "Acquire useful mining tools and equipment here."
	icon_state = "mining"
	panel_type = "panel2"
	product_ads = "Acquire high grade equipment here.;Improve your work efficiency.;Better serve the combine!;Quit being useless."
	products = list(/obj/item/storage/box/halflife/loyaltyration = 5, /obj/item/reagent_containers/pill/patch/medkit = 5)
	premium = list(/obj/item/storage/backpack/satchel/explorer = 3, /obj/item/pickaxe/silver = 3, /obj/item/flashlight/seclite = 3)
	resistance_flags = FIRE_PROOF
	refill_canister = /obj/item/vending_refill/miner
	max_integrity = 500 //reinforced
	default_price = 40
	extra_price = 80
	payment_department = NO_FREEBIES

/obj/item/vending_refill/miner
	machine_name = "Miner Vendor"
	icon_state = "refill_cola"
