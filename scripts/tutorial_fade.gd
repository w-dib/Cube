extends CanvasLayer

@onready var v_box_container: VBoxContainer = $CanvasLayer/VBoxContainer

func _ready() -> void:
	await get_tree().create_timer(5).timeout
	var tween = create_tween()
	tween.tween_property(v_box_container, "modulate:a", 0, 2)
			

