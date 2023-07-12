@icon("res://Assets/Sprites/CircleOutline.svg")
extends Node2D
class_name Shooter


@export_category("Bullet")
@export var bullet_type : PackedScene
@export var bullet_speed: int = 1000

@onready var ring = Sprite2D.new()
@onready var gun = Sprite2D.new()
func _ready():
	ring.texture = preload("res://Assets/Sprites/CircleOutline.svg")
	ring.apply_scale(Vector2.ONE/2)
	
	gun.texture = preload("res://icon.svg")
	gun.apply_scale(Vector2.ONE/2)
	gun.offset = Vector2.RIGHT*64
	
	add_child(ring)
	add_child(gun)


func aim(direction: Vector2):
	gun.look_at(direction)

func shoot():
	var bullet : Bullet = bullet_type.instantiate()
	bullet.rotate(gun.rotation)
	bullet.speed = 1000
	bullet.position = global_position + Vector2.RIGHT.rotated(gun.rotation)*64
	get_parent().get_parent().add_child(bullet)
	




