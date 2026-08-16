extends Node

@warning_ignore("unused_signal")
signal inventory_changed

@export var food : int = 8
@export var water : int = 5
@export var herbs : int = 5
@export var spear : int = 3
@export var leather : int = 1
@export var rope : int = 1
@export var stick : int = 2
@export var stone : int = 4

@export var is_run_over : bool = false
@export var days_before_hungry : int = 3
@export var health : int = 100
