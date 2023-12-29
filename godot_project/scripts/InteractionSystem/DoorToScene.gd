extends Interactable

@export var nextScene : String = "secure_room"


func _on_interact(_what, _who, _count):
	GameManager.load_scene(nextScene);
