extends Label

export var money = 0

func get_money():
	return money
	
func set_money(new_money: int):
	money = new_money
	self.text = "$" + str(money)

func add_money(added_money: int):
	money += added_money
	self.text = "$" + str(money)

func sub_money(subtracted_money: int):
	money -= subtracted_money
	self.text = "$" + str(money)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
