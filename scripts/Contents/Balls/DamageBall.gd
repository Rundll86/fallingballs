extends BallBase

var increaseRate = 1.00

func onAttack(_wall: WallBase):
	increaseRate += 0.0005
func getDamage():
	return round(increaseRate ** bounceTime)
func applyInfo():
	return "伤害：%s(+%s)" % [intValue(getDamage()), percentValue(increaseRate - 1)]
