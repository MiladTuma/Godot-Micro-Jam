extends Button

@export var main : Node2D
var day_count = 0
func _on_pressed() -> void:
	day_count += 1
	text = "Next day \n Day: %d" % day_count
	main.new_day()
