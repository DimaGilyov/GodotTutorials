extends Node2D

var test_array: Array[String] = ["Test", "Hello", "Baba"]
# Called when the node enters the scene tree for the first time.
func _ready():
	$Logo.rotation_degrees = 90
	
	for i in test_array:
		print(i)
		
	print(test_array[0])
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Logo.rotation_degrees += 100 * delta
	
	if $Logo.pos.x > 1000:
		print("Position exceeded")
		$Logo.pos.x = 0
