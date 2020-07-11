extends Area2D
class_name Mushroom

export var grid_x: int = 0
export var grid_y: int = 0
const REPRODUCE_TIME = 3
const GRID_SIZE = 20
const Direction = {
	North = Vector2(0,-1),
	East = Vector2(1,0), 
	South = Vector2(0,1), 
	West = Vector2(-1,0)
}
onready var money_tracker = get_node("/root/Level/UI/MoneyLabel")

# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.set_wait_time(REPRODUCE_TIME)
	timer.connect("timeout", self, "_reproduce")
	timer.autostart = true
	add_child(timer)

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

func on_click():
	money_tracker.add_money(1)
	MushroomGrid.delete(grid_x, grid_y)

func _reproduce():
	for direction in Direction:
		var dir = Direction[direction]
		var new_x = grid_x + dir.x
		var new_y = grid_y + dir.y
		if _check_direction_free(new_x, new_y):
			_create_mushroom(new_x, new_y)
			return
	print("NO REPRO")

func _check_direction_free(new_x: int, new_y: int):
	return MushroomGrid.check_free(new_x,new_y)

func _create_mushroom(new_x: int, new_y: int):
	print("Creating mushroom @(" + str(new_x) + "," + str(new_y) + ")")
	MushroomGrid.make_mushroom(new_x, new_y)
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


