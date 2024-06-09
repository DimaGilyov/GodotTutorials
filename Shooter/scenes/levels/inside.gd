extends LevelParent


func _on_exit_gate_area_body_entered(body):
	var tween = create_tween()
	tween.tween_property($Player, "speed", 0, 0.5)
	TransitionLayer.change_scene("res://scenes/levels/outside.tscn")
