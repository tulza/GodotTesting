class_name Player

extends CharacterBody2D

@export var speed: float = 150.0
@export var acceleration: float = 1.05
@export var gravity: float = 600.0
@export var jump_velocity: float = 250.0
@export var jump_powerup: float = 550.0

@export var max_health: int = 3

@onready var sprite: AnimatedSprite2D = $Sprite

var health: int
var taking_damage:bool = false

func _ready() -> void:
	Global.UI.health_container.create_health(max_health)
	health = max_health

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

func apply_damage_jump() -> void:
	velocity.y = -jump_velocity * 1.5
	velocity.x = -100.0

func take_damage() -> void:
	health -= 1
	Global.UI.health_container.update_health(health)
	
	if health == 0:
		Global.UI.game_over.set_visible(true)
		
func add_health() -> void:
	if health < max_health:
		health += 1
		Global.UI.health_container.update_health(health)	

func powerup_jump() -> void:
	var old_jump_vel = jump_velocity
	jump_velocity = jump_powerup
	await get_tree().create_timer(3).timeout
	jump_velocity = old_jump_vel
