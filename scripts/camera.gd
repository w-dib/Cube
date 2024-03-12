extends Node3D

var cam_offset = Vector3(0, 6, 6)
var cam_speed = 3.0

func _process(delta):
	$Camera3D.position = lerp($Camera3D.position, $Cube.position + cam_offset, cam_speed * delta)
	
func _on_exit_body_entered(body: Node3D) -> void:
	if body is Player:
		get_tree().reload_current_scene()
