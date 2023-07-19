extends Polygon2D
class_name CustomParticles


@export var particle_instance:PackedScene

func _ready():
	if !visible:
		return
	
	for i in polygon.size():
		var particle = particle_instance.instantiate()
		particle.position = polygon[i]
		particle.rotation = i*PI
		print(particle.rotation)
		add_child(particle)
		
		
	

