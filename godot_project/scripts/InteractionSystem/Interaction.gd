extends RayCast3D

class_name Interaction

signal selectionChanged(interactable : Interactable)

var current_collider

@onready var interactionText : InteractionText = $"/UI/InteractionText"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var collider = get_collider()
	
	if is_colliding() and collider is Interactable:
		if current_collider != collider:
			current_collider = collider
			emit_signal("selectionChanged", current_collider)
	else:
		if current_collider:
			current_collider = null
			emit_signal("selectionChanged", current_collider)
