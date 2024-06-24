class_name FallPlayerState

extends State

func enter() -> void: 
	player.sprite.play("Fall")
	
func exit() -> void: 
	pass
	
func update(_delta: float) -> void: 
	var input_vector = player.get_input_vector()
	
	player.apply_movement(input_vector, _delta)
	player.change_direction(input_vector.x)
	
	player.apply_gravity(_delta)
	player.apply_velocity(_delta)
	
	if player.is_on_floor():
		if is_zero_approx(input_vector.x):
			transition.emit("IdlePlayerState")
		else:
			transition.emit("RunningPlayerState")
			
	if player.taking_damage == true:
		transition.emit("DamagePlayerState")
	
func physics_update(_delta: float) -> void: 
	pass
