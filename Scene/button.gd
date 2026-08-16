extends Button

func _ready():
	# Альтернативный способ подключения в коде
	# mouse_entered.connect(_on_button_hover)
	# mouse_exited.connect(_on_button_unhover)
	pass

func _on_mouse_entered():
	print("Курсор на кнопке!")
	text = "Наведен"

func _on_mouse_exited():
	print("Курсор ушел")
	text = "Нажми меня"
