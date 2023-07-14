@icon("res://Assets/Sprites/Damage.svg")
extends Node2D
class_name Shooter


@export_category("Bullet")
@export var bullet_type : PackedScene
@export var bullet_speed: int = 1000

@onready var gun = Sprite2D.new()

@onready var Player = get_parent()


func _ready():
	
	gun.texture = preload("res://icon.svg")
	gun.apply_scale(Vector2.ONE/5)
	gun.self_modulate = Color.BLACK
	gun.offset = Vector2.RIGHT*64
	
	add_child(gun)



func aim(direction: Vector2):
	gun.look_at(direction)

func shoot(node:Object):
	if node.charge <= 0:
		return
	var bullet : Bullet = bullet_type.instantiate()
	bullet.rotate(gun.rotation)
	bullet.speed = 1000
	bullet.position = global_position + Vector2.RIGHT.rotated(gun.rotation)*24
	node.get_parent().add_child(bullet)
	node.charge -= 5
	




