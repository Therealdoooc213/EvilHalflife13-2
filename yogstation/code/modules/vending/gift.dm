/obj/machinery/vending/gifts
	name = "\improper Gift Vendor"
	desc = "A vending machine for selling general store goods."
	icon = 'yogstation/icons/obj/vending.dmi'
	icon_state = "gifts"
	icon_deny = "gifts-deny"
	panel_type = "panel-gift"
	req_access = list(ACCESS_CLERK)
	product_slogans = "Stimulate the economy!;Sedate resistive thoughts!;Purchase neat belongings!;Buy, Buy, Buy!"
	vend_reply = "Thank you for using Gift Vendor!"
	products = list(/obj/item/clothing/under/citizen = 3,
					/obj/item/camera_film = 10,
					/obj/item/camera = 3,
					/obj/item/storage/photo_album = 5,
					/obj/item/storage/photobook = 5,
					/obj/item/hourglass = 2,
					/obj/item/soccerball = 2,
					/obj/item/storage/bag/photo = 3,
					/obj/item/instrument/harmonica = 1,
					/obj/item/instrument/piano_synth = 1,
					/obj/item/flashlight = 3,
					/obj/item/clothing/suit/jacket = 3,
					/obj/item/clothing/head/beanie/black = 3,
					/obj/item/clothing/head/flatcap = 3,
					/obj/item/customlock = 2,
					/obj/item/customblank = 2,
					/obj/item/storage/box/halflife/badration = 3,
					/obj/item/clothing/gloves/fingerless = 3)

	contraband = list(/obj/item/lockpick = 1,
	                  /obj/item/clothing/suit/armor/browncoat = 1)

	premium = list(/obj/item/storage/backpack = 3,
				   /obj/item/binoculars = 3,
				   /obj/item/storage/box/halflife/loyaltyration = 3)

	payment_department = NO_FREEBIES
	light_mask = "gifts-light-mask"
	default_price = 20
	extra_price = 40
