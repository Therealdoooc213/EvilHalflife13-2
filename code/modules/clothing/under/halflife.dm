#define STIMULANT_INJECTION_DELAY (60 SECONDS)

/obj/item/clothing/under/combine
	armor = list(MELEE = 15, BULLET = 15, LASER = 20,ENERGY = 20, BOMB = 20, BIO = 20, RAD = 20, FIRE = 30, ACID = 30, WOUND = 5)
	max_integrity = 250
	strip_delay = 50
	can_adjust = FALSE
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE
	worn_icon = 'icons/mob/clothing/uniform/halflife.dmi'

	powered_suit = TRUE
	suit_power = 50
	max_suit_power = 100
	unpoweredslowdown = 0.25

	var/mob/living/carbon/owner

	COOLDOWN_DECLARE(next_damage_notify)
	COOLDOWN_DECLARE(next_stimulant)

	var/static/list/funny_signals = list(
		COMSIG_CARBON_GAIN_WOUND = PROC_REF(handle_wound_add),
		COMSIG_MOB_APPLY_DAMAGE = PROC_REF(handle_damage)
	)

/obj/item/clothing/under/combine/equipped(mob/M, slot)
	. = ..()
	if(slot == ITEM_SLOT_ICLOTHING && iscarbon(M))
		for(var/k in funny_signals)
			RegisterSignal(M, k, funny_signals[k])
		owner = M
	else
		for(var/k in funny_signals)
			UnregisterSignal(M, k)

/obj/item/clothing/under/combine/Destroy()
	owner = null
	return ..()

/obj/item/clothing/under/combine/dropped(mob/M)
	. = ..()
	for(var/k in funny_signals)
		UnregisterSignal(M, k)

//Wounds
/obj/item/clothing/under/combine/proc/handle_wound_add(mob/living/carbon/C, datum/wound/W, obj/item/bodypart/L)

	SIGNAL_HANDLER

	if(W.severity >= WOUND_SEVERITY_MODERATE)
		administer_stimulant()

/obj/item/clothing/under/combine/proc/administer_stimulant()
	SIGNAL_HANDLER
	if(!owner.reagents)
		return
	if(!COOLDOWN_FINISHED(src, next_stimulant))
		return

	if(suit_power > 20)
		adjust_suitpower(80, TRUE)
		to_chat(owner, span_warning("Suit detects extreme user damage. Administering Class A-3 Stimulant Medication Supplements."))
		owner.reagents.add_reagent(/datum/reagent/medicine/morphine, 2)
		owner.reagents.add_reagent(/datum/reagent/medicine/tricordrazine, 4)
	else
		to_chat(owner, span_warning("Suit power insufficient to administer stimulants."))

	COOLDOWN_START(src, next_stimulant, STIMULANT_INJECTION_DELAY)
	return TRUE

//General Damage
/obj/item/clothing/under/combine/proc/handle_damage(mob/living/carbon/C, damage, damagetype, def_zone)
	SIGNAL_HANDLER

	if(!COOLDOWN_FINISHED(src, next_damage_notify))
		return

	if(damage < 5 || owner.maxHealth <= 0)
		return

	var/health_percent = owner.health / owner.maxHealth
	if(health_percent > 0.50 && !prob(damage * 4))
		return

	switch(health_percent)
		if(0.76 to INFINITY)
			return
		else
			COOLDOWN_START(src, next_damage_notify, 30 SECONDS)
			administer_stimulant()

/obj/item/clothing/under/combine/civilprotection
	name = "civil protection jumpsuit"
	desc = "Full-body suit which includes light kevlar weaving to provide extra protection."
	icon_state = "civilprotection"
	item_state = "syndicate-black"
	has_sensor = LOCKED_SENSORS

/obj/item/clothing/under/combine/civilprotection/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/movement/civilprotection/gear1.ogg',\
												'sound/movement/civilprotection/gear2.ogg',\
												'sound/movement/civilprotection/gear3.ogg',\
												'sound/movement/civilprotection/gear4.ogg',\
												'sound/movement/civilprotection/gear5.ogg',\
												'sound/movement/civilprotection/gear6.ogg'), 30, 100, 0)

/obj/item/clothing/under/combine/civilprotection/divisionallead
	name = "divisional lead jumpsuit"
	desc = "A version of the standard civil protection suit with slightly more protection, and red highlights."
	armor = list(MELEE = 20, BULLET = 20, LASER = 25,ENERGY = 25, BOMB = 25, BIO = 30, RAD = 30, FIRE = 30, ACID = 30, WOUND = 5)
	icon_state = "divisionallead"

/obj/item/clothing/under/combine/overwatch
	name = "overwatch jumpsuit"
	desc = "Full-body suit which includes kevlar weaving to provide extra protection."
	icon_state = "overwatch"
	item_state = "syndicate-black"
	has_sensor = LOCKED_SENSORS
	max_integrity = 400
	suit_power = 100
	armor = list(MELEE = 20, BULLET = 20, LASER = 25,ENERGY = 25, BOMB = 25, BIO = 30, RAD = 30, FIRE = 30, ACID = 30, WOUND = 10)

/obj/item/clothing/under/combine/overwatch/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, COMBINESUIT_TRAIT)
	AddComponent(/datum/component/squeak, list('sound/movement/overwatch/gear1.ogg',\
												'sound/movement/overwatch/gear2.ogg',\
												'sound/movement/overwatch/gear3.ogg',\
												'sound/movement/overwatch/gear4.ogg',\
												'sound/movement/overwatch/gear5.ogg',\
												'sound/movement/overwatch/gear6.ogg'), 30, 100, 0)


/obj/item/clothing/under/combine/overwatch/red
	desc = "Red full-body suit which includes kevlar weaving to provide extra protection."
	icon_state = "overwatch_red"

/obj/item/clothing/under/combine/overwatch/elite
	name = "overwatch jumpsuit"
	desc = "Full-body reinforced suit which includes kevlar weaving to provide extra protection."
	icon_state = "overwatch_white"
	armor = list(MELEE = 25, BULLET = 25, LASER = 30,ENERGY = 30, BOMB = 30, BIO = 40, RAD = 40, FIRE = 40, ACID = 30, WOUND = 10)

/obj/item/clothing/under/citizen
	name = "citizen jumpsuit"
	desc = "Full-body blue suit for the common citizen. Uses sensors to allow the combine to track you."
	icon_state = "citizenblue"
	item_state = "r_suit"
	can_adjust = FALSE
	has_sensor = LOCKED_SENSORS
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE
	worn_icon = 'icons/mob/clothing/uniform/halflife.dmi'

/obj/item/clothing/under/citizen/refugee
	name = "refugee clothes"
	desc = "Jeans and a t-shirt, free of any suit sensors the combine may use to track you."
	icon_state = "refugee"
	item_state = "r_suit"
	has_sensor = NO_SENSORS

/obj/item/clothing/under/citizen/rebel
	name = "citizen jumpsuit"
	armor = list(MELEE = 10, BULLET = 10, LASER = 10,ENERGY = 10, BOMB = 10, BIO = 20, RAD = 20, FIRE = 30, ACID = 30, WOUND = 5)
	desc = "Full-body blue suit for the common citizen. The scanners have been removed forcefully, and it has been moderately reinforced."
	icon_state = "rebelblue"
	has_sensor = NO_SENSORS

/obj/item/clothing/under/administrator
	name = "administrator suit"
	desc = "A well made, though aged, burgundy suit. Specially designed for the district administrator."
	worn_icon = 'icons/mob/clothing/uniform/halflife.dmi'
	can_adjust = FALSE
	has_sensor = LOCKED_SENSORS
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE
	icon_state = "heeledsuit"
	item_state = "red_stripe"

/obj/item/clothing/under/administrator/black
	name = "administrator suit"
	worn_icon = 'icons/mob/clothing/uniform/halflife.dmi'
	desc = "A well made black suit, specially designed for the district administrator."
	icon_state = "formal"
	item_state = "lawyer_black"

#undef STIMULANT_INJECTION_DELAY
