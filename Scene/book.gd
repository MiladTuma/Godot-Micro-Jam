extends Node2D

var day 
var inentory
var food
var search_for_food

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	check_if_button_needed()

func check_if_button_needed():
	day = %day_inf.visible
	inentory = %inventory.visible
	food = %food.visible 
	search_for_food = %search_for_food.visible 
	if day == false && inentory == false && food == false && search_for_food == false:
		%food_search_button.visible = false
		%food_change_button.visible = false
		%inventory_button.visible = false
		%day_info_button.visible = false
	else:
		%food_search_button.visible = true
		%food_change_button.visible = true
		%inventory_button.visible = true
		%day_info_button.visible = true

var is_open = false
func _on_book_opening_pressed() -> void:
	if is_open == false:
		%day_inf.visible = true
		is_open = true
	elif is_open == true:
		is_open = false
		%day_inf.visible = false
		%inventory.visible = false
		%food.visible = false
		%search_for_food.visible = false
