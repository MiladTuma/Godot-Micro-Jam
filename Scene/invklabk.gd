extends Label




func _process(_delta: float) -> void:
	var hello = Global.days_before_hungry
	if hello < 0:
		hello = 0
	text = "" +str(hello)+ " Day / Days left until you
get damage "
	
	text += "\nHealth left: "+str(Global.health)+ "" 
