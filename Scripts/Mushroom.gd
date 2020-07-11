extends Area2D
class_name Mushroom

export var grid_x: int = 0
export var grid_y: int = 0
var REPRODUCE_TIME = 1
const GRID_SIZE = 20
const Direction = {
	North = Vector2(0,-1),
	East = Vector2(1,0), 
	South = Vector2(0,1), 
	West = Vector2(-1,0)
}
onready var money_tracker = get_node("/root/Level/UI/MoneyLabel")
onready	var timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.set_wait_time(REPRODUCE_TIME)
	timer.connect("timeout", self, "_reproduce")
	timer.autostart = true
	add_child(timer)
	randomize()  # Changes result of .shuffle()

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton \
	and event.button_index == BUTTON_LEFT \
	and event.is_pressed():
		self.on_click()

func on_click():
	money_tracker.add_money(1)
	MushroomGrid.delete(grid_x, grid_y)

func _reproduce():
	var directions = Direction.keys()
	directions.shuffle()
	for direction in directions:
		var dir = Direction[direction]
		var new_x = grid_x + dir.x
		var new_y = grid_y + dir.y
		if _check_direction_free(new_x, new_y):
			_create_mushroom(new_x, new_y)
			return

func _check_direction_free(new_x: int, new_y: int):
	return MushroomGrid.check_free(new_x,new_y)

func _create_mushroom(new_x: int, new_y: int):
	print("Creating mushroom @(" + str(new_x) + "," + str(new_y) + ")")
	MushroomGrid.make_mushroom(new_x, new_y)
