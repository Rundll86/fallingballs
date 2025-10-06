extends BallBase
class_name DrillBall

var count = 1.0
var penerate = 0.1
var penerateIncreaseRate = 0.25
var backwardRate = 0.05

func onAttack(_wall: WallBase):
	for i in floor(count):
		get_parent().call_deferred("add_child", BulletBase.create("Drill", self, position - Vector2((radius * count) ** (1.0 / 1.5) * randf_range(-1, 1), 0), deg_to_rad(90)))
	count += 0.2
	if randf() < penerateIncreaseRate:
		penerate = clamp(penerate + 0.01, 0, 1)
		penerateIncreaseRate -= 0.01
		backwardRate += 0.1
	else:
		penerateIncreaseRate += 0.02
func getDamage():
	return bounceTime + 1
func applyInfo():
	return "伤害：%s，钻头：%s，穿透：%s(+%s)，返航：%s" % [
		intValue(getDamage()),
		floatValue(count),
		percentValue(penerate),
		percentValue(penerateIncreaseRate),
		percentValue(backwardRate)
	]
