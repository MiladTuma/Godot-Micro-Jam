extends Node2D

@export var label : Label

@export var Men : Node2D
@export var Woman : Node2D
@export var Boy : Node2D
@export var Girl : Node2D

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	update_inventory()
	if Global.is_run_over == true:
		print("You lost")

func new_day():
	check_hunger_timer()
	
	if Global.health <= 0:
		Men.visible = false
		Girl.visible = false
		Woman.visible = false
		Boy.visible = false
	
	var dialogue_resource = load("res://Dialogue Stuff (Dont Touch)/Book.dialogue")
	DialogueManager.show_dialogue_balloon(dialogue_resource, "start")
	
	if Men.visible == false and Woman.visible == false and Boy.visible == false and Girl.visible == false:
		Global.is_run_over = true
		
	run_is_over()


func run_is_over():
	pass

func check_hunger_timer():
	Global.days_before_hungry -= 1
	
	if Global.days_before_hungry <= 0:
		Global.health -= Men.current_damage_amount_hungry
	if Global.days_before_hungry <= 0:
		Global.health -= Woman.current_damage_amount_hungry
	if Global.days_before_hungry <= 0:
		Global.health -= Boy.current_damage_amount_hungry
	if Global.days_before_hungry <= 0:
		Global.health -= Girl.current_damage_amount_hungry


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

func update_inventory():
	label.update_inventory()


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
