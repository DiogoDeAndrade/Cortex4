extends Interactable



func _on_interact(_what, _who, _count):
	GameManager.load_scene("SecureRoom");
