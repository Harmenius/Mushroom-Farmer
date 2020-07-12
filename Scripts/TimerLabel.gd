extends Label

var time
onready var timer = get_node("Timer")
onready var flash_timer = get_node("FlashTimer")

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.connect("timeout", self, "_tick")
	flash_timer.connect("timeout", self, "_flip_color")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_time(new_time):
	time = new_time
	text = str(time) + " sec"

func _tick():
	time -= 1
	text = str(time) + " sec"
	if time <= 10:
		add_color_override("font_color", Color(1,0,0))
	if time <= 5:
		flash_timer.start()
	if time <= 0:
		get_node("/root/Level").trigger_loss("Timeout")

func _flip_color():
	if get_color("font_color") == Color(1,0,0):
		add_color_override("font_color", Color(1,1,1))
	else:
		add_color_override("font_color", Color(1,0,0))
	flash_timer.start()
