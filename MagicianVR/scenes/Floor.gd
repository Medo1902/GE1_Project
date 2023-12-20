extends StaticBody3D

func _ready():
	# Ensure the MeshInstance3D has a material
	var mesh_instance = get_node($MeshInstance3D) as MeshInstance3D
	if mesh_instance and mesh_instance.material_override is StandardMaterial3D:
		mesh_instance.material_override = mesh_instance.material_override.duplicate()  # Duplicate to avoid changing the material globally

func _process(delta):
	var mesh_instance = get_node("MeshInstance3D") as MeshInstance3D
	if not mesh_instance or not mesh_instance.material_override:
		return

	# Generate a random color
	var new_color = Color(randf(), randf(), randf(), 1.0)

	# Apply the new color to the material
	mesh_instance.material_override.albedo_color = new_color
