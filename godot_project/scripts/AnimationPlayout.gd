extends Node3D

class_name AnimationPlayout

@export var animListName : Array[String] = []
@export var animListProb : Array[float] = []
@export var baseSpeed : float = 1.0

@onready var animPlayer : AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	play_random_animation()

func play_random_animation():
	var speed = baseSpeed * (0.9 + randf() * 0.2)
	
	var sumProb = 0.0
	for p in animListProb:
		sumProb += p
		
	var sel = randf() * sumProb
	
	var animName = animListName[0]
	
	sumProb = 0
	for i in range(0, animListProb.size()):
		var p = animListProb[i]
		if sel < sumProb + p:
			animName = animListName[i]
			break
		sumProb += p
		
	animPlayer.play(animName, -1, speed)

func _on_animation_player_animation_finished(_anim_name):
	play_random_animation()
