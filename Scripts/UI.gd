extends Control


func trigger_victory():
	get_node("MoneyLabel").text = "WIN WIN WIN WIN WIN WIN WIN WIN WIN"
	get_node("GoalLabel").text = "WIN WIN WIN WIN WIN WIN WIN WIN WIN"
	get_node("TimerLabel/Timer").stop()
	
func trigger_loss():
	get_node("MoneyLabel").text = "LOSE LOSE LOSE LOSE LOSE LOSE LOSE LOSE LOSE"
	get_node("GoalLabel").text = "LOSE LOSE LOSE LOSE LOSE LOSE LOSE LOSE LOSE"
	get_node("MoneyLabel").freeze()
	
	
func init_variables(start_money, goal_money, time):
	get_node("MoneyLabel").set_money(start_money)
	get_node("GoalLabel").set_goal(goal_money)
	get_node("TimerLabel").set_time(time)
