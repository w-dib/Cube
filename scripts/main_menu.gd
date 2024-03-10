extends CanvasLayer

func _on_start_game_pressed() -> void:
	hide()

func _on_credits_pressed() -> void:
	print("Credits")

func _on_quit_pressed() -> void:
	get_tree().quit()
