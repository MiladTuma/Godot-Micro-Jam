extends Node2D

@export var inventory : Inventory
@export var Men : Node2D
@export var Woman : Node2D
@export var Boy : Node2D
@export var Girl : Node2D

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	new_day()

func new_day():
	check_hunger_timer()
	check_sikness()
	check_hurt()



func check_hunger_timer():
	Men.days_left_before_hungry -= 1
	Woman.days_left_before_hungry -= 1
	Boy.days_left_before_hungry -= 1
	Girl.days_left_before_hungry -= 1
	
	if Men.days_left_before_hungry <= 0:
		print("men hungry")
	if Woman.days_left_before_hungry <= 0:
		pass
	if Boy.days_left_before_hungry <= 0:
		pass
	if Girl.days_left_before_hungry <= 0:
		pass

func check_sikness():
	if Men.is_currently_sick:
		pass
	if Woman.is_currently_sick:
		pass
	if Boy.is_currently_sick:
		pass
	if Girl.is_currently_sick:
		pass

func check_hurt():
	if Men.is_currently_hurt:
		pass
	if Woman.is_currently_hurt:
		pass
	if Boy.is_currently_hurt:
		pass
	if Girl.is_currently_hurt:
		pass

func craft_spear():
	if inventory.stick >= 2 and inventory.stone >= 1:
		inventory.spear += 1
		inventory.stick -= 2
		print("You have " + str(inventory.spear) + " spears")
	else:
		print("You dont have enough Resources")


func _on_button_button_down() -> void:
	craft_spear()
