@tool
extends EditorPlugin

const EnhancedRouter: String = "EnhancedRouter"
const RouteEditorInspectorPlugin = preload("res://addons/enhanced_router/scripts/editor/route_editor_inspector_plugin.gd")
var route_editor_inspector_plugin: RouteEditorInspectorPlugin


func _enter_tree():
	initialize_settings()
	add_autoload_singleton(EnhancedRouter, "res://addons/enhanced_router/scripts/autoloads/enhanced_router.gd")
	route_editor_inspector_plugin = RouteEditorInspectorPlugin.new()
	add_inspector_plugin(route_editor_inspector_plugin)
	


func _exit_tree():
	remove_inspector_plugin(route_editor_inspector_plugin)
	remove_autoload_singleton(EnhancedRouter)


const SETTINGS_CATEGORY_PATH: String = "router"
const SETTINGS_DATABASE_PATH: String = SETTINGS_CATEGORY_PATH + "/database_path"

func initialize_settings() -> void:
	if ProjectSettings.has_setting(SETTINGS_DATABASE_PATH): 
		return

	ProjectSettings.set_setting(SETTINGS_DATABASE_PATH, "")
	ProjectSettings.add_property_info({
		"name": SETTINGS_DATABASE_PATH,
		"type": TYPE_STRING,
		"hint": PROPERTY_HINT_FILE
	})
	ProjectSettings.set_initial_value(SETTINGS_DATABASE_PATH, "")