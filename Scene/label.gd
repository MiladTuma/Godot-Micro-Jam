extends Label

@export var inventory : Inventory

func _process(_delta: float) -> void:
	text = ""
	text += "Meat: " + str(inventory.meat) + "\n"
	text += "Berries: " + str(inventory.berries) + "\n"
	text += "Herbs: " + str(inventory.herbs) + "\n"
	text += "Water: " + str(inventory.water) + "\n"
	text += "Leather: " + str(inventory.leather) + "\n"
	text += "Rope: " + str(inventory.rope) + "\n"
	text += "Stick: " + str(inventory.stick) + "\n"
	text += "Stone: " + str(inventory.stone) + "\n"
	text += "Spear: " + str(inventory.spear) + "\n"
