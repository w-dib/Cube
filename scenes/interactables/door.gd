extends Node3D

@onready var door_wide_closed: MeshInstance3D = $"door-wide-closed"

func open() -> void:
	var tween = create_tween()
	tween.tween_property(door_wide_closed, "position", Vector3(0,1.4,0),0.8)
	await tween.finished
	door_wide_closed.hide()
