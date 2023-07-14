extends Button
class_name NamedButton

signal name_pressed(strname)

func _ready():
	connect("pressed",self_pressed)

func self_pressed():
	emit_signal("name_pressed",self.name)
	
