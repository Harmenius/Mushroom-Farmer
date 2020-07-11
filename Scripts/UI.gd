extends CanvasLayer


func _ready():
	get_node("RetryButton").hide()
	get_node("RetryButton").connect("pressed", self, "_retry")
	get_node("NextButton").hide()
	get_node("NextButton").connect("pressed", self, "_next_level")

func trigger_victory():
	get_node("MoneyLabel").text = "WIN WIN WIN WIN WIN WIN WIN WIN WIN"
	get_node("GoalLabel").text = "WIN WIN WIN WIN WIN WIN WIN WIN WIN"
	get_node("MoneyLabel").freeze()
	get_node("TimerLabel/Timer").stop()
	get_node("NextButton").show()
	
func trigger_loss():
	get_node("MoneyLabel").text = "LOSE LOSE LOSE LOSE LOSE LOSE LOSE LOSE LOSE"
	get_node("GoalLabel").text = "LOSE LOSE LOSE LOSE LOSE LOSE LOSE LOSE LOSE"
	get_node("MoneyLabel").freeze()
	get_node("TimerLabel/Timer").stop()
	get_node("RetryButton").show()
	
	
func init_variables(start_money, goal_money, time):
	get_node("MoneyLabel").set_money(start_money)
	get_node("GoalLabel").set_goal(goal_money)
	get_node("TimerLabel").set_time(time)

func _retry():
	get_tree().reload_current_scene()

func _next_level():
	get_node("/root/Level").next_level()
