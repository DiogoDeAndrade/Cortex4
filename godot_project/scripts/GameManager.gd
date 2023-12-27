extends Node

var guardAwareness : int = 0

func start_play():
	guardAwareness = 0
	
func change_guard_awareness(delta):
	guardAwareness += delta
	
	if guardAwareness == 1:
		var gameText = Utils.find_game_text()
		gameText.display("The guards are starting to look at you more closely...", Color.RED, "", Color.WHITE, 2, false)
	elif guardAwareness == 3:
		var gameText = Utils.find_game_text()
		gameText.display("The guards are raising the alarm...", Color.RED, "", Color.WHITE, 2, false)
	elif guardAwareness > 3:
		# Go for game over
		load_scene("caught")
		return
	
func load_scene(sceneName):
	Utils.find_fader().fade_out(
		func(): 
			var resourceSceneName = "res://scenes/%s.tscn" % sceneName;
			get_tree().change_scene_to_file(resourceSceneName);
	)
