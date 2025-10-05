extends GPUParticles2D
class_name EffectBase

@export var oneShot: bool = true
@export var freeAfterShot: bool = true

func _ready():
	one_shot = oneShot

func shot():
	var cloned: GPUParticles2D = duplicate()
	cloned.emitting = true
	get_parent().add_child(cloned)
	if oneShot and freeAfterShot:
		await cloned.finished
		cloned.queue_free()

static func create(effectName: String, pos: Vector2, rot: float, parent: Node, startShot: bool = false):
	var effect: EffectBase = load("res://components/Scenes/Effects/" + effectName + ".tscn").instantiate()
	effect.position = pos
	effect.rotation = rot
	parent.add_child(effect)
	if startShot:
		await effect.shot()
	return effect
