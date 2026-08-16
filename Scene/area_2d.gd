extends Area2D

var is_dragging = false
var offset = Vector2.ZERO
var start_position = Vector2.ZERO
var current_slot = null

func _ready():
	start_position = global_position

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			_start_drag()
		elif not event.pressed and is_dragging:
			is_dragging = false
			_drop_item()

func _start_drag():
	is_dragging = true
	offset = global_position - get_global_mouse_position()
	z_index = 10

	if current_slot != null:
		current_slot.vacate(self)
		var world_pos = global_position
		reparent(get_tree().current_scene)
		global_position = world_pos
		current_slot = null

func _process(_delta):
	if is_dragging:
		global_position = get_global_mouse_position() + offset

func _drop_item():
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsPointQueryParameters2D.new()
	query.position = get_global_mouse_position()
	query.collision_mask = 2
	query.collide_with_areas = true
	query.collide_with_bodies = false
	query.exclude = [self.get_rid()]

	var collision = space_state.intersect_point(query)
	var dropped_in_slot = false

	for result in collision:
		if result.collider.has_method("receive_item"):
			if result.collider.is_occupied() and result.collider.occupied_item != self:
				continue

			print("Found slot! Dropping item into: ", result.collider.name)
			result.collider.receive_item(self)
			current_slot = result.collider
			start_position = global_position
			dropped_in_slot = true
			z_index = 0
			break

	if not dropped_in_slot:
		global_position = start_position
		z_index = 0
