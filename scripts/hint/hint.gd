class_name Hint extends Button

const HINT_COLOR = Color(0.5, 1, 0.5)


var grid: Grid: set = _set_grid

var presses: Array[Array] #Array[Array[int]]

var is_on: bool = false
var current_index: Vector2i = Vector2i(0, 0)

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
	
	
	_hide_hint()
	
	current_index = index
	
	if is_on:
		_show_hint()

func _set_grid(new_grid: Grid) -> void:
	grid = new_grid
	init_pressed()
	grid.cycle.connect(pressed)


func _on_toggled(toggled_on: bool) -> void:
	is_on = toggled_on
	
	if is_on:
		_show_hint()
	else:
		_hide_hint()

func _show_hint() -> void:
	var first_index: Vector2i = current_index
	
	if presses[current_index.x][current_index.y] != 0:
		grid.cells[current_index.x][current_index.y].modulate = HINT_COLOR
		return
	_hide_hint()
	_next_index()
	
	while presses[current_index.x][current_index.y] == 0:
		_hide_hint()
		_next_index()
		if current_index == first_index:
			return
		pass
	
	grid.cells[current_index.x][current_index.y].modulate = HINT_COLOR

func _hide_hint() -> void:
	grid.cells[current_index.x][current_index.y].modulate = Color(1, 1, 1)

func _next_index() -> void:
	var x: int = current_index.x
	var y: int = current_index.y
	
	if x + 1 < grid.width:
		current_index = Vector2i(x + 1,y)
		return
	if x + 1 >= grid.width:
		if y + 1 < grid.height:
			current_index = Vector2i(0, y + 1)
		else:
			current_index = Vector2i(0, 0)
