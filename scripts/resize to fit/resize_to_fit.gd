class_name ResizeToFit

static func resize(node: Node2D, node_width: float, node_height: float, target_width: float, target_height: float) -> void:
	var new_size: float = min(target_width / node_width, target_height / node_height)
	node.scale = Vector2(new_size, new_size)
