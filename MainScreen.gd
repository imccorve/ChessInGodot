extends Node

var StartNewButton
var SavedNewButton


	
func _ready():
#	StartNewButton = get_node("Screen/OptionButtonContainer/StartNewButton")
#	SavedNewButton = get_node("Screen/OptionButtonContainer/SavedNewButton")
##
#	StartNewButton.connect("pressed", self, "_start_button_pressed")
##	SavedNewButton.connect("pressed", self, "_saved_button_pressed", [SavedNewButton])
#	SavedNewButton.connect("pressed", self, "_saved_button_pressed", [SavedNewButton])
#
	pass
func _start_button_pressed():
	print(emit_signal("new_game_signal"))
	print("start pressed")
	pass      
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
