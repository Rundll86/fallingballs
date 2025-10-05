extends BallBase

var canDuplicate: bool = true

func onAttack(_wall: WallBase):
	if canDuplicate:
		clone(Vector2(0, radius * -2))
		canDuplicate = false
func getDamage():
	return bounceTime ** 2
