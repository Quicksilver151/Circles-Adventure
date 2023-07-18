extends Area2D
class_name Bullet

var speed = 1000
var damage = 1

var visibility_notif: VisibleOnScreenNotifier2D = VisibleOnScreenNotifier2D.new()
var vis_timer = 5
func _ready():
	add_child(visibility_notif)
	print(damage)

func _physics_process(delta):
	vis_timer = max(vis_timer-delta , 0)
	position += Vector2.RIGHT.rotated(rotation)*speed*delta
	for body in get_overlapping_bodies():
		if body.is_in_group("destructable"):
			body.queue_free()
			queue_free()
		if body is StaticBody2D:
			queue_free()
	
	if visibility_notif.is_on_screen() or vis_timer:
		return
	queue_free()
	



