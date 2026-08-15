extends Label

@export var inventory: Inventory

var items = ["meat", "berries", "herbs", "water", "leather", "rope", "stick", "stone", "spear"]

func _ready():
	inventory.inventory_changed.connect(update_inventory)
	update_inventory()


func update_inventory():
	text = ""

	for item in items:
		text += item.capitalize() + ": " + str(inventory.get(item)) + "\n"
