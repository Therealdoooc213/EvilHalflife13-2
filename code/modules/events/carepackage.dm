//Care packages are an 'event', but only trigger based on sociostability conditions.
/datum/round_event_control/care_package
	name = "Rebel Care Package"
	typepath = /datum/round_event/care_package
	weight = 0
	min_players = 2
	earliest_start = 10 MINUTES
	max_occurrences = 0
	max_alert = SEC_LEVEL_DELTA

/datum/round_event/care_package/start()
	var/list/possible_spawns = list()
	for(var/obj/effect/landmark/carepackage/C in GLOB.landmarks_list)
		possible_spawns += C
	if(!possible_spawns.len)
		message_admins("No valid spawn locations found, aborting...")
		return MAP_ERROR
	var/turf/landing_turf = pick(possible_spawns)
	new /obj/item/storage/box/syndicate/care_package(landing_turf.loc)

	for(var/datum/mind/T in  SSticker.mode.traitors)
		if(!T || !T.current)
			continue
		if(isliving(T.current) && T.current.stat != DEAD)
			to_chat(T, span_warning("The district's sociostability has deteoriated enough for outside rebels to sneak in a care package to somewhere hidden in the sewers. Find and claim it before someone else does. You'll recognise it by being a small box with a red label."))
			T.current.playsound_local(get_turf(T.current), 'sound/effects/griffin_10.ogg',40,0) //little beeping sound to get your attention

/obj/item/storage/box/syndicate/care_package
	icon_state = "syndiebox"
	illustration = "writing_syndie"

/obj/item/storage/box/syndicate/care_package/PopulateContents()
	var/list/item_list = list(
		/obj/item/card/emag/halflife,
		/obj/item/reagent_containers/pill/patch/medkit/vial,
		/obj/item/storage/box/halflife/ration,
		/obj/item/storage/backpack/satchel/flat,
		/obj/item/lockpick,
		/obj/item/grenade/syndieminibomb/bouncer,
		/obj/item/ammo_box/magazine/usp9mm,
		/obj/item/clothing/under/citizen/rebel,
		/obj/item/gun/ballistic/bow/crossbow/rebar,
		/obj/item/gun/ballistic/revolver/derringer,
		/obj/item/kitchen/knife/combat,
		/obj/item/stack/telecrystal,
		/obj/item/stack/telecrystal/five,
		/obj/item/clothing/suit/armor/civilprotection,
		/obj/item/clothing/suit/armor/browncoat,
		/obj/item/reagent_containers/pill/cyanide
	)

	var/obj/item1 = pick_n_take(item_list)
	var/obj/item2 = pick_n_take(item_list)
	var/obj/item3 = pick_n_take(item_list)

	// Create three, non repeat items from the list.
	new item1(src)
	new item2(src)
	new item3(src)
