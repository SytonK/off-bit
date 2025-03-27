class_name Grid extends Node2D

const CELL = preload("res://scenes/cell/cell.tscn")

@export var height: int = 3
@export var width: int = 3
@export var modulo: int = 2

var _cells: Array[Array] #Array[Array[Cell]]

func _ready() -> void: 
	Cell.modulo = modulo
	
	_init_grid()

func _init_cells() -> void:
	_cells.resize(width)
	for x in width:
		_cells[x].resize(height)


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
			
			_cells[x][y] = new_cell
			add_child(new_cell)
