class_name Grid extends Node2D

const CELL = preload("res://scenes/cell/cell.tscn")

@export var height: int = 3
@export var width: int = 3
@export var modulo: int = 2

var _cells: Array[Array] #Array[Array[Cell]]

func _ready() -> void: 
	Cell.modulo = modulo
	
	_init_grid()


func _init_grid() -> void:
	_cells.resize(width)
	
	for x in width:
		_cells[x].resize(height)
		
		var x_position: float = float(-width + 1) / 2 + x
		
		for y in height:
			var y_position: float = float(- height + 1) / 2 + y
			
			var new_cell: Cell = CELL.instantiate()
			new_cell.index = Vector2i(x, y)
			new_cell.position = Vector2(x_position, y_position) * Cell.SIZE
			new_cell.cell_pressed.connect(_on_cell_pressed)
			add_child(new_cell)
			
			_cells[x][y] = new_cell

func _on_cell_pressed(index: Vector2i) -> void:
	assert(index.x >= 0 && index.x < width && index.y >= 0 && index.y < height)
	
	_cells[index.x][index.y].value -= 1
	if index.x > 0:
		_cells[index.x - 1][index.y].value -= 1
	if index.x < width - 1:
		_cells[index.x + 1][index.y].value -= 1
	if index.y > 0:
		_cells[index.x][index.y - 1].value -= 1
	if index.y < height - 1:
		_cells[index.x][index.y + 1].value -= 1
