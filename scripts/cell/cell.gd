class_name Cell extends Control

const SIZE: float = 512

signal cell_pressed(index: Vector2i)

@onready var label: Label = $Label

static var modulo: int = 2;

var index: Vector2i;
var value: int = 0: set = set_value;


func set_value(new_value: int) -> void:
	value = posmod(new_value, modulo)
	label.text = str(value)

func _on_texture_button_pressed() -> void:
	cell_pressed.emit(index)
