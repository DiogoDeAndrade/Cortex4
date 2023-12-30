extends ColorRect

class_name GameText

@export var openCloseSpeed : float = 200.0

var timer : float = 0
var queue : Array[GameTextElement] = []
var player : Player = null
var active : bool = false

var OPEN_POS_Y = 1080 - 128
var CLOSE_POS_Y = 1080

func _ready():
	active = false

func display(text : String, textColor : Color = Color.WHITE, actor : String = "", actorColor : Color = Color.YELLOW, time : float = 0, force : bool = false):
	if active:
		if !force:
			var elem = GameTextElement.new()
			elem.actorName = actor
			elem.actorColor = actorColor
			elem.textColor = textColor
			elem.text = text
			elem.time = time
			queue.append(elem)
			return
	
	if text == "":
		active = false
		return
		
	active = true
	
	var s = ""
	if actor == "":
		s = "[color=%s]%s" % [ textColor.to_html(false), text ]
	else:
		s = "[color=%s]%s: [color=%s]%s" % [ actorColor.to_html(false), actor, textColor.to_html(false), text ]
	
	self.get_node("Text").text = s
	
	timer = time
	if time == 0:
		if !player:
			player = Utils.find_player()
		if player:
			player.set_hold(true)
	
func _process(delta):
	if active:
		# Move up
		position.y = clamp(position.y - delta * openCloseSpeed, OPEN_POS_Y, CLOSE_POS_Y)
	else:
		# Move down
		position.y = clamp(position.y + delta * openCloseSpeed, OPEN_POS_Y, CLOSE_POS_Y)
		
	if timer > 0:
		timer -= delta
		if timer <= 0:
			skip()
	
func skip():
	if queue.is_empty():
		active = false
		if player:
			player.set_hold(false)
		return false
		
	var item = queue.pop_front()
	
	display(item.text, item.textColor, item.actorName, item.actorColor, item.time, true)
	
	return true
