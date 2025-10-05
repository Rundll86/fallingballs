extends BulletBase

func ai():
	forward()
func enterWall(_wall: WallBase):
	if randf() < (1.0 - launcher.penerate):
		tryDie()
