extends Control

const ADVANCED_TUTORIAL = preload("res://scenes/tutorials/advanced tutorial/advanced_tutorial.tscn")

@onready var width_selector: IntSelector = $VBoxContainer/WidthSelector
@onready var height_selector: IntSelector = $VBoxContainer/HeightSelector
@onready var modulo_selector: IntSelector = $VBoxContainer/ModuloSelector


func _on_start_button_pressed() -> void:
	grid_metadata.set_metadata(width_selector.value,height_selector.value,modulo_selector.value)
	get_tree().change_scene_to_packed(GridMetadata.GAME_SCENE)


func _on_toturial_button_pressed() -> void:
	get_tree().change_scene_to_packed(ADVANCED_TUTORIAL)
