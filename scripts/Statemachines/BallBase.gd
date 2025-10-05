@tool
extends RigidBody2D
class_name BallBase

@export var radius: float = 15
@export var displayName: String = "未命名球"
@export var damage: float = 0

@onready var hitbox: CollisionShape2D = $"%hitbox"
@onready var mask: Circle = $"%mask"
@onready var texture: Sprite2D = $"%texture"
@onready var sounds: Node2D = $"%sounds"
var bounceTime: int = 0

func _ready():
	hitbox.shape = hitbox.shape.duplicate()
	body_entered.connect(
		func(body):
			if body is WallBase:
				body.takeDamage(damage, self)
				onAttack(body)
				bounceTime += 1
				playSound("attack")
				EffectBase.create("HitWall", position + Vector2(0, radius), 0, get_parent())
	)
	apply_central_force(Vector2(10000, 0))
func _process(_delta):
	hitbox.shape.radius = radius
	mask.radius = radius
	texture.scale = (Vector2.ONE * 2 * radius) / texture.get_rect().size
	var parent = get_parent()
	if parent is PlaygroundBase:
		parent.ballInfo.text = applyInfo()

func playSound(sound: String):
	var cloned: AudioStreamPlayer2D = sounds.get_node(sound).duplicate()
	add_child(cloned)
	cloned.play()
	await cloned.finished
	cloned.queue_free()

func onAttack(_wall: WallBase):
	pass
func applyInfo():
	return "%s 伤害：%s" % [displayName, damage]
