class_name GridMetadata extends Node

const GAME_SCENE = preload("res://scenes/game/game.tscn")

var width: int
var height: int
var modulo: int

func set_metadata(p_width: int, p_height: int, p_modulo: int) -> void:
	width = p_width
	height = p_height
	modulo = p_modulo
