extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var TILE_WIDTH = 40
var TILE_HEIGHT = 40
var WIDTH = 10
var HEIGHT = 10
enum Tiles {GRASS_TILE1,
			GRASS_TILE2,
			GRASS_TILE3,
			GRASS_TILE4,
			HORIZONTAL_FENCE,
			VERTICAL_FENCE,
			CORNER_WS,
			CORNER_ES,
			CORNER_EN,
			CORNER_WN}
var N_GRASS_TILES = 4

func initialise():
	position = get_viewport().get_size()/2 \
	 		 - Vector2(WIDTH * TILE_WIDTH, HEIGHT * TILE_HEIGHT)/2 \
			 - Vector2(TILE_WIDTH, TILE_HEIGHT)/2  # Half a tile
	for x in range(WIDTH):
		for y in range(HEIGHT):
			var tile = randi()%N_GRASS_TILES
			var flip = Vector2(randi()%2, randi()%2)
			set_cell(x, y, tile, flip.x, flip.y)
	
	for x in range(WIDTH):
		set_cell(x, HEIGHT, Tiles.HORIZONTAL_FENCE)
		set_cell(x, -1, Tiles.HORIZONTAL_FENCE)
	for y in range(HEIGHT):
		set_cell(-1, y, Tiles.VERTICAL_FENCE)
		set_cell(WIDTH, y, Tiles.VERTICAL_FENCE)
	set_cell(WIDTH, -1, Tiles.CORNER_WS)
	set_cell(-1, -1, Tiles.CORNER_ES)
	set_cell(-1, HEIGHT, Tiles.CORNER_EN)
	set_cell(WIDTH, HEIGHT, Tiles.CORNER_WN)
