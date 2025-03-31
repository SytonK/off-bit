extends Node2D

const MAIN_MENU_SCENE_PATH = "res://scenes/UI/menus/main menu/main_menu.tscn"

@onready var win_canvas_layer: CanvasLayer = $WinCanvasLayer

@onready var grid: Grid = $Grid

func _ready() -> void:
	grid.generate_pattern()
	grid.win.connect(_show_win_menu)

func _show_win_menu() -> void:
	win_canvas_layer.visible = true
	grid.win.disconnect(_show_win_menu)


func _on_keep_playing_button_pressed() -> void:
	win_canvas_layer.visible = false


func _on_main_menu_button_pressed() -> void:
	get_tree().change_scene_to_file(MAIN_MENU_SCENE_PATH)
