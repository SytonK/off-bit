extends CanvasLayer


@onready var difficuly_label: Label = $DifficulyLabel

func _ready() -> void:
	visibility_changed.connect(_set_difficulty_label)

func _set_difficulty_label() -> void:
	var size_text: String = str(grid_metadata.width) + 'x' + str(grid_metadata.height)
	var modulo_text: String = ', Mod: ' + str(grid_metadata.modulo) if grid_metadata.modulo > 2 else ''
	difficuly_label.text = size_text +  modulo_text
