extends Node3D

var detectionTime = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if !self.visible:
		return
	var player = Utils.find_player()
	if !player:
		return
		
	# Check if player is in distance
	var playerPos = player.global_position;
	playerPos.y = 1;
	var toPlayer : Vector3 = playerPos - global_position;
	var distance = toPlayer.length();
	if distance < 8:
		# Player in range
		# Check if it's in the cone
		var forwardVector = -global_transform.basis.z;
		toPlayer = toPlayer.normalized()
		var dp = toPlayer.dot(forwardVector);
		if dp > 0.65:
			# Check if anything between them
			var space_state = get_world_3d().direct_space_state;
			var query = PhysicsRayQueryParameters3D.create(global_position, playerPos, 1 << 0, [ self ]);
			var result = space_state.intersect_ray(query);
			if result:
				var collisionDistance = result.position.distance_to(global_position);
				if collisionDistance >= distance:
					result = null
			if !result:
				# No collision, detected player
				detectionTime += _delta
			else:
				detectionTime = 0
				
	if detectionTime > 0.2:
		GameManager.load_scene("caught_by_drone")
