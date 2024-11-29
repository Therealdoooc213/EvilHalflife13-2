/datum/job/warden
	title = "Overseer"
	description = "You are an officer tasked with monitoring prisoners and the armory first and foremost. Elsewise, you are the Divisonal Lead's second in command."
	orbit_icon = "handcuffs"
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	department_head = list("Head of Security")
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of security"
	minimal_player_age = 7
	exp_type = EXP_TYPE_CREW
	exp_type_department = EXP_TYPE_SECURITY

	ration_bonus = 2

	cmode_music = 'sound/music/combat/branescan.ogg'

	outfit = /datum/outfit/job/warden
	added_access = list(ACCESS_CAPTAIN, ACCESS_AI_MASTER)
	base_access = list(ACCESS_COMMAND, ACCESS_SECURITY, ACCESS_HOS, ACCESS_SEC_BASIC,
					ACCESS_BRIG, ACCESS_ARMORY, ACCESS_DETECTIVE, ACCESS_BRIG_PHYS,
					ACCESS_WEAPONS_PERMIT, ACCESS_LAWYER, ACCESS_MECH_SECURITY,
					ACCESS_MORGUE, ACCESS_MEDICAL, ACCESS_SURGERY, ACCESS_PARAMEDIC,
					ACCESS_ENGINEERING, ACCESS_ATMOSPHERICS, ACCESS_CONSTRUCTION, ACCESS_AUX_BASE,
					ACCESS_EXTERNAL_AIRLOCKS, ACCESS_SCIENCE, ACCESS_TOXINS, ACCESS_EXPERIMENTATION,
					ACCESS_XENOBIOLOGY, ACCESS_ROBOTICS, ACCESS_AI_SAT, ACCESS_CARGO,
					ACCESS_CARGO_BAY, ACCESS_MINING, ACCESS_MINING_STATION, ACCESS_MAINT_TUNNELS,
					ACCESS_EVA, ACCESS_PERSONAL_LOCKERS, ACCESS_VAULT, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH)

	paycheck = PAYCHECK_HARD
	paycheck_department = ACCOUNT_SEC
	mind_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_WARDEN
	minimal_character_age = 20 //You're a sergeant, probably has some experience in the field

	departments_list = list(
		/datum/job_department/security,
	)
	
	smells_like = "gunpowdery justice"
	var/static/list/used_numbers = list()

/datum/job/warden/after_spawn(mob/living/carbon/human/H, mob/M)
	. = ..()
	H.faction += "combine"
	var/r = rand(100,900)
	while (used_numbers.Find(r))
		r = rand(100,900)
	used_numbers += r
	if(istype(H.wear_id, /obj/item/card/id))
		var/obj/item/card/id/ID = H.wear_id
		ID.registered_name = "OV-[used_numbers[used_numbers.len]]"
		ID.update_label()

/datum/outfit/job/warden
	name = "Overseer"
	jobtype = /datum/job/warden

	ears = /obj/item/radio/headset/civilprotection
	uniform = /obj/item/clothing/under/combine/civilprotection
	gloves = /obj/item/clothing/gloves/color/civilprotection
	suit = /obj/item/clothing/suit/armor/civilprotection/trenchcoat/overseer
	suit_store = /obj/item/gun/ballistic/automatic/pistol/usp
	shoes = /obj/item/clothing/shoes/jackboots/civilprotection
	glasses = /obj/item/clothing/glasses/hud/security/civilprotection

	mask = /obj/item/clothing/mask/gas/civilprotection/overseer
	belt = /obj/item/storage/belt/civilprotection/full

	implants = list(/obj/item/implant/mindshield, /obj/item/implant/biosig_ert)
