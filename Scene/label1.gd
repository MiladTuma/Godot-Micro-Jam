extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_craft_spear_mouse_entered() -> void:
	if Global.stick <= 3 && Global.rope <= 2 && Global.stone <= 2:
		text = "Stick = 2\nRope = 1\nStone = 1"
		%Spear_items.add_theme_color_override("font_color", Color.RED)
	else:
		text = "Stick = 2\nRope = 1\nStone = 1"
		%Spear_items.add_theme_color_override("font_color", Color.WHITE)
		


func _on_craft_spear_mouse_exited() -> void:
	text = ""


func _on_craft_rope_mouse_entered() -> void:
	if Global.leather <= 4:
		text = "leather = 3"
		%Spear_items.add_theme_color_override("font_color", Color.RED)
	else:
		text = "leather = 3"
		%Spear_items.add_theme_color_override("font_color", Color.WHITE)

func _on_craft_rope_mouse_exited() -> void:
	text = ""
	
