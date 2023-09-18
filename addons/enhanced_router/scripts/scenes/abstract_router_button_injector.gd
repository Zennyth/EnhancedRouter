@tool
@icon("res://addons/enhanced_router/icons/icons8-external-link-24.png")
extends Node
class_name AbstractRouterButtonInjector

@onready var button: Button = get_parent()

func _ready() -> void:
	if Engine.is_editor_hint():
		return
	
	button.pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	pass



func _get_configuration_warnings() -> PackedStringArray:
	var warnings: PackedStringArray = []
	
	if not get_parent() is Button:
		warnings.append("AbstractRouterButtonInjector must have a [Button] node as its parent.")

	return warnings