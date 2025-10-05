extends BallBase

func fibonacci(n: int) -> int: # 通项公式，有精度问题
	var sqrt5 = sqrt(5)
	var phi = (1 + sqrt5) / 2
	return round(pow(phi, n) / sqrt5)
func getDamage():
	return fibonacci(bounceTime + 1)
