extends CharacterBody2D

signal laser_shoted(laser_marker: Marker2D)
signal grenade_shoted(grenade_marker: Marker2D)

@onready var laser_timer = $LaserTimer
@onready var grenade_timer = $GrenadeTimer

var can_laser: bool = true
var can_grenade: bool = true

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
		
		var laser_markers = $LaserStartPositions.get_children()
		var selected_marker = laser_markers[randi() % laser_markers.size()]
		laser_shoted.emit(selected_marker)
		
	if Input.is_action_pressed("secondary action") and can_grenade:
		can_grenade = false
		grenade_timer.start()
		
		var grenade_markers = $LaserStartPositions.get_children()
		var selected_marker = grenade_markers[randi() % grenade_markers.size()]
		grenade_shoted.emit(selected_marker)


func _on_laser_timer_timeout():
	can_laser = true 

func _on_grenade_timer_timeout():
	can_grenade = true
