class_name PartSelector extends Control

@export var parts: Array[Node2D]

@onready var back_button: Button = $BackButton
@onready var next_button: Button = $NextButton

var current_part: int = 0: set = _set_curr_part

func _ready() -> void:
	for i in parts.size():
		if i != 0:
			parts[i].visible = false

func _set_curr_part(new_val: int) -> void:
	back_button.disabled = new_val == 0
	next_button.disabled = new_val == parts.size() - 1
	
	parts[current_part].visible = false
	current_part = clampi(new_val, 0, parts.size())
	parts[current_part].visible = true

func _on_back_button_pressed() -> void:
	current_part -= 1


func _on_next_button_pressed() -> void:
	current_part += 1
