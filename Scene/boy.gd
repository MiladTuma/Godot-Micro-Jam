extends Node2D

@export var stats : Character


var current_hp : int
var is_currently_sick : bool
var is_currently_hurt : bool
var days_left_before_hungry : int

var current_damage_amount_sick : int
var current_damage_amount_hurt : int
var current_damage_amount_hungry : int

func _ready():
	days_left_before_hungry = Global.days_before_hungry
	
	current_damage_amount_hungry = stats.damage_amount_hungry
