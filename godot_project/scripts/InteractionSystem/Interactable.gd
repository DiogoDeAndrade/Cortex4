extends Node3D

class_name Interactable

signal interact(what : Interactable, who : Node3D, count : int)

enum InteractionMode { Single, Multi }
enum InteractionDirection { Front, Back, Both }

@export var mode : InteractionMode = InteractionMode.Multi
@export var direction : InteractionDirection = InteractionDirection.Both
@export var interactableName : String = "Generic Name"
@export var interactionText : String = "Interaction Text"
@export var needItems : bool = false
@export var items : Array[String] = []
@export var interactionCooldown : bool = false
@export var interactionCooldownTimer : float = 1

@onready var player : Player = Utils.find_player() as Player

var timeSinceLastInteraction = 10000;
var interactionCount = 0;

func is_interactable(interaction_direction : Vector3, check_items : bool = false):
	# Check cooldown
	if interactionCooldown:
		if timeSinceLastInteraction < interactionCooldownTimer:
			return false
	# Check multi/single mode
	if mode == InteractionMode.Single and interactionCount > 0:
		return false
	# Check direction
	if direction == InteractionDirection.Front:
		var dp = interaction_direction.dot(global_transform.basis.z)
		#print("Front::", get_parent().name, "// Dir = ", interaction_direction, " // Basis=", global_transform.basis.z, " // DP = ", dp);
		return dp > 0
	elif direction == InteractionDirection.Back:
		var dp = interaction_direction.dot(global_transform.basis.z)
		#print("Back::", get_parent().name, "// Dir = ", interaction_direction, " // Basis=", global_transform.basis.z, " // DP = ", dp);
		return dp < 0

	# Check items
	if check_items and needItems:
		for item in items:
			if (!player.has_item(item)):
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
	emit_signal("interact", self, who, interactionCount)
	interactionCount += 1
	timeSinceLastInteraction = 0
	
func get_display_name(item_name : String):
	return item_name.replace("_", " ")

func _process(delta):
	timeSinceLastInteraction += delta
	
