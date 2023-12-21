extends Node

var guardAwareness : int = 0

func start_play():
	guardAwareness = 0
	
func change_guard_awareness(delta):
	guardAwareness += delta
	
	if guardAwareness == 2:
		var gameText = Utils.find_game_text()
		gameText.display("The guards are starting to look at you more closely...", Color.RED, "", Color.WHITE, 2, false)
	elif guardAwareness == 4:
		var gameText = Utils.find_game_text()
		gameText.display("The guards are raising the alarm...", Color.RED, "", Color.WHITE, 2, false)
	elif guardAwareness > 4:
		# Go for game over
		pass
	
