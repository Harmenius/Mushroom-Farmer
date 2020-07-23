extends Node

onready var X = get_viewport().get_size().x/2
onready var Y = get_viewport().get_size().y/2
export var WIDTH = 10
export var HEIGHT = 10
export var grid = []
const GRID_LENGTH = 40
var MUSHROOM_WAIT_TIME = 1
var game_over = false


func make_mushroom(x, y):
	if x == -1 or x == WIDTH or y == -1 or y == HEIGHT: # ON the edge
		if not game_over:
			game_over = true
			game_over_animation()
			get_node("/root/Level").trigger_loss("Out of Bounds")
		else:
			return
	
	var mushroom = load("Scenes/Mushroom.tscn").instance()
	mushroom.grid_x = x
	mushroom.grid_y = y
	mushroom.position = Vector2(X + GRID_LENGTH * (x-WIDTH/2),
								Y + GRID_LENGTH * (y-HEIGHT/2))
	mushroom.REPRODUCE_TIME = MUSHROOM_WAIT_TIME
	grid[x][y] = mushroom
	get_node("/root/Level").add_child(mushroom)

func game_over_animation():
	MUSHROOM_WAIT_TIME = 0.1
	var new_grid = []
	for x in range(7*WIDTH):
		new_grid.append([])
		var row = new_grid[x]
		for y in range(7*HEIGHT):
			row.append(null)
	for x in range(WIDTH):
		for y in range(HEIGHT):
			var mushroom = grid[x][y]
			new_grid[x+3*WIDTH][y+3*HEIGHT] = mushroom
			if is_instance_valid(mushroom):
				mushroom.REPRODUCE_TIME = 0.2
				mushroom.grid_x = x+3*WIDTH
				mushroom.grid_y = y+3*HEIGHT
				mushroom.timer.set_wait_time(0.1)
				mushroom.timer.start(0.1)
	grid = new_grid
	WIDTH = 7 * WIDTH
	HEIGHT = 7 * HEIGHT

func check_free(x, y):
	if x < -1 or x > WIDTH or y < -1 or y > HEIGHT:
		return false
	elif x == -1 or x == WIDTH or y == -1 or y == HEIGHT: # ON the edge
		return true  # Mushroms can grow here and cause a game over
	elif not is_instance_valid(grid[x][y]):
		return true
	return false

func delete(x, y):
	var mushroom = grid[x][y]
	grid[x][y] = null
	mushroom.queue_free()

func freeze():
	for x in range(WIDTH):
		for y in range(HEIGHT):
			var mushroom = grid[x][y]
			if is_instance_valid(mushroom):
				mushroom.REPRODUCE_TIME = INF
				mushroom.timer.set_wait_time(INF)
				mushroom.timer.stop()

func initialise(size: Vector2, mushroom_wait_time: float):
	game_over = false
	WIDTH = size.x
	HEIGHT = size.y
	MUSHROOM_WAIT_TIME = mushroom_wait_time

	for x in range(WIDTH):
		grid.append([])
		var row = grid[x]
		for y in range(HEIGHT):
			row.append(null)
