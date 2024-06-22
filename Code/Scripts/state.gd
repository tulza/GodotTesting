class_name State

extends Node

signal transition(new_state_name: StringName)

var player: Player

func _ready() -> void: 
	await owner.ready
	player = owner as Player
	
func enter() -> void: 
	pass
	
func exit() -> void: 
	pass
	
func update(_delta: float) -> void: 
	pass
	
func physics_update(_delta: float) -> void: 
	pass
