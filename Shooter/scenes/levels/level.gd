extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func test_function():
	print("test_function")

func _on_player_laser_shoted(laser_marker: Marker2D, direction: Vector2):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = laser_marker.global_position
	laser.direction = direction
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	$Projectiles.add_child(laser)
	$UI.update_laser_text()

func _on_player_grenade_shoted(grenade_marker: Marker2D, direction: Vector2):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = grenade_marker.global_position
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
	$UI.update_grenade_text()

func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1, 1), 1)


func _on_house_player_exited():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.5, 0.5), 1)


func _on_player_update_stats():
	$UI.update_laser_text()
	$UI.update_grenade_text()
