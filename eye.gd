extends Node2D

@onready var sprite = $AnimatedSprite2D

var alert: bool = false
var player: Player

func _ready() -> void:
	sprite.play("default")

func _process(delta: float) -> void:
	if alert == true:
		change_direction()

func change_direction() -> void:
	if position.x - player.position.x > 0:
		sprite.flip_h = false
	elif position.x - player.position.x < 0:
		sprite.flip_h = true
		
func _on_hitbox_body_entered(body: Node2D) -> void:
	print("hit")
	if body is Player:
		body.taking_damage = true

func _on_vision_body_entered(body: Node2D) -> void:
	print("alerted")
	if body is Player:
		alert = true
		player = body

func _on_vision_body_exited(body: Node2D) -> void:
	if body is Player:
		alert = false
		player = null
