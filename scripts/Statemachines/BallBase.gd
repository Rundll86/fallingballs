@tool
extends RigidBody2D
class_name BallBase

@export var radius: float = 15
@export var displayName: String = "未命名球"

@onready var hitbox: CollisionShape2D = $"%hitbox"
@onready var mask: Circle = $"%mask"
@onready var texture: Sprite2D = $"%texture"
@onready var sounds: Node2D = $"%sounds"
var bounceTime: int = 0
var byClone: bool = false

func _ready():
	hitbox.shape = hitbox.shape.duplicate()
	body_entered.connect(
		func(body):
			if body is WallBase:
				body.takeDamage(getDamage(), self)
				onAttack(body)
				bounceTime += 1
				playSound("attack")
				EffectBase.create("HitWall", position + Vector2(0, radius), 0, get_parent())
	)
	apply_central_force(Vector2(10000, 0))
func _process(_delta):
	hitbox.shape.radius = radius
	mask.radius = radius
	if not byClone:
		var parent = get_parent()
		if parent is PlaygroundBase:
			parent.ballInfo.text = applyInfo()

func playSound(sound: String):
	var cloned: AudioStreamPlayer2D = sounds.get_node(sound).duplicate()
	get_tree().root.add_child(cloned)
	cloned.global_position = position
	cloned.play()
	await cloned.finished
	cloned.queue_free()
func clone(offset: Vector2):
	var cloned = duplicate()
	get_parent().call_deferred("add_child", cloned)
	cloned.byClone = true
	cloned.position += offset
	return cloned

func getDamage():
	return 1
func onAttack(_wall: WallBase):
	pass
func applyInfo():
	return "%s 伤害：%s" % [displayName, getDamage()]
