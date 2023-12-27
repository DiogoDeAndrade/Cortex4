extends CanvasLayer

class_name Fader

@export var speed : float = 4.0
var fadeDir : float = 0.0
var fadeFunc : Callable

func _ready():
	fade_in();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fadeDir < 0:
		var tmp = $ColorRect.color
		tmp.a = clamp(tmp.a - delta * speed * abs(fadeDir), 0, 1)
		if tmp.a <= 0:
			fadeDir = 0
			var f = fadeFunc
			fadeFunc = func(): pass
			f.call()
		$ColorRect.color = tmp
	elif fadeDir > 0:
		var tmp = $ColorRect.color
		tmp.a = clamp(tmp.a + delta * speed * abs(fadeDir), 0, 1)
		if tmp.a >= 1:
			fadeDir = 0
			var f = fadeFunc
			fadeFunc = func(): pass
			f.call()
		$ColorRect.color = tmp

func fade_in(callback : Callable = func(): pass):
	if ($ColorRect.color.a == 0):
		callback.call()
		return
	if fadeDir == 0:
		$ColorRect.color.a = 1
	fadeDir = -1.0
	fadeFunc = callback
	
func fade_out(callback : Callable = func(): pass):
	if ($ColorRect.color.a == 1):
		callback.call()
		return
	if fadeDir == 0:
		$ColorRect.color.a = 0
	fadeDir = 1.0
	fadeFunc = callback
