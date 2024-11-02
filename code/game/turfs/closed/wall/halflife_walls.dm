//wall sprites from tgmc
/turf/closed/wall/halflife
	name = "wall"
	desc = "A sturdy wall."
	max_integrity = 1000
	baseturfs = /turf/open/floor/plating/ground/dirt
	deconstructible = FALSE

/turf/closed/wall/halflife/try_decon(obj/item/I, mob/user, turf/T, modifiers)
	return FALSE

/turf/closed/wall/halflife/wood
	name = "wooden wall"
	icon = 'icons/turf/walls/halflife/woodwall.dmi'
	desc = "A sturdy wall made of wood."
	icon_state = "woodwall-0"
	base_icon_state = "woodwall"

/turf/closed/wall/halflife/brick
	name = "brick wall"
	icon = 'icons/turf/walls/halflife/brick.dmi'
	desc = "A sturdy wall made of bricks."
	icon_state = "wall-0"
	base_icon_state = "wall"

/turf/closed/wall/halflife/metal
	name = "metal wall"
	icon = 'icons/turf/walls/halflife/metal.dmi'
	desc = "A sturdy wall made of metal."
	icon_state = "urban_wall_regular-0"
	base_icon_state = "urban_wall_regular"
	deconstructible = TRUE

/turf/closed/wall/halflife/metal/weak
	desc = "A wall made of metal."
	max_integrity = 300
