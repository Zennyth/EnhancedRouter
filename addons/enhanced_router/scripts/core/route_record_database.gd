@tool
@icon("res://addons/enhanced_router/icons/icons8-router-24.png")
extends ResourceDatabase
class_name RouteRecordDatabase

func is_valid(entry: RouteRecord) -> bool:
	return entry != null

func add_route_record(route_record: RouteRecord) -> void:
	if !is_valid(route_record):
		return

	_add_entry(route_record)

func remove_route_record(route_record: RouteRecord) -> void:
	_remove_entry(route_record)

func get_route_records() -> Array[RouteRecord]:
	var route_records: Array[RouteRecord] = []

	for resource in _get_resouces():
		if !is_valid(resource as RouteRecord):
			continue

		route_records.append(resource as RouteRecord)	
	
	return route_records

func get_by_id(id: String) -> RouteRecord:
	for resource in _get_resouces():
		if resource.id == id:
			return resource
	
	return null

func match_route(route: Route) -> RouteRecord:
	for route_record in get_route_records():
		if route_record.url == route.to:
			return route_record
		
	return null




func _get_property_list() -> Array:
	var result: Array = []

	result.append({ "name": "_resources", "class_name": &"", "type": 28, "hint": 23, "hint_string": "24/17:RouteRecord", "usage": 4102 })

	return result