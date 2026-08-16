extends Button

func _on_button_down() -> void:
	if Global.meat > 0:
		Global.days_before_hungry = 2
		Global.meat -= 1
