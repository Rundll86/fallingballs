class_name BallTool

static func findBallTyped(typeClass: Script) -> Array[BallBase]:
	var result: Array[BallBase] = []
	for i in WorldManager.root.get_children():
		if i is BallBase and i.get_script() == typeClass:
			result.append(i)
	return result
