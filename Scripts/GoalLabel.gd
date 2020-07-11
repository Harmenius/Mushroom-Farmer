extends Label


# Declare member variables here. Examples:
var goal = 20

func set_goal(new_goal):
	goal = new_goal
	text = "Goal: $" + str(goal)

func check_victory(money):
	if money >= goal:
		get_node("/root/Level/UI").trigger_victory()
