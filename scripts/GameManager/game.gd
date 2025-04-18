extends Node2D

const CENTER_OF_SCREEN: Vector2 = Vector2(270, 480)
const GRID_CONTAIN_SIZE: Vector2 = Vector2(540 * 0.8, 960 * 0.8)

@onready var win_menu: CanvasLayer = $WinMenu
@onready var undo: Undo = $CanvasLayer/Undo
@onready var hint: Hint = $CanvasLayer/Hint
@onready var quit_menu: CanvasLayer = $QuitMenu

var grid: Grid

func _ready() -> void:
	_init_grid()
	undo.grid = grid
	hint.grid = grid
	
	grid.generate_pattern()

func _init_grid() -> void:
	grid = Grid.new()
	grid.position = CENTER_OF_SCREEN
	grid.width = grid_metadata.width
	grid.height = grid_metadata.height
	grid.modulo = grid_metadata.modulo
	ResizeToFit.resize(grid, grid.width * Cell.SIZE, grid.height * Cell.SIZE, GRID_CONTAIN_SIZE.x, GRID_CONTAIN_SIZE.y)
	grid.win.connect(_on_win)
	add_child(grid)

func _on_win() -> void:
	win_menu.visible = true


func _on_quit_menu_button_pressed() -> void:
	quit_menu.visible = true
