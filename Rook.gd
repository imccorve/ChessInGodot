extends "res://Board/Piece.gd"

var b_texture = preload("res://Assets/b_rook_1x_ns.png")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func set_texture(color):
	if color == 'black':
		get_node("Sprite").texture = b_texture
