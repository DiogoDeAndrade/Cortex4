extends Node

@export_multiline var text : Array[String];

func _on_visibility_changed():
	if self.visible:
		var gameText = Utils.find_game_text()
		for t in text:
			# Find actor
			var actor = ""
			if t.length() > 0:
				if t[0] == '[':
					var index = t.find(']:')
					actor = t.substr(1, index - 1)
					t = t.substr(index + 2)
			gameText.display(t, Color.WHITE, actor, Color.YELLOW, 0, false)
