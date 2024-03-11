extends CanvasLayer

@export var level_0: PackedScene

func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_packed(level_0)

func _on_credits_pressed() -> void:
	print("Credits")

func _on_quit_pressed() -> void:
	get_tree().quit()
