@icon("res://assets/icons/exit.svg")

extends Area3D
class_name ExitNode

@export var next_scene: PackedScene

func _ready() -> void:
	body_entered.connect(on_exit_node_entered)

func on_exit_node_entered(body: Node3D):
	if body is Player:
		get_tree().change_scene_to_packed(next_scene)
		
