/area/halflife
	name = "\improper Unexplored Location"
	icon_state = "away"
	has_gravity = TRUE
	hidden = FALSE
	ambience_index = AMBIENCE_HLOUTSIDE
	flags_1 = CAN_BE_DIRTY_1
	requires_power = FALSE
	lights_always_start_on = TRUE

/area/halflife/outdoors
	name = "\improper Outdoors"
	static_lighting = TRUE
	outdoors = TRUE
	uses_daylight = TRUE
	daylight_multiplier = 0.25
	base_lighting_alpha = 0
	sound_environment = SOUND_ENVIRONMENT_CITY
	light_power = 0.1
	light_range = 2
	light_color = COLOR_STARLIGHT
	ambient_buzz = 'sound/ambience/plaza_amb.ogg'
	ambient_buzz_vol = 20

/area/halflife/outdoors/sewage_dump
	name = "\improper Sewage Dump"
	ambient_buzz = 'sound/ambience/toxic_ambience.ogg'
	daylight_multiplier = 0.35

/area/halflife/outdoors/alley
	name = "\improper Alley Ways"
	ambient_buzz = 'sound/ambience/tone_alley.ogg'

/area/halflife/outdoors/forest
	name = "\improper Forested Outlands"
	ambient_buzz = 'sound/ambience/forest/wind_light02_loop.ogg'
	ambient_buzz_vol = 10
	ambience_index = AMBIENCE_HLFOREST
	sound_environment = SOUND_ENVIRONMENT_FOREST
	max_ambience_cooldown = 30 SECONDS
	min_ambience_cooldown = 10 SECONDS
	daylight_multiplier = 0.35

/area/halflife/indoors
	name = "\improper Indoors"
	icon_state = "away"
	base_lighting_alpha = 15
	light_power = 0.1
	light_range = 2
	ambience_index = AMBIENCE_HLINSIDE
	sound_environment = SOUND_ENVIRONMENT_ROOM
	ambient_buzz = 'sound/ambience/town_ambience.ogg'

/area/halflife/indoors/townhall
	name = "\improper Town Hall"
	ambient_buzz = 'sound/ambience/citadel_ambience.ogg'

/area/halflife/indoors/bar
	name = "\improper Bar"

/area/halflife/indoors/restaurant
	name = "\improper Restaurant"

/area/halflife/indoors/trainstation
	name = "\improper Trainstation"

/area/halflife/indoors/slums
	name = "\improper Slums"

/area/halflife/indoors/hospital
	name = "\improper Hospital"

/area/halflife/indoors/scienceunion
	name = "\improper Science Union"

/area/halflife/indoors/laborunion
	name = "\improper Labor Union"

/area/halflife/indoors/distributioncenter
	name = "\improper Distribution Center"

/area/halflife/indoors/hydroponics
	name = "\improper Hydroponics"

/area/halflife/indoors/productioncenter
	name = "\improper Production Center"
	ambient_buzz = 'sound/ambience/industrial3.ogg'
	ambient_buzz_vol = 100

/area/halflife/indoors/bunker
	ambient_buzz = 'sound/ambience/bunker2.ogg'
	ambient_buzz_vol = 70

/area/halflife/indoors/sewer
	name = "\improper Sewers"
	base_lighting_alpha = 5
	max_ambience_cooldown = 90 SECONDS
	icon_state = "away"
	ambience_index = AMBIENCE_HLSEWERS
	sound_environment = SOUND_ENVIRONMENT_STONE_CORRIDOR
	ambient_buzz = 'sound/ambience/corridor.ogg'
	ambient_buzz_vol = 7
	mood_bonus = -2
	mood_message = "<span class='warning'>This place smells terrible.</span>\n"

/area/halflife/indoors/sewer/tunnel
	name = "\improper Tunnels"
	ambient_buzz = 'sound/ambience/bunker1.ogg'
	ambient_buzz_vol = 80

/area/halflife/indoors/sewer/cave
	name = "\improper Mining Caves"

/area/halflife/indoors/sewer/outlandscave
	name = "\improper Outlands Caves"
	ambience_index = AMBIENCE_HLANTCAVES
	max_ambience_cooldown = 25 SECONDS
	min_ambience_cooldown = 10 SECONDS
	ambient_buzz = 'sound/ambience/antcaves/cave_howl_loop1.ogg'

/area/halflife/indoors/sewer/antlioncave
	name = "\improper Infested Caves"
	ambience_index = AMBIENCE_HLANTCAVES
	max_ambience_cooldown = 25 SECONDS
	min_ambience_cooldown = 10 SECONDS
	ambient_buzz = 'sound/ambience/antcaves/cave_howl_loop1.ogg'
