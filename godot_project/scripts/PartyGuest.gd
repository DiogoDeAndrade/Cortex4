extends AnimationPlayout

@export var heightScale : Vector2 = Vector2.ONE
@export var groupCenter : Node3D
@export var textures : Array[Texture]

# Called when the node enters the scene tree for the first time.
func _ready():
	var s = transform.basis.get_scale()
	scale = Vector3(s.x, s.y * (randf() * (heightScale.y - heightScale.x) + heightScale.x), s.z)
	
	if groupCenter:
		look_at(groupCenter.global_position, Vector3.UP, true)
		
	if textures and textures.size() > 0:
		# Find MeshInstance3D
		var meshInstance = Utils.find_node_of_type("MeshInstance3D", self)
		if meshInstance is MeshInstance3D:
			var material = meshInstance.get_surface_override_material(0)
			if material is StandardMaterial3D:
				material = material.duplicate()
				material.albedo_texture = textures[randi_range(0, textures.size() - 1)]
				meshInstance.set_surface_override_material(0, material)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
