extends CharacterBody2D

signal laser_shoted
signal granat_shoted

@onready var laser_timer = $LaserTimer
@onready var granate_timer = $GranateTimer

var can_laser: bool = true
var can_granate: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * 500
	move_and_slide()

	if Input.is_action_pressed("primary action") and can_laser:
		can_laser = false
		laser_timer.start()
		laser_shoted.emit()
		
	if Input.is_action_pressed("secondary action") and can_granate:
		can_granate = false
		granate_timer.start()
		granat_shoted.emit()


func _on_laser_timer_timeout():
	print("laser")
	can_laser = true 


func _on_granate_timer_timeout():
		print("granate")
		can_granate = true
