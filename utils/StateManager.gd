# DO NOT USE THIS DIRECTLY, CREATE A NEW FILE AND EXTEND IT
extends Node

class_name StateManager

export(NodePath) var initial_state_node
onready var initial_state = get_node(initial_state_node)

onready var lock_timer: Timer = $LockTimer

var current_state : State
var states: Dictionary = {}
var is_locked: bool = false

# This will run before all states. If using _ready in the subclass though, it will run after.
func _ready():
	assert(initial_state != State, "Initial State Node is not a class extended from State")
	assert(lock_timer != null, "No Lock Timer attached")
	
	lock_timer.connect("timeout", self, "_on_lock_timer_timeout")
	
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.connect("transitioned", self, "on_child_transition")

	if initial_state:
		current_state = initial_state
		initial_state._on_enter()


func _process(delta):
	if current_state:
		current_state._on_update(delta)


func _physics_process(delta):
	if current_state:
		current_state._on_physics_update(delta)


func on_child_transition(state: State, new_state_name: String):
	if is_locked:
		return
		
	#	if state != current_state && current_state != null:
	#		return
		
	var new_state : State = states.get(new_state_name.to_lower())

	if !new_state:
		return
	
	if current_state:
		current_state._on_exit()
	
	current_state = new_state
	new_state._on_enter()

func lock_state(time):
	is_locked = true
	lock_timer.start(time)
	
func ignore_lock_state():
	is_locked = false
	lock_timer.stop()
	
func _on_lock_timer_timeout():
	is_locked = false
	
func check_state_by_name(state_a: String, state_b: String):
	return state_a.to_lower() == state_b.to_lower()
	
func is_current_state(state: State):
	return check_state_by_name(state.name, current_state.name)
