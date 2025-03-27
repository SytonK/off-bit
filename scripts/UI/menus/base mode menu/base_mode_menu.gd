extends VBoxContainer


func _on_x_3_button_pressed() -> void:
	grid_metadata.set_metadata(3,3,2)
	get_tree().change_scene_to_packed(GridMetadata.GAME_SCENE)


func _on_x_5_button_pressed() -> void:
	grid_metadata.set_metadata(5,5,2)
	get_tree().change_scene_to_packed(GridMetadata.GAME_SCENE)
