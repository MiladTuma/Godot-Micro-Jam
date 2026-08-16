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

func new_day():
	check_hunger_timer()
	check_sikness()
	check_hurt()
	
	if Men.current_hp <= 0:
		Men.visible = false
	if Woman.current_hp <= 0:
		Woman.visible = false
	if Boy.current_hp <= 0:
		Boy.visible = false
	if Girl.current_hp <= 0:
		Girl.visible = false
	
	var dialogue_resource = load("res://Dialogue Stuff (Dont Touch)/Book.dialogue")
	DialogueManager.show_dialogue_balloon(dialogue_resource, "start")




func check_hunger_timer():
	Men.days_left_before_hungry -= 1
	Woman.days_left_before_hungry -= 1
	Boy.days_left_before_hungry -= 1
	Girl.days_left_before_hungry -= 1
	
	if Men.days_left_before_hungry <= 0:
		Men.current_hp -= Men.current_damage_amount_hungry
	if Woman.days_left_before_hungry <= 0:
		Woman.current_hp -= Woman.current_damage_amount_hungry
	if Boy.days_left_before_hungry <= 0:
		Boy.current_hp -= Boy.current_damage_amount_hungry
	if Girl.days_left_before_hungry <= 0:
		Girl.current_hp -= Girl.current_damage_amount_hungry

func check_sikness():
	if Men.is_currently_sick:
		Men.current_hp -= Men.current_damage_amount_sick
	if Woman.is_currently_sick:
		Woman.current_hp -= Woman.current_damage_amount_sick
	if Boy.is_currently_sick:
		Woman.current_hp -= Woman.current_damage_amount_sick
	if Girl.is_currently_sick:
		Girl.current_hp -= Girl.current_damage_amount_sick

func check_hurt():
	if Men.is_currently_hurt:
		Men.current_hp -= Men.current_damage_amount_hurt
	if Woman.is_currently_hurt:
		Woman.current_hp -= Woman.current_damage_amount_hurt
	if Boy.is_currently_hurt:
		Boy.current_hp -= Boy.current_damage_amount_hurt
	if Girl.is_currently_hurt:
		Girl.current_hp -= Girl.current_damage_amount_hurt

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
	
	%NextDay.visible = false
	%InventoryUi.visible = false


func _on_food_change_button_button_down() -> void:
	%day_inf.visible = false
	%inventory.visible = false 
	%food.visible = true
	%search_for_food.visible = false
	
	%NextDay.visible = false
	%InventoryUi.visible = false


func _on_inventory_button_button_down() -> void:
	%day_inf.visible = false
	%inventory.visible = true
	%food.visible = false
	%search_for_food.visible = false
	
	%NextDay.visible = false
	%InventoryUi.visible = true


func _on_day_info_button_button_down() -> void:
	%day_inf.visible = true
	%inventory.visible = false 
	%food.visible = false
	%search_for_food.visible = false
	
	%NextDay.visible = true
	%InventoryUi.visible = false
