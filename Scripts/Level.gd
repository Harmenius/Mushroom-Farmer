extends Node2D
class_name Level

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("UI").init_variables(0, 20, 21)
	MushroomGrid.initialise(Vector2(10, 10), 1)
	MushroomGrid.make_mushroom(5,5)

func trigger_loss(reason: String):
	get_node("UI").trigger_loss()
	
func trigger_victory():
	get_node("UI").trigger_victory()
	MushroomGrid.freeze()
