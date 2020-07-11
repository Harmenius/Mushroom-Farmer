extends Node2D
class_name Level

# Called when the node enters the scene tree for the first time.
func _ready():
	MushroomGrid.make_mushroom(5,5)
	get_node("UI").init_variables(0, 20, 21)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
