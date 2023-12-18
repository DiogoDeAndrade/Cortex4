extends ColorRect

class_name InteractionText

@onready var text : RichTextLabel = $Text
var currentInteractable : Interactable = null

func _ready():
	var player = Utils.find_player()
	if player == null:
		print("Player not found!")
	else:
		var interaction_player = player.get_node("Camera3D/InteractionRaycast") as Interaction
		interaction_player.selectionChanged.connect(set_interactable)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if currentInteractable == null:
		visible = false
		text.text = ""
	else:
		visible = true
		text.text = "[center][color=yellow]%s\n[color=white]%s" % [ currentInteractable.get_interaction_title(), currentInteractable.get_interaction_text() ]

func set_interactable(interactable):
	currentInteractable = interactable
