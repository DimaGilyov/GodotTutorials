extends CharacterBody2D

signal laser(pos, direction)

var players_nearby: bool = false
var can_laser: bool = true
var right_gun_use: bool = true

var health: int  = 30
var vulnerable: bool = true

func _process(_delta):
	if players_nearby:
		look_at(Globals.player_pos)
		if can_laser:
			var marker_node = $LaserSpawnPositions.get_child(right_gun_use)
			right_gun_use = not right_gun_use
			var pos: Vector2 = marker_node.global_position
			var direction: Vector2 = (Globals.player_pos - position).normalized()
			laser.emit(pos, direction)
			can_laser = false
			$Timers/LaserTimer.start()


func hit():
	if vulnerable:
		health -= 10
		vulnerable = false
		$Timers/HitTimer.start()
	if health <= 0:
			queue_free()
	
func _on_attack_area_body_entered(body):
	players_nearby = true


func _on_attack_area_body_exited(body):
	players_nearby = false


func _on_laser_timer_timeout():
	can_laser = true

func _on_hit_timer_timeout():
	vulnerable = true
