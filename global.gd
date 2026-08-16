extends Node

@warning_ignore("unused_signal")
signal inventory_changed

@export var meat : int = 5
@export var berries : int = 0
@export var water : int = 5
@export var herbs : int = 0
@export var spear : int = 1
@export var leather : int = 0
@export var rope : int = 1
@export var stick : int = 2
@export var stone : int = 4

@export var is_run_over : bool = false
@export var days_before_hungry : int = 2
@export var health : int = 100
