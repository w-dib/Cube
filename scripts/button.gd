extends Area3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var door = get_tree().get_first_node_in_group("door")
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var button_down := false

func _on_body_entered(body: Node3D) -> void:
	if !button_down:
		button_down = true
		animation_player.play("Click")
		audio_stream_player.play()
		door.open()

#func _on_body_exited(body: Node3D) -> void:
	#animation_player.play_backwards("Click")
