@tool
extends RigidBody2D
class_name BallBase

@export var radius: float = 10
@export var displayName: String = "未命名球"
@export var damage: float = 0

@onready var hitbox: CollisionShape2D = $"%hitbox"
@onready var mask: Circle = $"%mask"
@onready var texture: Sprite2D = $"%texture"

func _ready():
	hitbox.shape = hitbox.shape.duplicate()
	body_entered.connect(
		func(body):
			if body is WallBase:
				body.takeDamage(damage, self)
				onAttack(body)
	)
	apply_central_force(Vector2.from_angle(deg_to_rad(randf() * 360.0)) * 10000)
func _process(_delta):
	hitbox.shape.radius = radius
	mask.radius = radius
	texture.scale = (Vector2.ONE * 2 * radius) / texture.get_rect().size

func onAttack(_wall: WallBase):
	pass
