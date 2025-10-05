@tool
extends Polygon2D
class_name AnchoredPolygon

@export var anchor: Array[Vector2] = []

func _process(_delta):
	polygon = getRealPolygonBy(get_viewport_rect().size)
func getRealPolygonBy(size: Vector2):
	var result: Array[Vector2] = []
	for point in anchor:
		result.append(point * size)
	return result
