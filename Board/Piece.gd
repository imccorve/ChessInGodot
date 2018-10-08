extends Node

var piece_name
var color 
var texture
var list_of_moves = []

#var b_texture = preload("res://Assets/b_rook_1x_ns.png")

var chessCardinals
var chessDiagonals

export (String, FILE) var json_file = null

func _ready():
	chessCardinals = [[1,0],[0,1],[-1,0],[0,-1]]
	chessDiagonals = [[1,1],[-1,1],[1,-1],[-1,-1]]
	pass

func possibleMoves(row, col):
	pass

func set_texture(color):
	pass
func display():
	pass

func set_board_pos(dest,px_dimensions):
	set_position(Vector2(dest[1]*px_dimensions,dest[0]*px_dimensions))


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
