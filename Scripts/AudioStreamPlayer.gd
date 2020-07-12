extends AudioStreamPlayer

const pop_files = ["Pop_01.wav"]
const coin_files = ["Coins_01.wav", "Coins_02.wav", 
					"Coins_03.wav", "Coins_04.wav"]
const bite_files = ["Eat_01.wav", "Eat_02.wav"]
onready var pop_timer = get_node("Timer")

func play_pop():
	var time_left = pop_timer.time_left
	if pop_timer.time_left == 0:
		var i = randi()%pop_files.size()
		stream = load("res://Assets/Sounds/" + pop_files[i])
		self.play()
		pop_timer.start()
	
func play_coins():
	var i = randi()%coin_files.size()
	stream = load("res://Assets/Sounds/" + coin_files[i])
	self.play()
	
func play_bite():
	var i = randi()%bite_files.size()
	stream = load("res://Assets/Sounds/"+ bite_files[i])
	self.play()
