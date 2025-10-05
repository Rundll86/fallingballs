extends BallBase

var canDuplicate: bool = true

func onAttack(_wall: WallBase):
	if canDuplicate:
		clone(Vector2(0, radius * -2)) # 还是不要克隆2次了，太卡了
		canDuplicate = false
func getDamage():
	return bounceTime + 1
