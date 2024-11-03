/datum/outfit/rebel
	name = "Rebel"

	uniform = /obj/item/clothing/under/citizen/rebel
	accessory = /obj/item/clothing/accessory/armband/rebel
	suit = /obj/item/clothing/suit/armor/civilprotection
	head = /obj/item/clothing/head/beanie/black
	shoes = /obj/item/clothing/shoes/brownboots
	gloves = /obj/item/clothing/gloves/fingerless

	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp
	belt = /obj/item/storage/belt/civilprotection

	back = /obj/item/storage/backpack/satchel

	l_pocket = /obj/item/flashlight/seclite
	r_pocket = /obj/item/reagent_containers/pill/patch/medkit

/datum/outfit/rebel/pre_equip(mob/living/carbon/human/H)
	H.cmode_music = 'sound/music/combat/vortalcombat.ogg'

/datum/outfit/rebel/uplink
	var/tc = 15
	var/uplink_type = /obj/item/uplink/nuclear

/datum/outfit/rebel/uplink/post_equip(mob/living/carbon/human/H)
	if(ispath(uplink_type, /obj/item/uplink/nuclear) || tc) // /obj/item/uplink/nuclear understands 0 tc
		var/obj/item/U = new uplink_type(H, H.key, tc)
		H.equip_to_slot_or_del(U, ITEM_SLOT_BACKPACK)
