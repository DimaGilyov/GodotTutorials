extends StaticBody2D
class_name ItemContainer

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)
signal open(pos, direction)

func _ready():
	# Установить слой коллизии (3)
	#set_collision_layer(3)
	pass
