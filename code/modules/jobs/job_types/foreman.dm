/datum/job/foreman
	title = "Union Foreman"
	description = "Carry out the orders of the labor lead, keep the factory and mines running, request funding and workers."
	orbit_icon = "sack-dollar"
	department_head = list("Labor Lead")
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the labor lead"

	outfit = /datum/outfit/job/foreman

	added_access = list()
	base_access = list(ACCESS_MINING, ACCESS_MECH_MINING)

	ration_bonus = 1

	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_CAR
	display_order = JOB_DISPLAY_ORDER_QUARTERMASTER
	minimal_character_age = 20 //Probably just needs some baseline experience with bureaucracy, enough trust to land the position

	departments_list = list(
		/datum/job_department/cargo,
	)

	smells_like = "hard labor"

	exp_requirements = 120
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_SUPPLY

/datum/outfit/job/foreman
	name = "Union Foreman"
	jobtype = /datum/job/foreman

	ears = /obj/item/radio/headset
	uniform = /obj/item/clothing/under/citizen
	head = /obj/item/clothing/head/hardhat/dblue
	r_pocket = /obj/item/hl2key/factory
	skillchips = list(/obj/item/skillchip/engineer)

