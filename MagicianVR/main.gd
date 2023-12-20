extends Node3D

var xr_interface: XRInterface
var current_scene_path = "res://scenes/main.tscn"

func _ready():
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR initialized successfully")

		# Turn off v-sync!
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

		# Change our main viewport to output to the HMD
		get_viewport().use_xr = true
	else:
		print("OpenXR not initialized, please check if your headset is connected")
		
	set_process_input(true)
		
func _input(event):
	if event.is_action_pressed("reset_scene"):
		# Reset the scene
		reset_scene()

func reset_scene():
	var new_scene = load(current_scene_path).instance()
	get_tree().root.remove_child(get_tree().current_scene)
	get_tree().root.add_child(new_scene)
	get_tree().current_scene = new_scene
