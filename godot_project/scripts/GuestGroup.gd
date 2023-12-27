extends Node3D

@export var nGuests : int = 8;
@export var guestProb : float = 0.5;
@export var radius : float = 2.0;
@export var guestPrefabs : Array[PackedScene];

# Called when the node enters the scene tree for the first time.
func _ready():
	var angleInc = PI * 2.0 / nGuests;
	for i in range(nGuests):
		if randf() < guestProb:
			var angle = angleInc * i + randf_range(-angleInc * 0.15, angleInc * 0.15);
			var r = radius * randf_range(0.9, 1.1);
			var p = Vector3(r * sin(angle), 0.0, r * cos(angle));
			var newGuest = guestPrefabs[randi() % guestPrefabs.size()];
			newGuest = newGuest.instantiate();
			newGuest = newGuest as PartyGuest;
			newGuest.groupCenter = self;
			newGuest.position = p;
			add_child(newGuest);
