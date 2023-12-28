extends Node3D

@export var startTime : float = 0;
@export var startAs : bool = true;
@export var timers : Array[float];

var index = 0;
var timer = 0;
var player_inside = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	index = -1;
	timer = startTime;
	visible = startAs;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer -= delta;
	if timer < 0:
		index = (index + 1) % timers.size();
		timer = timers[index];
		visible = !visible
		if visible and player_inside:
			GameManager.load_scene("killed_by_lasers")

func _on_area_3d_body_entered(_body):
	player_inside = true
	if visible:
		GameManager.load_scene("killed_by_lasers")

func _on_area_3d_body_exited(_body):
	player_inside = false

