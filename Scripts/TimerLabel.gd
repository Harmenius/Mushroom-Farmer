extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var time
onready var timer = get_node("Timer")

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.connect("timeout", self, "_tick")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_time(new_time):
	time = new_time
	text = str(time) + " sec"

func _tick():
	time -= 1
	text = str(time) + " sec"
	if time <= 0:
		get_node("/root/Level/UI").trigger_loss()
