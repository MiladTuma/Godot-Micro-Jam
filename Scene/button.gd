extends Button


func _on_book_opening_pressed() -> void:
	if Global.food >= 4:
		Global.days_before_hungry = 3
		Global.food -= 4
