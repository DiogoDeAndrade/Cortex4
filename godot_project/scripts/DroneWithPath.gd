extends Path3D

@export var speed : float = 0.0;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$PathFollow3D.progress += speed * delta;
