extends Node2D
class_name Level

export (PackedScene) var NextLevel
export (int) var start_money
export (int) var goal_money
export (int) var time
export (Vector2) var grid_size
export (int) var mushroom_time
export (Array) var start_mushrooms

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("UI").init_variables(start_money, goal_money, time)
	MushroomGrid.initialise(grid_size, mushroom_time)
	for coords in start_mushrooms:
		MushroomGrid.make_mushroom(coords.x, coords.y)
	get_node("TileMap").WIDTH = grid_size.x
	get_node("TileMap").HEIGHT = grid_size.y
	get_node("TileMap").initialise()
	randomize()  # Changes result of e.g. .shuffle()

func trigger_loss(reason: String):
	get_node("UI").trigger_loss()
	
func trigger_victory():
	get_node("UI").trigger_victory()
	MushroomGrid.freeze()

func next_level():
	get_tree().change_scene_to(NextLevel)
