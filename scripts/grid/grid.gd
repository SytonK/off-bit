class_name Grid extends Node2D

const CELL = preload("res://scenes/cell/cell.tscn")

signal win

@export var height: int = 3
@export var width: int = 3
@export var modulo: int = 2

var _cells: Array[Array] #Array[Array[Cell]]
var num_of_on_bits: int = 0: set = _set_num_of_on_bits

func _ready() -> void: 
	Cell.modulo = modulo
	
	_init_grid()
	_generate_pattern()


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
	
	_cycle(index)
	if index.x > 0:
		_cycle(index + Vector2i(-1,0))
	if index.x < width - 1:
		_cycle(index + Vector2i(1,0))
	if index.y > 0:
		_cycle(index + Vector2i(0,-1))
	if index.y < height - 1:
		_cycle(index + Vector2i(0,1))

func _generate_pattern() -> void:
	for x in width:
		for y in height:
			var rand_amount_of_presses: int = randi_range(0, modulo -1)
			for i in rand_amount_of_presses:
				_on_cell_pressed(Vector2i(x,y))
	if num_of_on_bits == 0:
		_generate_pattern()


func _cycle(index: Vector2i) -> void:
	assert(index.x >= 0 && index.x < width && index.y >= 0 && index.y < height)
	
	var old_val = _cells[index.x][index.y].value
	
	if old_val == 0:
		num_of_on_bits += 1
	
	_cells[index.x][index.y].value -= 1
	
	if _cells[index.x][index.y].value == 0:
		num_of_on_bits -= 1

func _set_num_of_on_bits(new_val: int) -> void:
	num_of_on_bits = new_val
	if num_of_on_bits == 0:
		win.emit()
