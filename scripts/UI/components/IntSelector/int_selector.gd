class_name IntSelector extends HBoxContainer

@export var min_value: int = 1
@export var max_value: int = 10
@export var init_value: int = min_value

@onready var int_input: LineEdit = $IntInput
@onready var reduce_button: Button = $ReduceButton
@onready var increase_button: Button = $IncreaseButton

var value: int : set = _set_value

func _ready() -> void:
	value = init_value

func _set_value(new_value: int) -> void:
	value = clampi(new_value, min_value, max_value)
	int_input.text = str(value)
	
	reduce_button.disabled = (value == min_value)
	increase_button.disabled = (value == max_value)

func _on_reduce_button_pressed() -> void:
	value -= 1


func _on_increase_button_pressed() -> void:
	value += 1


func _on_int_input_text_changed(new_text: String) -> void:
	if new_text.is_valid_int():
		value = int(new_text)
	else:
		int_input.text = str(value)
