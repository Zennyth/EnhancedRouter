@tool
@icon("res://addons/enhanced_router/icons/icons8-router-24.png")
extends Node
# EnhancedRouter

var route_records: RouteRecordDatabase
var history: StackData = StackData.new()

func _ready() -> void:
	initialize_route_records()



func to(route: Route) -> void:
	if route_records == null:
		initialize_route_records()

	var route_record: RouteRecord = route_records.match_route(route)

	if route == null:
		return push_error("Couldn't find [RouteRecord] that matches the following url '%s'" % route.to)
	
	history.push(route_record)
	get_tree().change_scene_to_packed(route_record.packed_scene)

func to_url(url: String) -> void:
	var route := Route.new(url)
	to(route)

func back() -> void:
	var previous_route_record: RouteRecord = history.pop()

	if previous_route_record == null:
		return push_error("Couldn't find any previous [RouteRecord] in history")

	get_tree().change_scene_to_packed(previous_route_record.packed_scene)




const SETTINGS_DATABASE_PATH: String = "router/database_path"

func initialize_route_records() -> void:
	var route_records_path: String = ProjectSettings.get_setting(SETTINGS_DATABASE_PATH)
	
	if route_records_path == "":
		route_records = RouteRecordDatabase.new()
	else:
		route_records = load(route_records_path)