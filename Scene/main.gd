extends Node2D

@export var inventory : Inventory
@export var Men : Node2D
@export var Woman : Node2D
@export var Boy : Node2D
@export var Girl : Node2D

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

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
	if inventory.stick >= 2 and inventory.stone >= 1:
		inventory.spear += 1
		inventory.stick -= 2
		print("You have " + str(inventory.spear) + " spears")
	else:
		print("You dont have enough Resources")


func _on_button_button_down() -> void:
	craft_spear()
	new_day()
