extends Label


var items = ["meat", "herbs", "water", "leather", "rope", "stick", "stone", "spear"]

func _ready():
	Global.inventory_changed.connect(update_inventory)
	update_inventory()


func update_inventory():
	text = ""

	for item in items:
		text += item.capitalize() + ": " + str(Global.get(item)) + "\n"
