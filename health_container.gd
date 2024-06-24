@tool

class_name health_container extends HBoxContainer

var health_item = preload("res://health_item.tscn")

var health_group: Array 

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func create_health(max: int)-> void:
	for i in max:
		var instance = health_item.instantiate()
		add_child(instance)
		health_group.append(instance)
		instance.id = i + 1

func update_health(current_health: int) -> void:
	for item: HealthItem in health_group:
		if item.id <= current_health:
			item.active = true
		else:
			item.active = false
		item.update_state()
