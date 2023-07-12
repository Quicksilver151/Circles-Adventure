extends Node


func _input(event):
	if event.is_action_pressed("f_fullscreen"):
		match get_window().mode:
			Window.MODE_FULLSCREEN: get_window().mode = Window.MODE_WINDOWED
			_: get_window().mode = Window.MODE_FULLSCREEN

