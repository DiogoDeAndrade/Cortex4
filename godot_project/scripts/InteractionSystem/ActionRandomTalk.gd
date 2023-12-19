extends Node3D

enum SentenceMode { FullRandom, RandomWithMemory, Sequential, SequentialOnce }

@export var actorName : String = "Actor"
@export var actorColor : Color = Color.YELLOW
@export var mode : SentenceMode = SentenceMode.Sequential
@export var async : bool = true
@export var textColor : Color = Color.WHITE
@export_multiline var sentences : PackedStringArray
@export var baseTime : float = 2
@export var timePerChar : float = 0.02

var available : Array[int] = []
var gameText : GameText = null

func on_interact(_what, _who, count):
	var index : int = -1
	if mode == SentenceMode.FullRandom:
		index = randi() % sentences.size()
	elif (mode == SentenceMode.RandomWithMemory) || ((mode == SentenceMode.SequentialOnce) && (count >= sentences.size())):
		if available.size() == 0:
			for i in range(0, sentences.size()):
				available.append(i)				
		var index2 = randi() % available.size()
		index = available[index2]
		available.pop_at(index2)
	elif (mode == SentenceMode.Sequential) || (mode == SentenceMode.SequentialOnce):
		index = count % sentences.size()

	var sentence = sentences[index]
	if !gameText:
		gameText = Utils.find_game_text()
	if gameText:
		var timer = 0
		if async:
			timer = baseTime + timePerChar * sentence.length()
			
		gameText.display(sentence, textColor, actorName, actorColor, timer, true)
