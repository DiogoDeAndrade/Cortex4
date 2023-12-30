extends Node2D

@export var nextScreen = "game"
@export var screens : Array[Node]

var keyReleased = false;
var index = 0;

func _ready():
	index = -1
	for s in screens:
		s.visible = false;
	next_image()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if keyReleased:
		if Input.is_anything_pressed():
			var gameText = Utils.find_game_text()
			if not gameText.active:
				next_image()
			else:
				if not gameText.skip():
					next_image()
			keyReleased = false
	else:
		if !Input.is_anything_pressed():
			keyReleased = true

func next_image():
	if index < 0:
		screens[0].visible = true;
		index = 0
		Utils.find_fader().fade_in()
	else:
		index += 1
		if index >= screens.size():
			if nextScreen == "game":
				GameManager.start_play();
			elif nextScreen == "title":
				GameManager.load_scene("title")
		else:
			Utils.find_fader().fade_out(
				func(): 
					screens[index - 1].visible = false
					screens[index].visible = true
					Utils.find_fader().fade_in();
			)
		
