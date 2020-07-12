extends CanvasLayer

var grid_size = Vector2(51, 31)
var mushroom_time = 3
export var is_startscreen = true

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("MushroomTimer").connect("timeout", self, "_make_mushroom")
	MushroomGrid.initialise(grid_size, mushroom_time)
	get_node("TileMap").WIDTH = grid_size.x
	get_node("TileMap").HEIGHT = grid_size.y
	get_node("TileMap").initialise()
	get_node("UI/AudioStreamPlayer/Timer").wait_time = 0.1
	randomize()  # Changes result of e.g. .shuffle()
	
	if is_startscreen:
		for level_name in ["Level1", "Level2", "Level3"]:
			get_node("UI/Button" + level_name).connect("pressed", self, "start_level", [level_name])
	else:
		MushroomGrid.game_over = true

func _make_mushroom():
	var x = randi()%int(grid_size.x)
	var y = randi()%int(grid_size.y)
	MushroomGrid.make_mushroom(x, y)

func start_level(name: String):
	get_tree().change_scene_to(load("res://Scenes/Levels/" + name + ".tscn"))
