@tool
@icon("res://addons/enhanced_router/icons/icons8-url-24.png")
extends Resource
class_name RouteRecord

@export var url: String
@export var packed_scene: PackedScene

var name: String:
    get: return url

@export_group("Resource")
@export var icon: Texture