@tool
extends StaticBody2D
class_name PlaygroundBase

@export var borderColor: Color = Color.BLACK
@export var borderPolygon: Array[Vector2] = []
@export var backgroundColor: Color = Color.WHITE

@onready var hitbox: CollisionPolygon2D = $"%hitbox"
@onready var texture: AnchoredPolygon = $"%texture"
@onready var background: AnchoredPolygon = $"%background"
@onready var ballInfo: Label = $"%ballInfo"

func _process(_delta):
	texture.color = borderColor
	texture.anchor = borderPolygon
	hitbox.polygon = texture.polygon
	background.color = backgroundColor
	ballInfo.text = getBallInfo()

func getAllBalls() -> Array[BallBase]:
	var result: Array[BallBase] = []
	for child in get_children():
		if child is BallBase:
			result.append(child)
	return result
func getBallInfo() -> String:
	var result: String = ""
	for ball in getAllBalls():
		if not ball.byClone:
			result += ball.getInfo() + "\n"
	return result
