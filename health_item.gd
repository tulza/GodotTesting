class_name HealthItem

extends Panel

@onready var sprite: Sprite2D = $Sprite2D

var battery_on = preload("res://Art/Textures/Props/battery1.png")
var battery_off = preload("res://Art/Textures/Props/battery2.png")

var active: bool = true
var id: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_state()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_state() -> void:
	if active == true:
		sprite.texture = battery_on
	else:
		sprite.texture = battery_off
