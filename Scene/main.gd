extends Node2D

@export var label : Label

@export var Men : Node2D

func _ready() -> void:
	pass

func _process(_delta: float) -> void:

	if Global.is_run_over == true:
		print("You lost")

func new_day():
	check_hunger_timer()
	
	
	if Global.health <= 0:
		Men.visible = false
	Global.health += 5
	if Global.health > 100:
		Global.health = 100
	var dialogue_resource = load("res://Dialogue Stuff (Dont Touch)/Book.dialogue")
	DialogueManager.show_dialogue_balloon(dialogue_resource, "start")
	
	if Men.visible == false:
		Global.is_run_over = true
		
	run_is_over()


func run_is_over():
	if Global.health <= 0:
		# Reset resources
		Global.food = 8
		Global.water = 5
		Global.herbs = 0
		Global.spear = 3
		Global.leather = 0
		Global.rope = 1
		Global.stick = 2
		Global.stone = 4
		
		# Reset status variables
		Global.is_run_over = false
		Global.days_before_hungry = 3
		Global.health = 100
		
		
		
		get_tree().reload_current_scene()

func check_hunger_timer():
	Global.days_before_hungry -= 1
	
	if Global.days_before_hungry <= 0:
		Global.health -= Men.current_damage_amount_hungry


func craft_spear():
	if Global.stick >= 2 and Global.stone >= 1 and Global.rope >= 1:
		Global.spear += 1
		Global.stick -= 2
		Global.rope -= 1
		
		Global.inventory_changed.emit()
	else:
		print("You dont have enough Resources")


func _on_button_button_down() -> void:
	craft_spear()




func _on_food_search_button_button_down() -> void:
	%day_inf.visible = false
	%inventory.visible = false 
	%food.visible = false
	%search_for_food.visible = true


func _on_food_change_button_button_down() -> void:
	%day_inf.visible = false
	%inventory.visible = false 
	%food.visible = true
	%search_for_food.visible = false


func _on_inventory_button_button_down() -> void:
	%day_inf.visible = false
	%inventory.visible = true
	%food.visible = false
	%search_for_food.visible = false


func _on_day_info_button_button_down() -> void:
	%day_inf.visible = true
	%inventory.visible = false 
	%food.visible = false
	%search_for_food.visible = false



	


func _on_button_mouse_entered() -> void:
	pass # Replace with function body.


func _on_craft_rope_button_down() -> void:
	if Global.stick >= 2 and Global.stone >= 1 and Global.rope >= 1:
		Global.leather -= 3
		Global.rope += 1
		
		Global.inventory_changed.emit()
	else:
		print("You dont have enough Resources")
