extends Node2D
class_name LevelParent

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var item_scene: PackedScene = preload("res://scenes/items/item.tscn")

func _ready():
	for container in get_tree().get_nodes_in_group("Container"):
		container.connect("open", _on_container_opened)
	
	for scout in get_tree().get_nodes_in_group("Scouts"):
		scout.connect("laser", _on_scout_laser_shoted)

func _on_container_opened(pos, direction):
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = direction
	
	$Items.call_deferred("add_child", item)

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

func _on_player_grenade_shoted(grenade_marker: Marker2D, direction: Vector2):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = grenade_marker.global_position
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)
	
func _on_scout_laser_shoted(pos: Vector2, direction: Vector2):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.direction = direction
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	$Projectiles.add_child(laser)

