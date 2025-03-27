class_name Cell extends Node2D

signal cell_pressed(index: Vector2i)

@onready var label: Label = $Label

static var modulo: int = 2;

var index: Vector2i;
var value: int = 0: set = set_value;


func set_value(new_value: int) -> void:
	value = posmod(new_value, modulo)
	label.text = str(value)


func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event.is_action_pressed("pressed"):
		cell_pressed.emit(index)
	elif event is InputEventScreenTouch and event.is_pressed():
		cell_pressed.emit(index)
