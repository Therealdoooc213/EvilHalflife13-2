///////////////////////////////////
//////////Autolathe Designs ///////
///////////////////////////////////

/datum/design/airlock_board
	name = "Combine Door Electronics"
	id = "airlock_board"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 1000)
	build_path = /obj/item/electronics/airlock
	category = list("initial", "Electronics")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/circuitchip
	name = "Circuit Chip"
	id = "circuitchip"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 1000)
	build_path = /obj/item/circuitmaterial
	category = list("initial","Electronics")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/metal
	name = "Metal"
	id = "metal"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/metal
	category = list("initial","Construction")
	maxstack = 50

/datum/design/glass
	name = "Glass"
	id = "glass"
	build_type = AUTOLATHE
	materials = list(/datum/material/glass = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/glass
	category = list("initial","Construction")
	maxstack = 50

/datum/design/rglass
	name = "Reinforced Glass"
	id = "rglass"
	build_type = AUTOLATHE | SMELTER | PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = MINERAL_MATERIAL_AMOUNT)
	build_path = /obj/item/stack/sheet/rglass
	category = list("initial","Construction","Stock Parts")
	maxstack = 50

/datum/design/rods
	name = "Metal Rod"
	id = "rods"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 1000)
	build_path = /obj/item/stack/rods
	category = list("initial","Construction")
	maxstack = 50

/datum/design/mop
	name = "Mop"
	id = "mop"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 1000)
	build_path = /obj/item/mop
	category = list("initial","Tools","Service")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/broom
	name="Broom"
	id="broom"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/broom
	category = list("initial","Tools","Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/extinguisher
	name = "Fire Extinguisher"
	id = "extinguisher"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 150)
	build_path = /obj/item/extinguisher
	category = list("initial","Tools","Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/flashlight
	name = "Flashlight"
	id = "flashlight"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 250)
	build_path = /obj/item/flashlight
	category = list("initial","Tools","Equipment")

/datum/design/camera
	name = "Camera"
	id = "camera"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 50, /datum/material/glass = 100)
	build_path = /obj/item/camera
	category = list("initial", "Miscellaneous")

/datum/design/fork
	name = "Fork"
	id = "fork"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 80)
	build_path = /obj/item/kitchen/fork
	category = list("initial","Dinnerware","Service")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/tray
	name = "Tray"
	id = "tray"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 3000)
	build_path = /obj/item/storage/bag/tray
	category = list("initial","Dinnerware","Service")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/plate
	name = "Plate"
	id = "plate"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 1500)
	build_path = /obj/item/plate
	category = list("initial","Dinnerware","Service")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/bowl
	name = "Bowl"
	id = "bowl"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/glass = 500)
	build_path = /obj/item/reagent_containers/glass/bowl
	category = list("initial","Dinnerware","Service")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/mixbowl
	name = "Mixing Bowl"
	id = "mixing_bowl"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 1750)
	build_path = /obj/item/reagent_containers/glass/mixbowl
	category = list("initial","Dinnerware","Service")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/drinking_glass
	name = "Drinking Glass"
	id = "drinking_glass"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/glass = 500)
	build_path = /obj/item/reagent_containers/food/drinks/drinkingglass
	category = list("initial","Dinnerware","Service")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/shot_glass
	name = "Shot Glass"
	id = "shot_glass"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/glass = 100)
	build_path = /obj/item/reagent_containers/food/drinks/drinkingglass/shotglass
	category = list("initial","Dinnerware","Service")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/shaker
	name = "Shaker"
	id = "shaker"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 1500)
	build_path = /obj/item/reagent_containers/food/drinks/shaker
	category = list("initial","Dinnerware","Service")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/cultivator
	name = "Cultivator"
	id = "cultivator"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron=50)
	build_path = /obj/item/cultivator
	category = list("initial","Miscellaneous", "Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/plant_analyzer
	name = "Plant Analyzer"
	id = "plant_analyzer"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 30, /datum/material/glass = 20)
	build_path = /obj/item/plant_analyzer
	category = list("initial","Miscellaneous", "Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/shovel
	name = "Shovel"
	id = "shovel"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 50)
	build_path = /obj/item/shovel
	category = list("initial","Miscellaneous", "Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/spade
	name = "Spade"
	id = "spade"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 50)
	build_path = /obj/item/shovel/spade
	category = list("initial","Miscellaneous", "Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/beaker
	name = "Beaker"
	id = "beaker"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/glass = 500)
	build_path = /obj/item/reagent_containers/glass/beaker
	category = list("initial", "Medical", "Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SERVICE

/datum/design/large_beaker
	name = "Large Beaker"
	id = "large_beaker"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/glass = 2500)
	build_path = /obj/item/reagent_containers/glass/beaker/large
	category = list("initial", "Medical", "Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SERVICE

/datum/design/vial
	name = "Vial"
	id = "vial"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/glass = 250)
	build_path = /obj/item/reagent_containers/glass/bottle/vial
	category = list("initial", "Medical", "Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SERVICE

/datum/design/mousetrap
	name = "Mousetrap"
	id = "mousetrap"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 100)
	build_path = /obj/item/assembly/mousetrap
	category = list("initial", "Miscellaneous", "Service")

/datum/design/timer
	name = "Timer"
	id = "timer"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 50)
	build_path = /obj/item/assembly/timer
	category = list("initial", "Miscellaneous", "Assemblies")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/voice_analyser
	name = "Voice Analyser"
	id = "voice_analyser"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 50)
	build_path = /obj/item/assembly/voice
	category = list("initial", "Miscellaneous", "Assemblies")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/light_tube
	name = "Light Tube"
	id = "light_tube"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/glass = 100)
	build_path = /obj/item/light/tube
	category = list("initial", "Construction", "Service")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SERVICE

/datum/design/light_bulb
	name = "Light Bulb"
	id = "light_bulb"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/glass = 100)
	build_path = /obj/item/light/bulb
	category = list("initial", "Construction", "Service")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SERVICE

/datum/design/bounty_board_frame
	name = "Bounty Board Frame"
	id = "bountyboard_frame"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 14000, /datum/material/glass = 8000)
	build_path = /obj/item/wallframe/bounty_board
	category = list("initial", "Construction")

/datum/design/syringe
	name = "Syringe"
	id = "syringe"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 10, /datum/material/glass = 20)
	build_path = /obj/item/reagent_containers/syringe
	category = list("initial", "Medical", "Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/dropper
	name = "Dropper"
	id = "dropper"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 30, /datum/material/glass = 10)
	build_path = /obj/item/reagent_containers/dropper
	category = list("initial", "Medical", "Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/stethoscope
	name = "Stethoscope"
	id = "stethoscope"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 300)
	build_path = /obj/item/clothing/neck/stethoscope
	category = list("initial", "Medical", "Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

