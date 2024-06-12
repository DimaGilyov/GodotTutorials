extends Node

signal stat_change

var lasers_amount: int = 20:
	get:
		return lasers_amount
	set(value):
		lasers_amount = value
		stat_change.emit()
		
var grenade_amount: int = 30:
	get:
		return grenade_amount
	set(value):
		grenade_amount = value
		stat_change.emit()
		
var health: int = 60: 
	get:
		return health
	set(value):
		health = value
		stat_change.emit()
		
var player_pos: Vector2
