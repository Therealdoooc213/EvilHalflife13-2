/proc/getviewsize(view)
	if(isnum(view))
		var/totalviewrange = (view < 0 ? -1 : 1) + 2 * view
		return list(totalviewrange, totalviewrange)
	else
		var/list/viewrangelist = splittext(view,"x")
		return list(text2num(viewrangelist[1]), text2num(viewrangelist[2]))

/// Takes a string or num view, and converts it to pixel width/height in a list(pixel_width, pixel_height)
/proc/view_to_pixels(view)
	if(!view)
		return list(0, 0)
	var/list/view_info = getviewsize(view)
	view_info[1] *= world.icon_size
	view_info[2] *= world.icon_size
	return view_info

/proc/in_view_range(mob/user, atom/A)
	var/list/view_range = getviewsize(user.client.view)
	var/turf/source = get_turf(user)
	var/turf/target = get_turf(A)
	return ISINRANGE(target.x, source.x - view_range[1], source.x + view_range[1]) && ISINRANGE(target.y, source.y - view_range[1], source.y + view_range[1])

/// The default tile-distance between two atoms for one to consider the other as visible.
#define DEFAULT_SIGHT_DISTANCE 7

/// Checks the visibility between two other objects.
#define CAN_THEY_SEE(target, source) ((source in viewers(DEFAULT_SIGHT_DISTANCE, target)) || in_range(target, source))
