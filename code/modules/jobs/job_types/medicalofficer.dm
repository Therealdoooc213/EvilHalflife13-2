/datum/job/medofficer
	title = "Medical Officer"
	description = "Preform standard Civil Protection Officer duties if necessary, otherwise tend to combine asset injuries."
	orbit_icon = "suitcase-medical"
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	department_head = list("Divisional Lead")
	faction = "Station"
	total_positions = 1 
	spawn_positions = 1 
	supervisors = "the Divisional Lead and District Administrator"
	minimal_player_age = 5
	exp_requirements = 0
	exp_type = EXP_TYPE_CREW

	ration_bonus = 1

	cmode_music = 'sound/music/combat/branescan.ogg'

	outfit = /datum/outfit/job/medofficer

	added_access = list(ACCESS_MAINT_TUNNELS, ACCESS_MORGUE, ACCESS_DETECTIVE, ACCESS_BRIG_PHYS)
	base_access = list(ACCESS_SECURITY, ACCESS_HYDROPONICS, ACCESS_SCIENCE, ACCESS_CARGO, ACCESS_SEC_BASIC, ACCESS_BRIG, ACCESS_WEAPONS_PERMIT, ACCESS_MEDICAL,
					ACCESS_EXTERNAL_AIRLOCKS, ACCESS_MECH_SECURITY) 

	paycheck = PAYCHECK_HARD
	paycheck_department = ACCOUNT_SEC
	mind_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_SECURITY_OFFICER
	minimal_character_age = 26 //Needs medical training and bootcamp
	var/static/list/used_numbers = list()

	departments_list = list(
		/datum/job_department/security,
		/datum/job_department/medical,
	)

	smells_like = "crimson guardianship"

/datum/job/medofficer/after_spawn(mob/living/carbon/human/H, mob/M)
	. = ..()
	H.faction += "combine"
	var/r = rand(100,900)
	while (used_numbers.Find(r))
		r = rand(100,900)
	used_numbers += r
	if(istype(H.wear_id, /obj/item/card/id))
		var/obj/item/card/id/ID = H.wear_id
		ID.registered_name = "MO-[used_numbers[used_numbers.len]]"
		ID.update_label()

/datum/outfit/job/medofficer
	name = "Medical Officer"
	jobtype = /datum/job/medofficer

	ears = /obj/item/radio/headset/civilprotection
	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection/medical
	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/security/civilprotection/medical

	mask = /obj/item/clothing/mask/gas/civilprotection/medical
	belt = /obj/item/storage/belt/medical/officer/full

	implants = list(/obj/item/implant/mindshield, /obj/item/implant/biosig_ert)
	skillchips = list(/obj/item/skillchip/doctor)
	
