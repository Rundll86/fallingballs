extends BallBase

func fibonacci(n: int) -> int:
	if n <= 0:
		return 0
	elif n == 1:
		return 1
	else:
		return fibonacci(n - 1) + fibonacci(n - 2)
func onAttack(_wall: WallBase):
	damage = fibonacci(bounceTime + 1)
