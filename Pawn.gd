extends "res://Board/Piece.gd"

var b_texture = preload("res://Assets/b_pawn_1x_ns.png")

const piece_name = 'Pawn'

func possibleMoves(pos_x, pos_y):
	for i in range(1,3):
		list_of_moves.append([pos_x + i, pos_y])
	return list_of_moves

func set_texture(color):
	if color == 'black':
		get_node("Sprite").texture = b_texture
