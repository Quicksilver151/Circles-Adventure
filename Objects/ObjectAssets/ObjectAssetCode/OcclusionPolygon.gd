extends Polygon2D
class_name OcclusionPolygon

#@export_subgroup("Collision","collision_")
@export var collision = true

func _ready():
	var static_body = StaticBody2D.new()
	add_child(static_body)
	
	var collision_pol = CollisionPolygon2D.new()
	collision_pol.polygon = polygon
	collision_pol.disabled = !collision
	static_body.add_child(collision_pol)
	
	var light_occluder = LightOccluder2D.new()
	light_occluder.occluder = OccluderPolygon2D.new()
	light_occluder.occluder.polygon = polygon
	add_child(light_occluder)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
