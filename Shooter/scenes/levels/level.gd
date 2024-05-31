extends Node2D

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



func _on_gate_player_entered_gate(body):
	print("_on_gate_player_entered_gate") 
	print(body)


func _on_gate_player_exited_gate(body):
	print("_on_gate_player_exited_gate") 
	print(body)


func _on_player_laser_shoted(laser_marker: Marker2D):
	var laser = laser_scene.instantiate()
	laser.position = laser_marker.global_position
	$Projectiles.add_child(laser)


func _on_player_grenade_shoted(grenade_marker: Marker2D):
	var grenade = grenade_scene.instantiate()
	grenade.position = grenade_marker.global_position
	$Projectiles.add_child(grenade)
