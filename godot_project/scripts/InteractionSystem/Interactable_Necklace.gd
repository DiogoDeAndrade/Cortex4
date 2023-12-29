extends Interactable

@export_multiline var text : String = "";
@export var textColor : Color = Color.WHITE;
@export var actorName : String = "";
@export var actorColor : Color = Color.WHITE;
@export var timer : float = 2.0

func run_interaction(who):
	if is_visible_in_tree():
		emit_signal("interact", self, who, interactionCount)
		interactionCount += 1
		timeSinceLastInteraction = 0
		
		var gameText = Utils.find_game_text()
		if gameText:
			gameText.display(text, textColor, actorName, actorColor, timer, true)
			
		var player = Utils.find_player()
		if player:
			player.add_item("necklace")
			
		get_parent().visible = false
	
