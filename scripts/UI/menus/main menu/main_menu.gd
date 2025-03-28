extends CanvasLayer

@onready var back_button: Button = $BackButton
@onready var mode_selector: VBoxContainer = $MenuSwapper/ModeSelector
@onready var base_mode_menu: VBoxContainer = $MenuSwapper/BaseModeMenu
@onready var advanced_mode_menu: Control = $MenuSwapper/AdvancedModeMenu


var current_menu: Control

func _change_to_menu(menu: Control) -> void:
	mode_selector.visible = false
	back_button.visible = true
	menu.visible = true
	current_menu = menu

func _back_from_menu(menu: Control) -> void:
	mode_selector.visible = true
	back_button.visible = false
	menu.visible = false

func _on_back_button_pressed() -> void:
	_back_from_menu(current_menu)

func _on_base_mode_button_pressed() -> void:
	_change_to_menu(base_mode_menu)

func _on_advanced_mode_button_pressed() -> void:
	_change_to_menu(advanced_mode_menu)
