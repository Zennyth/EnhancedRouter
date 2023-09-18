@tool
extends OptionButton


var object: Route
var items: Array

func _init(_object: Route, _items: Array) -> void:
	object = _object
	items = _items



func _ready() -> void:
	item_selected.connect(_on_item_selected)

	for i in len(items):
		var item = items[i]
		add_item(item.name)

		if object.to == item.url:
			_on_item_selected(i)
		
	if selected <= 0:
		_on_item_selected(0)




func _on_item_selected(index: int) -> void:
	if items.is_empty():
		return

	object.to = items[index].url
	select(index)