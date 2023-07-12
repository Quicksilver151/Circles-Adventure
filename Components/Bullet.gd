extends Area2D
class_name Bullet

var speed = 1000



func _physics_process(delta):
	position += Vector2.RIGHT.rotated(rotation)*speed*delta
	for body in get_overlapping_bodies():
		if body.is_in_group("destructable"):
			body.queue_free()
			queue_free()

