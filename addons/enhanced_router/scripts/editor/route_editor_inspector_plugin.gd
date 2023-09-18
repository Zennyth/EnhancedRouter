extends EnhancedEditorInspectorPlugin

const RouteEditorInspector = preload("res://addons/enhanced_router/scripts/editor/route_editor_inspector.gd")


func _can_handle(object: Object) -> bool:
	return object is Route

func _parse_property(object: Object, type: Variant.Type, name: String, hint_type: PropertyHint, hint_string: String, usage_flags: int, wide: bool) -> bool:
	if name == "to":
		add_custom_editor_inspector_container(name, RouteEditorInspector.new(object, EnhancedRouter.route_records._get_resouces()))
		return true

	return false