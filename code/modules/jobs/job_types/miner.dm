/datum/job/mining
	title = "Shaft Miner"
	description = "Travel underground to the mines. Bring ores back to the factory for processing, loot underground regions."
	orbit_icon = "digging"
	department_head = list("Labor Union")
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the foreman and labor lead"

	ration_bonus = 1

	outfit = /datum/outfit/job/miner

	paycheck_department = ACCOUNT_CAR

	paycheck = PAYCHECK_EASY
	display_order = JOB_DISPLAY_ORDER_SHAFT_MINER
	minimal_character_age = 18 //Young and fresh bodies for a high mortality job, what more could you ask for

	departments_list = list(
		/datum/job_department/cargo,
	)

	smells_like = "ash and dust"

/datum/outfit/job/miner
	name = "Shaft Miner"
	jobtype = /datum/job/mining

	uniform = /obj/item/clothing/under/citizen
	head = /obj/item/clothing/head/hardhat
	r_pocket = /obj/item/hl2key/factory
