class_name ShapeUtil

static func rect(size: Vector2 = Vector2.ONE * 100) -> Array[Vector2]:
	return [
		Vector2(0, 0),
		Vector2(size.x, 0),
		Vector2(size.x, size.y),
		Vector2(0, size.y),
	]
