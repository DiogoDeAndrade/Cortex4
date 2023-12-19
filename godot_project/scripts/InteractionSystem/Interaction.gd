extends RayCast3D

class_name Interaction

signal selectionChanged(interactable : Interactable)

var current_collider : Interactable = null

@onready var player : Player = Utils.find_player()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if player.hold:
		return
		
	var collider = get_collider()
	var direction = (global_transform.basis * -target_position).normalized()
	
	if is_colliding() and collider is Interactable and collider.is_interactable(direction, false):
		if current_collider != collider:
			current_collider = collider
			emit_signal("selectionChanged", current_collider)
	else:
		if current_collider:
			current_collider = null
			emit_signal("selectionChanged", current_collider)

	if current_collider:
		if Input.is_action_just_pressed("Interact"):
			if current_collider.is_interactable(direction, true):
				current_collider.run_interaction(self)
