extends CanvasLayer


@onready var difficuly_label: Label = $DifficulyLabel

func _ready() -> void:
	visibility_changed.connect(_set_difficulty_label)

func _set_difficulty_label() -> void:
	difficuly_label.text = str(grid_metadata.width) + 'x' + str(grid_metadata.height)
