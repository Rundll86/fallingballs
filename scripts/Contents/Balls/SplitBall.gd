extends BallBase

var cloneRate = 0.05

func onAttack(_wall: WallBase):
	if randf() < cloneRate:
		clone(Vector2(0, radius * -2)).cloneRate = 0.05
		cloneRate = 0
	else:
		bounceTime += 1
		cloneRate += 0.01
func getDamage():
	return bounceTime + 1
func applyInfo():
	return "伤害：%s，克隆：%s" % [value(getDamage()), percent(cloneRate)]
