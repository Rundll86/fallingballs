@tool
extends StaticBody2D
class_name WallBase

@export var size: Vector2 = Vector2.ONE
@export var color: Color = Color.GRAY
@export var anchor: Vector2 = Vector2.ZERO

@onready var hitbox: CollisionShape2D = $"%hitbox"
@onready var texture: AnchoredPolygon = $"%texture"

func _ready():
	hitbox.shape = hitbox.shape.duplicate()
func _process(_delta):
	position = get_viewport_rect().size * anchor
	texture.anchor = ShapeUtil.rect(size)
	texture.position = get_viewport_rect().size * size / -2
	texture.color = color
	hitbox.shape.size = get_viewport_rect().size * size
