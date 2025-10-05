@tool
extends Area2D
class_name Winner

@export var size: Vector2 = Vector2.ONE
@export var anchor: Vector2 = Vector2.ZERO

@onready var hitbox: CollisionShape2D = $"%hitbox"
@onready var texture: ColorRect = $"%texture"

func _ready():
	hitbox.shape = hitbox.shape.duplicate()
	body_entered.connect(
		func(body):
			if body is BallBase:
				print("%s赢了！" % body.displayName)
	)
func _process(_delta):
	texture.size = get_viewport_rect().size * size
	texture.position = texture.size / -2
	hitbox.shape.size = get_viewport_rect().size * size
	position = get_viewport_rect().size * anchor
