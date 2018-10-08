extends Node

var player_turn = true


func _ready():
	pass

func changeTurn():
	player_turn = !player_turn

func won():
	print("You won!")
	pass

func lost():
	print("You Lost")
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
