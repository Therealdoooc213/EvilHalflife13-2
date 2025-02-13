//Biosuit complete with shoes (in the item sprite)
/obj/item/clothing/head/bio_hood
	name = "bio hood"
	icon_state = "bio"
	desc = "A hood that protects the head and face from biological contaminants."
	clothing_flags = THICKMATERIAL | BLOCK_GAS_SMOKE_EFFECT | HEADINTERNALS
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 100, RAD = 80, FIRE = 30, ACID = 100)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR|HIDEFACE
	resistance_flags = ACID_PROOF
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	hattable = FALSE

/obj/item/clothing/suit/bio_suit
	name = "bio suit"
	desc = "A suit that protects against biological contamination."
	icon_state = "bio"
	item_state = "bio"
	w_class = WEIGHT_CLASS_BULKY
	gas_transfer_coefficient = 0.01
	clothing_flags = THICKMATERIAL
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	slowdown = 0.5
	allowed = list(/obj/item/tank/internals, /obj/item/pen, /obj/item/flashlight/pen, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/autoinjector)
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 100, RAD = 80, FIRE = 30, ACID = 100)
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	strip_delay = 70
	equip_delay_other = 70
	resistance_flags = ACID_PROOF
	mutantrace_variation = DIGITIGRADE_VARIATION

//Standard biosuit, orange stripe
/obj/item/clothing/head/bio_hood/general
	icon_state = "bio_general"

/obj/item/clothing/suit/bio_suit/general
	icon_state = "bio_general"


//Virology biosuit, green stripe
/obj/item/clothing/head/bio_hood/virology
	icon_state = "bio_virology"

/obj/item/clothing/suit/bio_suit/virology
	icon_state = "bio_virology"


//Security biosuit, grey with red stripe across the chest
/obj/item/clothing/head/bio_hood/security
	armor = list(MELEE = 25, BULLET = 15, LASER = 25, ENERGY = 10, BOMB = 25, BIO = 100, RAD = 80, FIRE = 30, ACID = 100)
	icon_state = "bio_security"

/obj/item/clothing/suit/bio_suit/security
	armor = list(MELEE = 25, BULLET = 15, LASER = 25, ENERGY = 10, BOMB = 25, BIO = 100, RAD = 80, FIRE = 30, ACID = 100)
	icon_state = "bio_security"


//Janitor's biosuit, grey with purple arms
/obj/item/clothing/head/bio_hood/janitor
	icon_state = "bio_janitor"

/obj/item/clothing/suit/bio_suit/janitor
	icon_state = "bio_janitor"
	allowed = list(/obj/item/storage/bag/trash)

//Scientist's biosuit, white with a pink-ish hue
/obj/item/clothing/head/bio_hood/scientist
	icon_state = "bio_scientist"

/obj/item/clothing/suit/bio_suit/scientist
	icon_state = "bio_scientist"


//CMO's biosuit, blue stripe
/obj/item/clothing/suit/bio_suit/cmo
	icon_state = "bio_cmo"

/obj/item/clothing/head/bio_hood/cmo
	icon_state = "bio_cmo"

//Siggraph boiler bio suit
/obj/item/clothing/suit/bio_suit/boiler
	icon_state = "bio_boiler"
	slowdown = 0

/obj/item/clothing/head/bio_hood/boiler
	icon_state = "bio_boiler"

//Plague Dr mask can be found in clothing/masks/gasmask.dm
/obj/item/clothing/suit/bio_suit/plaguedoctorsuit
	name = "plague doctor suit"
	desc = "It protected doctors from the Black Death, back then. You bet your arse it's gonna help you against viruses."
	icon_state = "plaguedoctor"
	item_state = "bio_suit"
	strip_delay = 40
	equip_delay_other = 20
	mutantrace_variation = NONE
