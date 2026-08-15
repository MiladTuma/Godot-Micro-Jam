extends Node2D

var resource = load("res://Dialogue Stuff (Dont Touch)/Book.dialogue")

func _ready() -> void:
	DialogueManager.show_dialogue_balloon(resource)
