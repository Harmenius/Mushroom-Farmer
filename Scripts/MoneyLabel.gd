extends Label

export var money = 0
var frozen = false
onready var goal_tracker = get_node("/root/Level/UI/GoalLabel")

func get_money():
	return money
	
func set_money(new_money: int):
	if frozen:
		return
	money = new_money
	self.text = "       $" + str(money)
	goal_tracker.check_victory(money)
	var progress_bar = get_node("Node2D/ProgressBar")
	var new_progress = money * 100.0 / goal_tracker.goal
	progress_bar.value = new_progress
	var progress_color = Color(pow(0.4 + 0.3 * new_progress/100, 2),
							   pow(0.6 + 0.3 * new_progress/100, 2),
							   pow(0.4 + 0.3 * new_progress/100, 2))
	var g = Gradient.new()
	g.offsets = [0,1]
	g.colors = [progress_color,progress_color]
	var gt = GradientTexture.new()
	gt.set_gradient(g)
	var try_gradient = gt.get_gradient()
	gt.set_width(200)
	var old_bar = progress_bar.get_progress_texture()
	progress_bar.set_progress_texture(gt)
	progress_bar.set_tint_progress(progress_color)

func add_money(added_money: int):
	var new_money = money + added_money
	set_money(new_money)

func sub_money(subtracted_money: int):
	var new_money = money - subtracted_money
	set_money(new_money)

func freeze():
	frozen = true
