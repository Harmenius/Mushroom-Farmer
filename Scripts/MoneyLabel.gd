extends Label

export var money = 0
var frozen = false
onready var goal_tracker = get_node("/root/Level/UI/GoalLabel")

func get_money():
	return money
	
func set_money(new_money: int):
	if not frozen:
		money = new_money
		self.text = "       $" + str(money)
		goal_tracker.check_victory(money)

func add_money(added_money: int):
	var new_money = money + added_money
	set_money(new_money)

func sub_money(subtracted_money: int):
	var new_money = money - subtracted_money
	set_money(new_money)

func freeze():
	frozen = true
