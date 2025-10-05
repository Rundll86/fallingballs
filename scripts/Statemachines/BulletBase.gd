extends Area2D
class_name BulletBase

class PresetAI:
	pass

@export var speed: float = 10

var launcher: BallBase

func _ready():
	area_entered.connect(
		func(area):
			if area is Winner:
				queue_free()
	)
	body_entered.connect(
		func(body):
			if body is WallBase:
				enterWall(body)
	)
func _physics_process(_delta):
	for body in get_overlapping_bodies():
		if body is WallBase:
			body.takeDamage(launcher.getDamage(), launcher)
			onAttack(body)
	ai()

func forward():
	position += Vector2.from_angle(rotation).normalized() * speed
func tryDie():
	die()
	queue_free()

func ai():
	pass
func onAttack(_wall: WallBase):
	pass
func enterWall(_wall: WallBase):
	pass
func die():
	pass

static func create(bulletScene: String, launch: BallBase, pos: Vector2, rot: float) -> BulletBase:
	var bullet = load("res://components/Scenes/Bullets/" + bulletScene + ".tscn").instantiate()
	bullet.launcher = launch
	bullet.position = pos
	bullet.rotation = rot
	return bullet
