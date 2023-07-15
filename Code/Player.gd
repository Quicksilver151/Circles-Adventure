extends CharacterBody2D

var charge = 100
var CHARGE_SPEED = 20

var SPEED = 500.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	$Shooter.aim(get_global_mouse_position())
	
	$Charge.value = charge
	charge = min(charge + delta*CHARGE_SPEED, 100)
#	$Charge.tint_progress = lerp(Color.RED, Color.WHITE, charge/100)
#	$Circle.modulate = lerp(Color.RED, Color.WHITE, charge/100)
	modulate = lerp(Color.RED, Color.WHITE,  (log(charge)/4)**2.0)
	print(log(charge))
	
	if charge <= 0:
		get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
	
func _unhandled_input(event):
	if event.is_action_pressed("a_shoot"):
		$Shooter.shoot(self)
	if event.is_action_pressed("a_dash"):
		if charge > 45:
			dash()

func dash():
	charge -= 45
	SPEED *= 2.0
	await get_tree().create_timer(0.5).timeout
	SPEED /= 2.0


#func _physics_process(delta):
#	# Add the gravity.
#	if not is_on_floor():
#		velocity.y += gravity * delta
#
#	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY
#
#	var direction = Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)
#
#	move_and_slide()
#




