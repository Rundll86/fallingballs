extends BallBase

var canDuplicate: bool = true

func onAttack(_wall: WallBase):
	if canDuplicate:
		var cloned = duplicate()
		get_parent().call_deferred("add_child", cloned)
		cloned.position -= Vector2(0, radius * 2)
	canDuplicate = false
func getDamage():
	return bounceTime * 5 + 1
