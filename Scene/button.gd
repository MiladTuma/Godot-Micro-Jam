extends Button

func _on_button_down() -> void:
	if Global.food >= 4:
		Global.days_before_hungry = 3
		Global.food -= 4
