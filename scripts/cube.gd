extends CharacterBody3D
class_name Player

@onready var pivot = $Pivot
@onready var mesh: Node3D = $Pivot/box_character
@onready var move_sound: AudioStreamPlayer = $AudioStreamPlayer


var cube_size = 1.0
var speed = 4.0
var rolling = false

func _physics_process(delta):
	var forward = Vector3.FORWARD
	var is_moving = false  # Flag to check if the player is moving

	if Input.is_action_pressed("ui_up"):
		roll(forward)
		is_moving = true
	elif Input.is_action_pressed("ui_down"):
		roll(-forward)
		is_moving = true
	elif Input.is_action_pressed("ui_right"):
		roll(forward.cross(Vector3.UP))
		is_moving = true
	elif Input.is_action_pressed("ui_left"):
		roll(-forward.cross(Vector3.UP))
		is_moving = true

	# Check if the player is moving and if the move_sound is not already playing
	if is_moving and not move_sound.playing:
		move_sound.play()
	# If the player is not moving and the move_sound is playing, stop it
	elif not is_moving and move_sound.playing:
		move_sound.stop()

func roll(dir):
	# Do nothing if we're currently rolling.
	if rolling:
		return
	rolling = true
	
	var space = get_world_3d().direct_space_state
	var ray = PhysicsRayQueryParameters3D.create(mesh.global_position,
			mesh.global_position + dir * cube_size, collision_mask, [self])
	var collision = space.intersect_ray(ray)
	if collision:
		rolling = false
		return

	# Step 1: Offset the pivot.
	pivot.translate(dir * cube_size / 2)
	mesh.global_translate(-dir * cube_size / 2)

	# Step 2: Animate the rotation.
	var axis = dir.cross(Vector3.DOWN)
	var tween = create_tween()
	tween.tween_property(pivot, "transform",
			pivot.transform.rotated_local(axis, PI/2), 1 / speed)
	await tween.finished

	# Step 3: Finalize the movement and reset the offset.
	transform.origin += dir * cube_size
	var b = mesh.global_transform.basis
	pivot.transform = Transform3D.IDENTITY
	mesh.position = Vector3(0, cube_size / 2, 0)
	mesh.global_transform.basis = b
	rolling = false
