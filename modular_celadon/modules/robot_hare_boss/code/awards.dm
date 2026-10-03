#define BOSS_MEDAL_ROBOTHARE "Robot Hares Killed"
#define BOSS_MEDAL_ROBOTHARE_CRUSHER "Robot Hares Killed"
#define ROBOTHARE_SCORE "Robot Hares Killed"

/datum/award/achievement/boss/robothare_kill
	name = "Robot Hare Killer"
	desc = "Machine that likes eats carrot and you too."
	database_id = "BOSS_MEDAL_ROBOTHARE"
	icon_state = "robothare"

/datum/award/achievement/boss/robothare_crusher
	name = "Robot Hare Crusher"
	desc = "Metal machine. We are all in."
	database_id = BOSS_MEDAL_ROBOTHARE_CRUSHER
	icon_state = "robothare"

/datum/award/score/robothare_score
	name = "Robot Hares Killed"
	desc = "You've killed HOW many?"
	database_id = ROBOTHARE_SCORE
