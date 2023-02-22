extends Node2D


# When the mouse runs of the tile this activates 


var grid_cord = Vector2(1,1)
var grid_dim = Vector2(1,1) 


# lock the tiles from further use 
# when either a mark has been placed in the 
# tile or the game has been won 

var lock = false

# a function that lets the tile check if its ready 
# for actor to move into node


func play_win_animation():
	$tileWin.play("tile_win", 2)



func get_node_from_cord(cord):
	
	if cord[0] < 1 or cord[0] > grid_dim[0]:
		return null
	if cord[1] < 1 or cord[1] > grid_dim[1]:
		return null
	
	
	
	var y = (cord[1] - 1) * grid_dim[1]
	var x = cord[0]
	var tile_num  = x + y -1
	return(get_parent().get_child(tile_num))

func get_grid_cord():
	
	var grid_dim = get_parent().tile_dim
	
	var x = self.position[0] / grid_dim[0] + 1
	var y = self.position[1] / grid_dim[1] + 1
	
	return Vector2(x, y)
	



# Called when the node enters the scene tree for the first time.
func _ready():
	
	if str(get_parent().name) == "tileGrid":
		grid_cord = get_grid_cord()
		grid_dim = get_parent().grid_dim
	
	$Label.text = str(grid_cord)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.


func _input(event):
	pass





