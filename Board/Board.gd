extends Node

const dimensions = 8
const pix_dimensions = 64
var board = []
var player_pieces = []
var enemy_pieces = []

var piece_pawn = load("res://Board/Pieces/Pawn.tscn")
var piece_rook = load("res://Board/Pieces/Rook.tscn")
var piece_knight = load("res://Board/Pieces/Rook.tscn")

# For selection

func _ready():
	board = create_board()
	_instance_pieces()

# Found an easier way to determine position using tilemaps
# just use the function world_to_map provided by Tilemaps
# var pos_cell_global = get_node("TileMap").map_to_world(Vector2(1, 5)) 
# print(get_node("TileMap").world_to_map(get_viewport().get_mouse_position()))

func _instance_pieces():
	for player_pos_x in range(dimensions - 2, dimensions-1):
		for player_pos_y in range(0, dimensions):
			
			# Player pieces
			var piece_inst = piece_pawn.instance()
			add_child(piece_inst)
			board[player_pos_x][player_pos_y] = piece_inst
			piece_inst.set_position(Vector2(pix_dimensions * player_pos_y,pix_dimensions * player_pos_x))
			player_pieces.append(piece_inst)
			
			#Enemy Pieces
			var piece_inst_en = piece_pawn.instance()
			add_child(piece_inst_en)
			piece_inst_en.set_texture('black')
			board[player_pos_x - dimensions + 3][player_pos_y] = piece_inst_en
			piece_inst_en.set_position(Vector2(pix_dimensions * player_pos_y,pix_dimensions * (player_pos_x - dimensions + 3) ))
			enemy_pieces.append(piece_inst_en)
			
	# The rest of the pieces
	for player_pos_x in range(dimensions - 1, dimensions):
		for player_pos_y in range(0, 1):
			
			# Player Pieces
			var piece_inst = piece_rook.instance()
			add_child(piece_inst)
			_setNewPiece(piece_inst, Vector2(player_pos_x,player_pos_y))
			player_pieces.append(piece_inst)
			
			piece_inst = piece_rook.instance()
			add_child(piece_inst)
			_setNewPiece(piece_inst, Vector2(player_pos_x,player_pos_y + (dimensions - 1)))
			player_pieces.append(piece_inst)
			
			# Enemy Pieces
			var piece_inst_en = piece_rook.instance()
			add_child(piece_inst_en)
			piece_inst_en.set_texture('black')
			_setNewPiece(piece_inst_en, Vector2(player_pos_x - (dimensions - 1),player_pos_y))
			enemy_pieces.append(piece_inst_en)
			
			piece_inst_en = piece_rook.instance()
			add_child(piece_inst_en)
			piece_inst_en.set_texture('black')
			_setNewPiece(piece_inst_en, Vector2(player_pos_x - (dimensions - 1),player_pos_y + (dimensions - 1)))
			enemy_pieces.append(piece_inst_en)
			
	var pos_cell_global = get_node("TileMap").map_to_world(Vector2(2, 5)) 
	movePieceTM(board[0][0], Vector2(5,0))
	_print_board()

func _createNewPiece(piece_inst, pos, color, enemy):
	add_child(piece_inst)
	piece_inst.set_texture(color)
	_setNewPiece(piece_inst, pos)
	if enemy:
		enemy_pieces.append(piece_inst)
	else:
		player_pieces.append(piece_inst)

func _setNewPiece(piece_inst, pos):
	board[pos[0]][pos[1]] = piece_inst
	piece_inst.set_board_pos(pos, pix_dimensions)

func create_board():
	var new_board = []
	for row in range(0, dimensions):
		var col = []
		col.resize(dimensions)
		new_board.append(col)
	return new_board

# piece corrdinates must be switched array -> board pos
# Maybe these objects will be reused? So no queue_free()
func removePiece(src):
	var node_to_remove = board[src[0]][src[1]]
	node_to_remove.queue_free()
	board[src[0]][src[1]] = null

func movePieceTM(piece, dest):
	var global_dest = get_node("TileMap").map_to_world(dest)
	if(isValidPath(piece,dest)):
		piece.set_position(global_dest)
	else:
		print ("not valid path")
func movePiece(piece,dest,src):
	if(isValidPath(piece,dest)):
		board[dest[0]][dest[1]] = board[src[0]][src[1]]
#		board[src[0]][src[1]].set_position(Vector2(dest[1]*64,dest[0]*64))
		board[src[0]][src[1]].set_board_pos(dest,pix_dimensions)
#		board[src[0]][src[1]].translate(Vector2(dest[1]*64,dest[0]*64))
		board[src[0]][src[1]] = null
	else:
		print ("Can't be moved")



func isValidPath(piece,dest):
	if dest[0] in range(0, dimensions):
		if dest[1] in range(0, dimensions):
			if board[dest[0]][dest[1]] == null:
				return true
	return false

func _print_board():
	for i in range(0, dimensions):
		print(board[i])

#func checkForCheckMate(piece):
#	pass
func _process(delta):
#	print(get_node("TileMap").world_to_map(get_viewport().get_mouse_position()))
	pass
