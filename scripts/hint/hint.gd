class_name Hint extends CheckButton

var grid: Grid: set = _set_grid

var presses: Array[Array] #Array[Array[int]]

func init_pressed() -> void:
	presses.resize(grid.width)
	for x in grid.width:
		presses[x].resize(grid.height)
		for y in grid.height:
			presses[x][y] = 0

func pressed(index: Vector2i, is_undo: bool = false) ->  void:
	assert(index.x >= 0 && index.x < grid.width && index.y >= 0 && index.y < grid.height)
	
	var value_to_add: int = -1 if is_undo else 1
	presses[index.x][index.y] = posmod(presses[index.x][index.y] + value_to_add, grid.modulo)

func _set_grid(new_grid: Grid) -> void:
	grid = new_grid
	init_pressed()
	grid.cycle.connect(pressed)
