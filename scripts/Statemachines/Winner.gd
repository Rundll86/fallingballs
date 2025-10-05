@tool
extends Area2D
class_name Winner

@export var size: Vector2 = Vector2.ONE
@export var anchor: Vector2 = Vector2.ZERO

@onready var hitbox: CollisionShape2D = $"%hitbox"
@onready var texture: AnchoredPolygon = $"%texture"

func _ready():
	hitbox.shape = hitbox.shape.duplicate()
func _process(_delta):
	texture.anchor = ShapeUtil.rect(size)
	texture.position = get_viewport_rect().size * size / -2
	hitbox.shape.size = get_viewport_rect().size * size
	position = get_viewport_rect().size * anchor
