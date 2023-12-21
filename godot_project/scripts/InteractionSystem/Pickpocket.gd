extends Node3D

@export var possibleItems : PackedStringArray

var stolen : bool = false
var gameText : GameText = null

func on_interact(_what, _who, count):
	if !gameText:
		gameText = Utils.find_game_text()

	if stolen:
		gameText.display("Nothing to steal!", Color.RED, "", Color.WHITE, 2, true)
		return
		
	var item = possibleItems[randi() % possibleItems.size()]
	gameText.display("You stolen %s!" % item, Color.YELLOW, "", Color.WHITE, 2, true)
	
	var player = Utils.find_player()
	player.add_item(item)
