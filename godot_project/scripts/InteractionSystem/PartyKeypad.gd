extends Interactable


func _on_interact(what, who, count):
	GameManager.load_scene("secure_area")
