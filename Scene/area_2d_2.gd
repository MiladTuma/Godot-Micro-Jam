extends Area2D

var occupied_item = null

func _ready():
	collision_layer = 2

func is_occupied() -> bool:
	return occupied_item != null

func receive_item(item_node):
	item_node.reparent(self)
	item_node.position = Vector2.ZERO
	item_node.z_index = 0
	occupied_item = item_node
	print("Item attached to slot: ", name)

func vacate(item_node):
	if occupied_item == item_node:
		occupied_item = null
		print("Slot vacated: ", name)

func _on_area_2d_input_event(_viewport: Node, _event: InputEvent, _shape_idx: int) -> void:
	pass
