extends Button

func _on_mouse_entered():
	pass
func _on_mouse_exited():
	pass


func _on_button_down() -> void:
	if Global.food >= 4:
		Global.food -= 4
		Global.days_before_hungry = 3
