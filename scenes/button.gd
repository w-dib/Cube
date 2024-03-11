extends Area3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node3D) -> void:
	animation_player.play("Click")


func _on_body_exited(body: Node3D) -> void:
	animation_player.play_backwards("Click")
