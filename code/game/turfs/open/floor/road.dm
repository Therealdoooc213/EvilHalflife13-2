//from Mojave Sun 13

/turf/open/floor/plating/ground
	baseturfs = /turf/open/floor/plating/dirt
	turf_flags = NO_RUST
	tiled_dirt = FALSE
	light_power = 0.20
	light_range = 0.25
	var/border_icon
	var/has_alternate_states = FALSE //for damage, alts etc.
	var/alternate_states = 1
	var/has_base_states = FALSE //for starting variety (mainly wood)
	var/base_states = 1

	smoothing_groups = SMOOTH_GROUP_OPEN_FLOOR
	canSmoothWith = SMOOTH_GROUP_OPEN_FLOOR

/turf/open/floor/plating/ground/Initialize()
	. = ..()
	if(has_alternate_states)
		if(prob(20))
			icon_state = "[icon_state]_[rand(1,(alternate_states))]"

/turf/open/floor/plating/ground/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return

/turf/open/floor/plating/ground/break_tile()
	return //unbreakable

/turf/open/floor/plating/ground/burn_tile()
	return //unburnable

/turf/open/floor/plating/ground/MakeSlippery(wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent)
	return

/turf/open/floor/plating/ground/MakeDry()
	return

/turf/open/floor/plating/ground/can_have_cabling()
	return

/turf/open/floor/plating/ground/dirt
	gender = PLURAL
	name = "dirt"
	desc = "Upon closer examination, it's still dirt."
	icon = 'icons/turf/floors.dmi'
	icon_state = "dirt"
	baseturfs = /turf/open/floor/plating/ground/dirt
	planetary_atmos = TRUE
	attachment_holes = FALSE
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/floor/plating/ground/dirt/alt
	icon_state = "greenerdirt"

/turf/open/floor/plating/ground/rockunder
	gender = PLURAL
	name = "dirt"
	desc = "Upon closer examination, it's still dirt."
	icon = 'icons/turf/floors.dmi'
	icon_state = "dirt"
	baseturfs = /turf/open/floor/plating/ground/rockunder
	planetary_atmos = TRUE
	attachment_holes = FALSE
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	light_power = 0
	light_range = 0


/turf/open/floor/plating/ground/brickroad
	name = "\proper road"
	desc = "A stretch of road."
	baseturfs = /turf/open/floor/plating/ground/brickroad
	icon = 'icons/turf/halflifefloor/stonebrick.dmi'
	icon_state = "brick"
	base_icon_state = "brick"
	footstep = FOOTSTEP_CONCRETE
	has_base_states = TRUE
	has_alternate_states = TRUE
	alternate_states = 8

/turf/open/floor/plating/ground/road
	name = "\proper road"
	desc = "A stretch of road."
	baseturfs = /turf/open/floor/plating/ground/road
	icon = 'icons/turf/road_1.dmi'
	icon_state = "road-255"
	base_icon_state = "road"
	footstep = FOOTSTEP_CONCRETE

	smoothing_flags = SMOOTH_BITMASK | SMOOTH_BORDER

/turf/open/floor/plating/ground/road/Initialize()
	. = ..()
	addtimer(CALLBACK(src, TYPE_PROC_REF(/atom, update_icon)), 1)

/turf/open/floor/plating/ground/road/update_icon()
	. = ..() //Inheritance required for road decals
	var/rand_icon = rand(1,3)
	var/crack_randomiser = "crack_[rand(1,24)]"
	var/road_randomiser = rand(-10,10)
	var/direction_randomiser = rand(0,8)

	switch(rand_icon)
		if(1)
			icon = 'icons/turf/road_1.dmi'
			border_icon = 'icons/turf/road_1_border.dmi'
		if(2)
			icon = 'icons/turf/road_2.dmi'
			border_icon = 'icons/turf/road_2_border.dmi'
		if(3)
			icon = 'icons/turf/road_3.dmi'
			border_icon = 'icons/turf/road_3_border.dmi'

	if(prob(20))
		add_overlay(image('icons/turf/road.dmi', crack_randomiser, direction_randomiser, road_randomiser, road_randomiser))

	add_overlay(image(border_icon, icon_state, pixel_x = -16, pixel_y = -16))


////Sidewalks////

/turf/open/floor/plating/ground/sidewalk
	name = "sidewalk"
	desc = "Paved tiles specifically designed for walking upon."
	baseturfs = /turf/open/floor/plating/ground/sidewalk
	icon = 'icons/turf/halflifefloor/sidewalk.dmi'
	icon_state = "sidewalk"
	base_icon_state = "sidewalk"
	footstep = FOOTSTEP_CONCRETE
	has_base_states = TRUE
	has_alternate_states = TRUE
	alternate_states = 4

/turf/open/floor/plating/ground/sidewalk/inner
	baseturfs = /turf/open/floor/plating/ground/sidewalk/inner
	icon_state = "sidewalkinside"
	base_icon_state = "sidewalkinside"
	alternate_states = 2
