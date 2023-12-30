extends Node2D

@export var nextScreen = "game"

var keyReleased = false;

func _ready():
	Utils.find_fader().fade_in()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if keyReleased:
		if Input.is_anything_pressed():
			if nextScreen == "game":
				GameManager.start_play();
			elif nextScreen == "title":
				GameManager.load_scene("title")
			elif nextScreen == "story":
				GameManager.load_scene("story_start")
	else:
		if !Input.is_anything_pressed():
			keyReleased = true
