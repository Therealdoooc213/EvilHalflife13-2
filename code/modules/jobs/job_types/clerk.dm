/datum/job/clerk
	title = "Clerk"
	description = "Operate a store and sell, usually, legal goods. Work with the Labor Lead for supplies."
	orbit_icon = "basket-shopping"
	department_head = list("Labor Lead")
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the labor lead"

	outfit = /datum/outfit/job/clerk

	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SRV

	display_order = JOB_DISPLAY_ORDER_CLERK
	minimal_character_age = 18 //Capitalism doesn't care about age

	departments_list = list(
		/datum/job_department/service,
	)

	smells_like = "cheap plastic"

/datum/outfit/job/clerk
	name = "Clerk"
	jobtype = /datum/job/clerk

	ears = /obj/item/radio/headset
	uniform = /obj/item/clothing/under/citizen
	head = /obj/item/clothing/head/yogs/clerkcap
	r_pocket = /obj/item/hl2key/clerk
