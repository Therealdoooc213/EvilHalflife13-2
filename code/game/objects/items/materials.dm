/obj/item/circuitmaterial
	name = "Circuit Chip"
	desc = "A circuit chip for building electronics with."
	custom_price = 5
	item_state = "electronic"
	icon = 'icons/obj/module.dmi'
	icon_state = "door_electronics"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	flags_1 = CONDUCT_1
	w_class = WEIGHT_CLASS_SMALL
	materials = list(/datum/material/iron=50, /datum/material/glass=50)
	grind_results = list(/datum/reagent/iron = 10, /datum/reagent/silicon = 10)

/obj/item/circuitmaterial/motherboard
	name = "Motherboard"
	desc = "An important electronic piece for machines."
	custom_price = 10
	icon_state = "airalarm_electronics"

/obj/item/machinepiece
	icon = 'icons/obj/halflife/machines.dmi'

/obj/item/machinepiece/viscerator
	name = "Viscerator Frame"
	desc = "A framework for a Viscerator bot. You'll have to craft it into a functioning one."
	icon_state = "viscerator"
	w_class = WEIGHT_CLASS_SMALL
	materials = list(/datum/material/iron=4000, /datum/material/glass=4000)

/obj/item/machinepiece/scanner
	name = "Scanner Frame"
	desc = "A framework for a Scanner bot. You'll have to craft it into a functioning one."
	icon_state = "cityscannerframe"
	w_class = WEIGHT_CLASS_NORMAL
	materials = list(/datum/material/iron=12000, /datum/material/glass=4000)
