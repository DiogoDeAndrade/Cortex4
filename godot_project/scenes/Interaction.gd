extends RayCast3D

var current_collider

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var collider = get_collider()
	
	if is_colliding() and collider is Interactable:
		if current_collider != collider:
			current_collider = collider
			print("Can now interact with %s" % collider.get_interaction_text())
	else:
		if current_collider:
			print("No longer can interact with %s" % current_collider.get_interaction_text())
			current_collider = null
