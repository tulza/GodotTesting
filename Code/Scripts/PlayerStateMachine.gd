class_name StateMachine

extends State

@export var current_state : State
var states: Dictionary = {}

func _ready() -> void:
	for child in get_children():
		print(child.name) #TEST
		if child is State:
			states[child.name] = child
			child.transition.connect(on_child_transition)
		else:
			push_warning("State machie contains incompatible child node")

	await owner.ready
	current_state.enter()


func _process(delta: float) -> void:
	current_state.update(delta)
	
	
func _physics_process(_delta: float) -> void:
	current_state.physics_update(_delta)
	
	
func on_child_transition(new_state_name: StringName) -> void:
	var new_state = states.get(new_state_name)
	print(new_state)
	if new_state != null:
		if new_state != current_state:
			current_state.exit()
			new_state.enter()
			current_state = new_state
	else:
		push_warning("State does not exist")

