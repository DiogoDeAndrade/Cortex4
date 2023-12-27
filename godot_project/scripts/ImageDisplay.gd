extends Node2D

var keyReleased = false;

func _ready():
	Utils.find_fader().fade_in()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if keyReleased:
		if Input.is_anything_pressed():
			GameManager.start_play();
	else:
		if !Input.is_anything_pressed():
			keyReleased = true
