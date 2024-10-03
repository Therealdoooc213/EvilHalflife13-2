/datum/bounty/item/botany
	reward = 200
	var/datum/bounty/item/botany/multiplier = 0 //adds bonus reward money; increased for higher tier or rare mutations
	var/datum/bounty/item/botany/bonus_desc //for adding extra flavor text to bounty descriptions
	var/datum/bounty/item/botany/foodtype = "meal" //same here

/datum/bounty/item/botany/New()
	..()
	description = "Wallace Breen's head chef is looking to prepare a fine [foodtype] with [name]. [bonus_desc]"
	reward += multiplier * 25
	required_count = rand(5, 10)


/datum/bounty/item/botany/wheat
	name = "Wheat Grains"
	wanted_types = list(/obj/item/reagent_containers/food/snacks/grown/wheat)

/datum/bounty/item/botany/citrus_lime
	name = "Limes"
	wanted_types = list(/obj/item/reagent_containers/food/snacks/grown/citrus/lime)
	foodtype = "sorbet"

/datum/bounty/item/botany/citrus_lemon
	name = "Lemons"
	wanted_types = list(/obj/item/reagent_containers/food/snacks/grown/citrus/lemon)
	foodtype = "sorbet"

/datum/bounty/item/botany/citrus_oranges
	name = "Oranges"
	wanted_types = list(/obj/item/reagent_containers/food/snacks/grown/citrus/orange)
	bonus_desc = "Do not ship lemons or limes." //I vanted orahnge!
	foodtype = "sorbet"

/datum/bounty/item/botany/corn
	name = "Corn"
	wanted_types = list(/obj/item/reagent_containers/food/snacks/grown/corn)
	foodtype = "chowder"

/datum/bounty/item/botany/cucumber
	name = "Cucumbers"
	wanted_types = list(/obj/item/reagent_containers/food/snacks/grown/cucumber)
