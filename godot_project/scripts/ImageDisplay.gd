extends Node2D

func _ready():
	Utils.find_fader().fade_in()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_anything_pressed():
		GameManager.start_play();
