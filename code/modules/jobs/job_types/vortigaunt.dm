/datum/job/janitor
	title = "Vortigaunt Slave"
	description = "Obey the combine, clean up messes."
	orbit_icon = "broom"
	department_head = list("Labor Lead")
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "everybody"

	outfit = /datum/outfit/job/vortigaunt_slave

	ration_bonus = -1 //I HATE VORTS!!!

	paycheck = PAYCHECK_ZERO
	paycheck_department = ACCOUNT_SRV

	display_order = JOB_DISPLAY_ORDER_JANITOR

	departments_list = list(
		/datum/job_department/service,
	)

	smells_like = "bleach"

/datum/outfit/job/vortigaunt_slave
	name = "Vortigaunt Slave"
	jobtype = /datum/job/janitor

	neck = /obj/item/clothing/neck/anti_magic_collar
	r_pocket = /obj/item/radio/off/halflife/vort //so they can hear orders given to them
	uniform = null
	shoes = null

/datum/outfit/job/vortigaunt_slave/pre_equip(mob/living/carbon/human/H)
	H.set_species(/datum/species/vortigaunt)

/datum/job/janitor/after_spawn(mob/living/carbon/human/H, mob/M)
	. = ..()
	H.remove_all_quirks()
