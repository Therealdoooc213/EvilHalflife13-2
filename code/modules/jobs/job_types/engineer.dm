/datum/job/engineer
	title = "Union Engineer"
	description = "Maintain and construct new structures, electronics, and machines."
	orbit_icon = "gears"
	department_head = list("Union Foreman and Labor Lead")
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the union foreman and labor lead"
	exp_requirements = 0
	exp_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/engineer

	added_access = list(ACCESS_ATMOSPHERICS, ACCESS_SCIENCE, ACCESS_RESEARCH)
	base_access = list(ACCESS_ENGINEERING, ACCESS_ENGINE_EQUIP, ACCESS_TECH_STORAGE, ACCESS_MAINT_TUNNELS, ACCESS_MECH_ENGINE,
						ACCESS_EXTERNAL_AIRLOCKS, ACCESS_CONSTRUCTION, ACCESS_AUX_BASE)

	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_ENG

	display_order = JOB_DISPLAY_ORDER_STATION_ENGINEER
	minimal_character_age = 22 //You need to know a lot of complicated stuff about engines, could theoretically just have a traditional bachelor's

	departments_list = list(
		/datum/job_department/engineering,
	)
	
	smells_like = "welding fuel"

/datum/outfit/job/engineer
	name = "Union Engineer"
	jobtype = /datum/job/engineer

	ears = /obj/item/radio/headset
	uniform = /obj/item/clothing/under/citizen
	suit = /obj/item/clothing/suit/radiation/engineer
	mask = /obj/item/clothing/mask/gas/cwuengi
	head = /obj/item/clothing/head/welding
	gloves = /obj/item/clothing/gloves/color/yellow
	r_pocket = /obj/item/hl2key/factory
	skillchips = list(/obj/item/skillchip/engineer)
