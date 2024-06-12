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

var player_vulnerable: bool = true
var health: int = 60: 
	get:
		return health
	set(value):
		if value > health:
			health = min(value, 100)					
		elif player_vulnerable:
			health = value
			player_vulnerable = false
			playuer_invulnerable_tumer()
		stat_change.emit()

func playuer_invulnerable_tumer():
	await get_tree().create_timer(0.5).timeout
	player_vulnerable = true
	
var player_pos: Vector2
