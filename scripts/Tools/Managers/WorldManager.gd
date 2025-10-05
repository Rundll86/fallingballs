extends StaticBody2D
class_name WorldManager

static var root: Node2D
static var tree: SceneTree

func _ready():
	root = self
	tree = get_tree()
