extends CanvasLayer

@export var Ressource_data : Inventory

func _on_toggle_inventory_pressed() -> void:
	visible = !visible
