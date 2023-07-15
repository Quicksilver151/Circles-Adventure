extends Node2D
class_name TopDownMovement

@onready var character : CharacterBody2D = get_parent()


func _physics_process(delta):
	if visible:
		get_velocity(delta)

func get_velocity(delta):
	
	var direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	character.velocity = direction * character.SPEED
	character.move_and_slide()
	

