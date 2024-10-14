/datum/ai_project/camera_range
	name = "Enhanced Camera Range"
	description = "Dedicate processing power to figure out a way to better decompress video feed, allowing cameras to record farther distances."
	category = AI_PROJECT_CAMERAS
	
	research_cost = 1500
	can_be_run = FALSE

/datum/ai_project/camera_range/finish()
	for(var/obj/machinery/camera/C as anything in GLOB.cameranet.cameras)
		if(C.view_range == initial(C.view_range))
			C.setViewRange(num = 10)
