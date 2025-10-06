extends BulletBase

func ai():
	forward()
func exitWall(_wall: WallBase):
	if launcher is DrillBall:
		if randf() < (1.0 - launcher.penerate):
			tryDie()
		elif randf() < launcher.backwardRate:
			rotation_degrees -= 180
			launcher.backwardRate -= 0.25 / launcher.count
