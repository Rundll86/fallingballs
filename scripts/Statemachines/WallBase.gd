@tool
extends StaticBody2D
class_name WallBase

@export var size: Vector2 = Vector2.ONE
@export var color: Color = Color.GRAY
@export var anchor: Vector2 = Vector2.ZERO
@export var maxHealthBase: float = 100
@export var level: int = 0

@onready var hitbox: CollisionShape2D = $"%hitbox"
@onready var texture: AnchoredPolygon = $"%texture"
@onready var healthBar: Label = $"%health"
var currentHealth: float = 0

func _ready():
	hitbox.shape = hitbox.shape.duplicate()
	currentHealth = applyLevel(level + 1)
func _process(_delta):
	position = get_viewport_rect().size * anchor
	texture.anchor = ShapeUtil.rect(size)
	texture.position = get_viewport_rect().size * size / -2
	texture.color = color
	hitbox.shape.size = get_viewport_rect().size * size
	healthBar.text = str(currentHealth)
	healthBar.size = get_viewport_rect().size * size
	healthBar.position = get_viewport_rect().size * size / -2
func applyLevel(lv):
	return maxHealthBase ** lv
