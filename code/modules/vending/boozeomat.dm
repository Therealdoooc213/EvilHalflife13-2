/obj/machinery/vending/boozeomat
	name = "\improper Booze-O-Mat"
	desc = "A vending machine for selling all kinds of alcohol."
	icon_state = "boozeomat"
	icon_deny = "boozeomat-deny"
	panel_type = "panel22"

	products = list(/obj/item/reagent_containers/food/drinks/drinkingglass = 10,
					/obj/item/reagent_containers/food/drinks/drinkingglass/shotglass = 10,
					/obj/item/reagent_containers/food/drinks/flask = 3,
					/obj/item/reagent_containers/food/drinks/ice = 10,
					/obj/item/reagent_containers/food/drinks/bottle/orangejuice = 3,
					/obj/item/reagent_containers/food/drinks/bottle/tomatojuice = 3,
					/obj/item/reagent_containers/food/drinks/bottle/limejuice = 3,
					/obj/item/reagent_containers/food/drinks/bottle/cream = 3,
					/obj/item/reagent_containers/food/drinks/soda_cans/cola = 3,
					/obj/item/reagent_containers/food/drinks/soda_cans/tonic = 3,
					/obj/item/reagent_containers/food/drinks/soda_cans/sodawater = 3,
					/obj/item/reagent_containers/food/drinks/bottle/grenadine = 3,
					/obj/item/reagent_containers/food/drinks/bottle/menthol = 3,
					/obj/item/reagent_containers/food/drinks/ale = 3,
					/obj/item/reagent_containers/food/drinks/beer = 3,
					/obj/item/reagent_containers/food/drinks/beer/stout = 3,
					/obj/item/reagent_containers/food/drinks/bottle/maltliquor = 1,
					/obj/item/reagent_containers/food/drinks/bottle/gin = 1,
		            /obj/item/reagent_containers/food/drinks/bottle/whiskey = 1,
					/obj/item/reagent_containers/food/drinks/bottle/tequila = 1,
					/obj/item/reagent_containers/food/drinks/bottle/vodka = 1,
					/obj/item/reagent_containers/food/drinks/bottle/vermouth = 1,
					/obj/item/reagent_containers/food/drinks/bottle/rum = 1,
					/obj/item/reagent_containers/food/drinks/bottle/wine = 1,
					/obj/item/reagent_containers/food/drinks/bottle/cognac = 1,
					/obj/item/reagent_containers/food/drinks/bottle/kahlua = 1,
					/obj/item/reagent_containers/food/drinks/bottle/hcider = 1,
					/obj/item/reagent_containers/food/drinks/bottle/absinthe = 1,
					/obj/item/reagent_containers/food/drinks/bottle/grappa = 1,
					/obj/item/reagent_containers/food/drinks/bottle/amaretto = 1,
					/obj/item/reagent_containers/food/drinks/bottle/sake = 1,
					/obj/item/reagent_containers/food/drinks/bottle/applejack = 1,
					/obj/item/reagent_containers/food/drinks/bottle = 10,
					/obj/item/reagent_containers/food/drinks/bottle/small = 10,)
	contraband = list(/obj/item/reagent_containers/food/drinks/mug/tea = 3,
					 /obj/item/reagent_containers/food/drinks/bottle/fernet = 1)
	premium = list(/obj/item/reagent_containers/glass/bottle/ethanol = 1,
				   /obj/item/reagent_containers/food/drinks/bottle/champagne = 1,
				   /obj/item/reagent_containers/food/drinks/bottle/trappist = 1)

	product_slogans = "I hope nobody asks me for a bloody cup o' tea...;Alcohol is humanity's friend. Would you abandon a friend?;Quite delighted to serve you!;Is nobody thirsty on this station?"
	product_ads = "Drink up!;Booze is good for you!;Alcohol is humanity's best friend.;Quite delighted to serve you!;Care for a nice, cold beer?;Nothing cures you like booze!;Have a sip!;Have a drink!;Have a beer!;Beer is good for you!;Only the finest alcohol!;Best quality booze since 2053!;Award-winning wine!;Maximum alcohol!;Man loves beer.;A toast for progress!"
	req_access = list(ACCESS_BAR)
	refill_canister = /obj/item/vending_refill/boozeomat
	default_price = 15
	extra_price = 30
	payment_department = NO_FREEBIES
	light_mask = "boozeomat-light-mask"

/obj/machinery/vending/boozeomat/all_access
	desc = "A technological marvel, supposedly able to mix just the mixture you'd like to drink the moment you ask for one. This model appears to have no access restrictions."
	req_access = null

/obj/machinery/vending/boozeomat/syndicate_access
	req_access = list(ACCESS_SYNDICATE)
	age_restrictions = FALSE

/obj/item/vending_refill/boozeomat
	machine_name = "Booze-O-Mat"
	icon_state = "refill_booze"
