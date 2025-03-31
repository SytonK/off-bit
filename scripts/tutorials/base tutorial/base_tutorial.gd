extends Node2D

const MAIN_MENU_SCENE_PATH = "res://scenes/UI/menus/main menu/main_menu.tscn"


func _on_quit_button_pressed() -> void:
	get_tree().change_scene_to_file(MAIN_MENU_SCENE_PATH)
