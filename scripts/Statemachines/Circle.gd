@tool
extends Polygon2D
class_name Circle

@export var radius: float = 10
@export var cornerDetail: int = 32

func _process(_delta):
	polygon = getPolygon()
func getPolygon():
	var result: Array[Vector2] = []
	for i in cornerDetail:
		result.append(Vector2.from_angle(deg_to_rad(360.0 / cornerDetail * i)) * radius)
	return result
