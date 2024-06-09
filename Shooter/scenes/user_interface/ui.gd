extends CanvasLayer

@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label
@onready var grenade_label: Label = $GrenadeCounter/VBoxContainer/Label

func update_laser_text():
	laser_label.text = str(Globals.lasers_amount)

func update_grenade_text():
	grenade_label.text = str(Globals.grenade_amount)
