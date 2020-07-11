extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var WIDTH = 10
var HEIGHT = 10
enum Tiles {GRASS_TILE,
			HORIZONTAL_FENCE,
			VERTICAL_FENCE,
			GRASS_TILE2,
			CORNER_WS,
			CORNER_ES,
			CORNER_EN,
			CORNER_WN}

# Called when the node enters the scene tree for the first time.
func _ready():
	position = get_viewport().get_size()/2 \
	 		 - Vector2(WIDTH, HEIGHT)/2*20 \
			 - Vector2(10,10)  # Half a tile
	for x in range(WIDTH):
		for y in range(HEIGHT):
			set_cell(x, y, Tiles.GRASS_TILE)
	
	for x in range(WIDTH):
		set_cell(x, WIDTH, Tiles.HORIZONTAL_FENCE)
		set_cell(x, -1, Tiles.HORIZONTAL_FENCE)
		set_cell(-1, x, Tiles.VERTICAL_FENCE)
		set_cell(HEIGHT, x, Tiles.VERTICAL_FENCE)
	set_cell(WIDTH, -1, Tiles.CORNER_WS)
	set_cell(-1, -1, Tiles.CORNER_ES)
	set_cell(-1, HEIGHT, Tiles.CORNER_EN)
	set_cell(WIDTH, HEIGHT, Tiles.CORNER_WN)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
