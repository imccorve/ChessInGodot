extends Node


var StartNewButton
var SavedNewButton

var title_scene = load("res://StateMachine/MainScreenState.tscn")
var instanced_scene
func _setup():

	StartNewButton = instanced_scene.get_child(0).get_node("OptionButtonContainer").get_child(0)
	SavedNewButton = instanced_scene.get_child(0).get_node("OptionButtonContainer").get_child(0)
#
	StartNewButton.connect("pressed", self, "_start_button_pressed")
##	SavedNewButton.connect("pressed", self, "_saved_button_pressed", [SavedNewButton])
#	SavedNewButton.connect("pressed", self, "_saved_button_pressed", [SavedNewButton])
#
	pass
func _start_button_pressed():
	
	pass  

func on_enter():
	instanced_scene = title_scene.instance()
	print(instanced_scene.get_child(0).get_name())
#	get_tree().change_scene("res://StateMachine/MainScreenState.tscn")
	get_tree().get_root().get_child(1).add_child(instanced_scene)
#	get_tree().change_scene(scene)
	_setup()

	pass

func on_exit():
	pass

func update():
	pass


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
