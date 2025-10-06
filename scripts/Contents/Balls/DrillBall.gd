extends BallBase
class_name DrillBall

var count = 1.0
var penerate = 0.1

func onAttack(_wall: WallBase):
	for i in floor(count):
		get_parent().call_deferred("add_child", BulletBase.create("Drill", self, position - Vector2((radius * count) ** (1.0 / 1.5) * randf_range(-1, 1), 0), deg_to_rad(90)))
func getDamage():
	count = bounceTime * 0.15 + 1
	penerate = clamp(bounceTime * 0.005, 0, 1)
	return bounceTime + 1
func applyInfo():
	return "伤害：%s，钻头：%s，穿透：%s" % [
		intValue(getDamage()),
		floatValue(count),
		percentValue(penerate)
	]
