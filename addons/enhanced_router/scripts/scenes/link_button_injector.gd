extends AbstractRouterButtonInjector
class_name LinkButtonInjector

@export var route: Route

func _on_button_pressed() -> void:
	EnhancedRouter.to(route)