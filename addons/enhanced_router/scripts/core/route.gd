@icon("res://addons/enhanced_router/icons/icons8-url-24.png")
extends Resource
class_name Route

@export var to: String

func _init(_to: String = "") -> void:
	to = _to