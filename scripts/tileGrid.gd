extends Marker2D


var grid_dim = Vector2(3,3)
var tile_dim = Vector2(64,64)
var marks_placed = 0

# input grid cord and return node 
func get_node_from_cord(cord):
	
	
	# if out of bounds return null
	if cord[0] < 1 or cord[0] > grid_dim[0]:
		return null
	if cord[1] < 1 or cord[1] > grid_dim[1]:
		return null
	
	
	
	var y = (cord[1] - 1) * grid_dim[1]
	var x = cord[0]
	var tile_num  = x + y -1
	return(get_child(tile_num))


# check if the first three tiles are 

func check_win(player, mark_type):
	
	# First, second and third row 

	var check_array = [[$tile, $tile2, $tile3],
	[$tile4, $tile5, $tile6], [$tile7, $tile8, $tile9], 
	[$tile, $tile4, $tile7], [$tile2, $tile5, $tile8],
	[$tile3, $tile6, $tile9], [$tile, $tile5, $tile9],
	[$tile3, $tile5, $tile7]]
	
	for i in check_array:
		if win_loop(i, "knot") == true:
			print("Game won")
			game_won(i, player)

# loop for nodes and if all have the mark return True
func win_loop(node_array, mark_type):
	
	var win_vector = [false, false, false]
	
	var n = 0
	for i in node_array:
		win_vector[n] = i.has_node(mark_type)
		n += 1
	
	if not false in win_vector:
		return(true)
		
	return(false)


func game_won(win_nodes, player):
	
	# lock the tiles from further play 
	
	for i in get_children():
		i.lock = true
		
	for i in win_nodes:
		i.play_win_animation()
	
	# animate the wining nodes 
	
	# show the win screen that lets q for quit and r for replay
	


# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.position)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
