extends RigidBody2D

var speed: int = 750
var explosion_activate: bool = false
var explosion_radius: int = 400
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if explosion_activate:
		#explosion_activate = not explosion_activate
		var targets = get_tree().get_nodes_in_group("Container") + get_tree().get_nodes_in_group("Entity")
		for target in targets:
			var in_range = target.global_position.distance_to(global_position) < explosion_radius
			if "hit" in target and in_range:
				target.hit()

func expload():
	$AnimationPlayer.play("Explosion")
	explosion_activate = true
