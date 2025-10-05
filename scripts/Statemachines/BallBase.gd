@tool
extends RigidBody2D
class_name BallBase

@export var radius: float = 10
@export var displayName: String = "未命名球"

@onready var hitbox: CollisionShape2D = $"%hitbox"
@onready var mask: Circle = $"%mask"
@onready var texture: Sprite2D = $"%texture"

func _ready():
	hitbox.shape = hitbox.shape.duplicate()
func _process(_delta):
	hitbox.shape.radius = radius
	mask.radius = radius
	texture.scale = (Vector2.ONE * 2 * radius) / texture.get_rect().size
