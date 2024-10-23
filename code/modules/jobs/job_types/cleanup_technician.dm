/datum/job/cleanup_technician
	title = "Cleanup Technician"
	description = "Remove xenian infestations from hotspots in the city."
	orbit_icon = "biohazard"
	department_head = list("Union Foreman and Labor Lead")
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the union foreman and labor lead"
	exp_requirements = 0
	exp_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/cleanup_technician

	added_access = list(ACCESS_ATMOSPHERICS, ACCESS_SCIENCE, ACCESS_RESEARCH)
	base_access = list(ACCESS_ENGINEERING, ACCESS_ENGINE_EQUIP, ACCESS_TECH_STORAGE, ACCESS_MAINT_TUNNELS, ACCESS_MECH_ENGINE,
						ACCESS_EXTERNAL_AIRLOCKS, ACCESS_CONSTRUCTION, ACCESS_AUX_BASE)

	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_CAR

	display_order = JOB_DISPLAY_ORDER_CARGO_TECHNICIAN
	minimal_character_age = 22

	departments_list = list(
		/datum/job_department/engineering,
	)
	
	smells_like = "cleaning solution"

/datum/outfit/job/cleanup_technician
	name = "Cleanup Technician"
	jobtype = /datum/job/cleanup_technician

	ears = /obj/item/radio/headset
	uniform = /obj/item/clothing/under/citizen
	r_pocket = /obj/item/hl2key/factory
