extends Area3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var door = get_tree().get_first_node_in_group("door")

func _on_body_entered(body: Node3D) -> void:
	animation_player.play("Click")
	door.open()

#func _on_body_exited(body: Node3D) -> void:
	#animation_player.play_backwards("Click")
