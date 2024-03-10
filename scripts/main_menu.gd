extends CanvasLayer

func _on_start_game_pressed() -> void:
	print("Game Starting")

func _on_credits_pressed() -> void:
	print("Credits")

func _on_quit_pressed() -> void:
	get_tree().quit()
