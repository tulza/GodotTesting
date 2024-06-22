class_name Player

extends CharacterBody2D

@export var speed: float = 100.0
@export var acceleration: float = 1.05
@export var gravity: float = 500.0
@export var jump_velocity: float = 200.0

@onready var sprite: AnimatedSprite2D = $Sprite

func _ready() -> void:
	pass # Replace with function body.

func _process(_delta: float) -> void:
	pass

func get_input_vector() -> Vector2:
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_axis("left","right")
	return input_vector

func apply_gravity(delta: float) -> void:
	velocity.y += gravity * delta

func apply_movement(input_vector: Vector2, _delta:float) -> void:
	velocity.x = lerp(velocity.x, input_vector.x * speed, acceleration)
	
func apply_velocity(_delta: float) -> void:
	move_and_slide()
	
func change_direction(direction) -> void:
	if sign(direction) == -1:
		sprite.flip_h = true
	elif sign(direction) == 1:
		sprite.flip_h = false

func apply_jump() -> void:
	print("jump")
	velocity.y -= jump_velocity
