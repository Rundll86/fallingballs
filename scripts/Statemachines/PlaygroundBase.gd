@tool
extends StaticBody2D
class_name PlaygroundBase

@export var borderColor: Color = Color.BLACK
@export var borderPolygon: Array[Vector2] = []
@export var backgroundColor: Color = Color.WHITE

@onready var hitbox: CollisionPolygon2D = $"%hitbox"
@onready var texture: AnchoredPolygon = $"%texture"
@onready var background: AnchoredPolygon = $"%background"

func _process(_delta):
	texture.color = borderColor
	texture.anchor = borderPolygon
	hitbox.polygon = texture.polygon
	background.color = backgroundColor
