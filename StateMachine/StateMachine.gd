extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
# class StateMachine
var handlers
var startState
var endStates

func _init():
	handlers = {}
	startState = null
	endStates = []

func add_state(name, handler, end_state=0):
	name = name.to_upper()
	handlers[name] = handler
	if end_state:
		endStates.append(name)

func set_start(name):
	startState = name.to_upper()
	
func run(cargo):
	handler = handlers[startState]
	
	while true:
		newState = handler(cargo)
		if newState.to_upper() in self.endStates:
			print("reached", newState)
			break
		else:
			handler = handlers[newState.to_upper()]

