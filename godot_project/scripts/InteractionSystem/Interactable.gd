extends Node

class_name Interactable

signal interact(what : Interactable, who : Node3D)

enum InteractionMode { Single, Multi }

@export var mode : InteractionMode = InteractionMode.Multi
@export var interactableName : String = "Generic Name"
@export var interactionText : String = "Interaction Text"
@export var needItems : bool = false
@export var items : Array[String] = []

@onready var player : Player = Utils.find_player() as Player

var interactionCount = 0;

func can_interact():
	if mode == InteractionMode.Single and interactionCount > 0:
		return false
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
