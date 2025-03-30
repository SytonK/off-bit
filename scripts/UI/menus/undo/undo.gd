class_name Undo extends TextureButton

@export var grid: Grid: set = _set_grid

var stack: Array[Vector2i] = []

func _on_cell_pressed(index: Vector2i) -> void:
	stack.append(index)

func _set_grid(new_grid: Grid) -> void:
	grid = new_grid
	grid.pressed.connect(_on_cell_pressed)

func _on_pressed() -> void:
	var index = stack.pop_back()
	if index != null:
		grid.cycle_cells(index, true)
