extends BallBase
class_name SplitBall

var maxIncreaseRate = 0.01
var cloneRate = 0.02
var cloneRateIncreaseSpeed = 0.0
var canClone = true
var maxCount = 50

func onAttack(_wall: WallBase):
	if BallTool.findBallTyped(SplitBall).size() < maxCount - 2:
		if randf() < cloneRate:
			if canClone:
				clone(Vector2(-radius, radius * -2)).cloneRate = 0.05
				clone(Vector2(radius, radius * -2)).cloneRate = 0.05
				canClone = false
			cloneRate = 0
			cloneRateIncreaseSpeed = 0
		else:
			cloneRate += cloneRateIncreaseSpeed
			cloneRateIncreaseSpeed += 0.02
			maxIncreaseRate = clamp(maxIncreaseRate - 0.001, 0.01, INF)
	else:
		maxIncreaseRate += 0.001
		bounceTime += 4
	if randf() < maxIncreaseRate:
		maxCount += 1
func getDamage():
	return bounceTime + 1
func applyInfo():
	return "伤害：%s，克隆：%s(+%s)，数量：%s/%s(+%s)" % [
		intValue(getDamage()),
		percentValue(cloneRate),
		percentValue(cloneRateIncreaseSpeed),
		BallTool.findBallTyped(SplitBall).size(),
		maxCount,
		percentValue(maxIncreaseRate)
	]
