extends Node2D

var test_array: Array[String] = ["Test", "Hello", "Baba"]
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


func _on_player_laser_shoted():
	print("_on_player_laser_shoted") 


func _on_player_granat_shoted():
	print("_on_player_granat_shoted")
