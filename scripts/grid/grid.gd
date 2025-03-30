class_name Grid extends Node2D

const CELL = preload("res://scenes/cell/cell.tscn")

signal win
signal pressed(index: Vector2i)
signal cycle(index: Vector2i, is_undo: bool)

@export var height: int = 3
@export var width: int = 3
@export var modulo: int = 2

var cells: Array[Array] #Array[Array[Cell]]
var num_of_on_bits: int = 0

func _ready() -> void: 
	Cell.modulo = modulo
	
	_init_grid()


func _init_grid() -> void:
	cells.resize(width)
	
	for x in width:
		cells[x].resize(height)
		
		var x_position: float = float(-width + 1) / 2 + x
		
		for y in height:
			var y_position: float = float(- height + 1) / 2 + y
			
			var new_cell: Cell = CELL.instantiate()
			new_cell.index = Vector2i(x, y)
			new_cell.position = Vector2(x_position, y_position) * Cell.SIZE
			new_cell.cell_pressed.connect(_on_cell_pressed)
			add_child(new_cell)
			
			cells[x][y] = new_cell

func _on_cell_pressed(index: Vector2i) -> void:
	cycle_cells(index)
	pressed.emit(index)

func cycle_cells(index: Vector2i, is_undo: bool = false) -> void:
	assert(index.x >= 0 && index.x < width && index.y >= 0 && index.y < height)
	
	cycle.emit(index, is_undo)
	
	_cycle_cell(index, is_undo)
	if index.x > 0:
		_cycle_cell(index + Vector2i(-1,0), is_undo)
	if index.x < width - 1:
		_cycle_cell(index + Vector2i(1,0), is_undo)
	if index.y > 0:
		_cycle_cell(index + Vector2i(0,-1), is_undo)
	if index.y < height - 1:
		_cycle_cell(index + Vector2i(0,1), is_undo)
	
	_check_win()

func generate_pattern() -> void:
	for x in width:
		for y in height:
			var rand_amount_of_presses: int = randi_range(0, modulo -1)
			for i in rand_amount_of_presses:
				cycle_cells(Vector2i(x,y))
	if num_of_on_bits == 0:
		generate_pattern()


func _cycle_cell(index: Vector2i, is_undo: bool = false) -> void:
	assert(index.x >= 0 && index.x < width && index.y >= 0 && index.y < height)
	
	var val_to_add: int = -1 if !is_undo else 1
	var old_val = cells[index.x][index.y].value
	
	if old_val == 0:
		num_of_on_bits += 1
	
	cells[index.x][index.y].value += val_to_add
	
	if cells[index.x][index.y].value == 0:
		num_of_on_bits -= 1



func _check_win() -> void:
	if num_of_on_bits == 0:
		win.emit()
