extends Control

@onready var width_selector: IntSelector = $WidthSelector
@onready var height_selector: IntSelector = $HeightSelector
@onready var modulo_selector: IntSelector = $ModuloSelector


func _on_start_button_pressed() -> void:
	grid_metadata.set_metadata(width_selector.value,height_selector.value,modulo_selector.value)
	get_tree().change_scene_to_packed(GridMetadata.GAME_SCENE)
