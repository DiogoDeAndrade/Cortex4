extends Node3D

class_name Interactable

signal interact(what : Interactable, who : Node3D)

enum InteractionMode { Single, Multi }
enum InteractionDirection { Front, Back, Both }

@export var mode : InteractionMode = InteractionMode.Multi
@export var direction : InteractionDirection = InteractionDirection.Both
@export var interactableName : String = "Generic Name"
@export var interactionText : String = "Interaction Text"
@export var needItems : bool = false
@export var items : Array[String] = []

@onready var player : Player = Utils.find_player() as Player

var interactionCount = 0;

func is_interactable(interaction_direction : Vector3):
	if mode == InteractionMode.Single and interactionCount > 0:
		return false
	if direction == InteractionDirection.Front:
		return interaction_direction.dot(transform.basis.z) < 0
	elif direction == InteractionDirection.Back:
		return interaction_direction.dot(transform.basis.z) > 0
		
	return true

func get_interaction_text():
	if needItems:
		for item in items:
			if (!player.has_item(item)):
				return "Needs %s..." % get_display_name(item).to_lower()
				
	return interactionText
	
func get_interaction_title():
	return interactableName
	
func run_interaction(who):
	emit_signal("interact", self, who)
	interactionCount += 1
	
func get_display_name(item_name : String):
	return item_name.replace("_", " ")
