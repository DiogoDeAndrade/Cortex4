extends Node

class_name Interactable

@export var interactableName : String = "Generic Name"
@export var interactionText : String = "Interaction Text"
@export var needItems : bool = false
@export var items : Array[String] = []

@onready var player : Player = Utils.find_player() as Player

func get_interaction_text():
	if needItems:
		for item in items:
			if (!player.has_item(item)):
				return "Needs %s..." % get_display_name(item).to_lower()
				
	return interactionText
	
func get_interaction_title():
	return interactableName
	
func interact():
	print("Interacted with %s" % name)
	
func get_display_name(item_name : String):
	return item_name.replace("_", " ")
