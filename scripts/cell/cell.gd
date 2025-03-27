class_name Cell extends Node2D

@onready var label: Label = $Label


static var modulo: int = 2;

var index: Vector2i;
var value: int = 0: set = set_value;


func set_value(new_value: int):
	value = posmod(new_value, modulo)
	label.text = str(value)
