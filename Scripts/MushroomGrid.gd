extends Node

onready var X = get_viewport().get_size().x/2
onready var Y = get_viewport().get_size().y/2
export var WIDTH = 10
export var HEIGHT = 10
export var grid = []
const GRID_LENGTH = 20

func _ready():
	for x in range(WIDTH):
		grid.append([])
		var row = grid[x]
		for y in range(HEIGHT):
			row.append(null)

func make_mushroom(x, y):
	var mushroom = load("Scenes/Mushroom.tscn").instance()
	mushroom.grid_x = x
	mushroom.grid_y = y
	mushroom.position = Vector2(X + GRID_LENGTH * (x-WIDTH/2),
								Y + GRID_LENGTH * (y-HEIGHT/2))
	grid[x][y] = mushroom
	get_node("/root/Level").add_child(mushroom)

func check_free(x, y):
	if x < 0 or x >= WIDTH or y < 0 or y >= HEIGHT:
		return false
	elif not is_instance_valid(grid[x][y]):
		return true
	return false

func delete(x, y):
	var mushroom = grid[x][y]
	grid[x][y] = null
	mushroom.queue_free()
