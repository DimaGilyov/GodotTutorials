extends Sprite2D

var pos: Vector2 = Vector2.ZERO
const speed: int = 100
var test_scale: int = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pos = Vector2(300, 200)
	position = pos
	scale = Vector2(test_scale, test_scale)
	print("Logo is ready")
	print($"..".test_array)
	$"..".test_function()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pos.x += speed * delta
	position = pos
	#if pos.x > 1000:
		#pos.x = 0
	#test_scale += 1 
	#scale = Vector2(test_scale, test_scale)
