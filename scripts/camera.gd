extends Node3D

@onready var v_box_container: VBoxContainer = $CanvasLayer/VBoxContainer

var cam_offset = Vector3(0, 6, 6)
var cam_speed = 3.0

func _ready() -> void:
	await get_tree().create_timer(5).timeout
	var tween = create_tween()
	tween.tween_property(v_box_container, "modulate:a", 0, 2)

func _process(delta):
	$Camera3D.position = lerp($Camera3D.position, $Cube.position + cam_offset, cam_speed * delta)
	
func _on_exit_body_entered(body: Node3D) -> void:
	if body is Player:
		get_tree().reload_current_scene()
