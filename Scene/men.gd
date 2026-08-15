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
	current_hp = stats.hp
	is_currently_sick = stats.is_sick
	is_currently_hurt = stats.is_hurt
	days_left_before_hungry = stats.days_before_hungry
	
	current_damage_amount_hungry = stats.damage_amount_hungry
	current_damage_amount_hurt = stats.damage_amount_hurt
	current_damage_amount_sick = stats.damage_amount_sick
