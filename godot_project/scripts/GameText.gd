extends ColorRect

class_name GameText

var timer : float = 0
var queue : Array[GameTextElement] = []
var player : Player = null


func _ready():
	visible = false

func display(text : String, textColor : Color = Color.WHITE, actor : String = "", actorColor : Color = Color.YELLOW, time : float = 0, force : bool = false):
	if visible:
		if !force:
			var elem = GameTextElement.new()
			elem.actorColor = actorColor
			elem.textColor = textColor
			elem.text = text
			elem.actor = actor
			elem.time = time
			queue.append(queue)
			return
	
	if text == "":
		visible = false
		return
		
	visible = true
	
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
	if timer > 0:
		timer -= delta
		if timer <= 0:
			skip()
	
func skip():
	if queue.is_empty():
		visible = false
		if player:
			player.set_hold(false)
		return
		
	var item = queue.pop_front()
	
	display(item.text, item.textColor, item.actor, item.actorColor, item.time, true)
