extends CharacterBody2D

signal laser_shoted(laser_marker: Marker2D, direction: Vector2)
signal grenade_shoted(grenade_marker: Marker2D, direction: Vector2)

@onready var laser_timer = $LaserTimer
@onready var grenade_timer = $GrenadeTimer

var can_laser: bool = true
var can_grenade: bool = true


@export var max_speed: int = 500
var speed: int  = max_speed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("primary action") and can_laser and Globals.lasers_amount > 0:
		Globals.lasers_amount -= 1
		can_laser = false
		laser_timer.start()
		$LaserStartPositions/Marker2D/GPUParticles2D.emitting = true
		var laser_markers = $LaserStartPositions.get_children()
		var selected_marker = laser_markers[randi() % laser_markers.size()]
		var player_direction = (get_global_mouse_position() - position).normalized()
		laser_shoted.emit(selected_marker, player_direction)
		
	if Input.is_action_pressed("secondary action") and can_grenade and Globals.grenade_amount > 0:
		Globals.grenade_amount -= 1
		can_grenade = false
		grenade_timer.start()
		
		var grenade_markers = $LaserStartPositions.get_children()
		var selected_marker = grenade_markers[randi() % grenade_markers.size()]
		var player_direction = (get_global_mouse_position() - position).normalized()
		grenade_shoted.emit(selected_marker, player_direction)


func _on_laser_timer_timeout():
	can_laser = true 

func _on_grenade_timer_timeout():
	can_grenade = true
	
