extends Node

var _game_states = []
const title_state = preload("res://StateMachine/TitleScreenState.gd")

func _ready():
	push(title_state.new())
	pass
	
func push(state):
	add_child(state)
	state.on_enter()
	_game_states.push_back(state)
	
func pop():
	if(!_game_states.empty()):
		_game_states.back().on_exit()
		_game_states.pop_back()
		
func update():
	if(!_game_states.empty()):
		_game_states.back().update()

	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
