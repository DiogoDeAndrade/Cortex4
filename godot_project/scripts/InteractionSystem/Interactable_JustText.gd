extends Interactable

@export_multiline var text : String = "";
@export_multiline var extraText : Array[String];
@export var textColor : Color = Color.WHITE;
@export var actorName : String = "";
@export var actorColor : Color = Color.WHITE;
@export var timer : float = 2.0

func run_interaction(who):
	emit_signal("interact", self, who, interactionCount)
	interactionCount += 1
	timeSinceLastInteraction = 0
	
	var gameText = Utils.find_game_text()
	if gameText:
		gameText.display(text, textColor, actorName, actorColor, timer, true)
		if extraText:
			for t in extraText:
				gameText.display(t, textColor, actorName, actorColor, timer, false)
		
