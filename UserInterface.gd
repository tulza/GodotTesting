class_name UserInterface extends CanvasLayer

@onready var health_container: health_container = $HBoxContainer
@onready var game_over = $GameOver

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_over.visible = false
	Global.UI = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
