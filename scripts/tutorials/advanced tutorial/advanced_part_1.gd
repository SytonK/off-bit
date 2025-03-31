extends Node2D

@onready var grid: Grid = $Grid

func _ready() -> void:
	grid.cycle_cells(Vector2i(0,0))
