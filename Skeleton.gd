extends Node2D

@onready var sprite = $AnimatedSprite2D

var last_pos: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("walk")
	$AnimationPlayer.seek(randf_range(0, $AnimationPlayer.current_animation_length))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	change_direction()

func change_direction() -> void:
	if last_pos.x - sprite.position.x > 0:
		sprite.flip_h = true
	elif last_pos.x - sprite.position.x < 0:
		sprite.flip_h = false
	last_pos = sprite.position


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.taking_damage = true
