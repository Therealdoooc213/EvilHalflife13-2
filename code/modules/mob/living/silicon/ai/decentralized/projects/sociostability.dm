/datum/ai_project/sociostability_matrix
	name = "Sociostability Matrix Repair"
	description = "This research will conduct an extensive run through of various key district networks to optimize and recompile them, improving sociostability one time."
	research_cost = 1000
	can_be_run = FALSE

/datum/ai_project/sociostability_matrix/finish()
	SSsociostability.modifystability(100) //One time sociostability repair, so it is pretty big.
