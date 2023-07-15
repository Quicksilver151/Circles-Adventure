extends MarginContainer



func _ready():
	for node in $VBox/Buttons.get_children():
		node.connect("name_pressed", button_press)
	

func button_press(name):
	match name:
		"Play"    : get_tree().change_scene_to_file("res://Scenes/test_scene.tscn")
		"Settings": print("opened settings")
		"Exit"    : get_tree().quit(0)
			
