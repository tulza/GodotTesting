class_name DamagePlayerState

extends State

func enter() -> void: 
	player.sprite.play("Damage")
	player.take_damage()
	player.apply_damage_jump()
	player.taking_damage = false
	
func exit() -> void: 
	pass
	
func update(_delta: float) -> void: 
	var input_vector = player.get_input_vector()
	
	player.apply_movement(input_vector/2.0, _delta)
	player.change_direction(-input_vector.x)
	
	player.apply_gravity(_delta)
	player.apply_velocity(_delta)
	
	if player.velocity == Vector2(0,0):
		transition.emit("IdlePlayerState")
		
	if player.is_on_floor():
		transition.emit("IdlePlayerState")
	
func physics_update(_delta: float) -> void: 
	pass


