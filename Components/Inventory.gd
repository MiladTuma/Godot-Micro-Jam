class_name Inventory
extends Resource

signal inventory_changed
# Inventory Stuff
@export var meat : int = 5
@export var berries : int = 0
@export var water : int = 5
@export var herbs : int = 0
@export var spear : int = 1
@export var leather : int = 0
@export var rope : int = 1
@export var stick : int = 2
@export var stone : int = 4

var damage_because_of_hunger : int = 20
var damage_because_of_sickness : int = 5
var damage_because_of_hurt : int = 5
