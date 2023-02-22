extends Node2D



@export_enum("one", "two") var player: String

@export_node_path("Sprite2D") var sprite


var knot_mark = preload("res://scenes/knot.tscn")
var cross_mark = preload("res://scenes/cross.tscn")



# a function that checks user input and returns the cord 

func check_movement_input():
	
	var tile_node = self.get_parent()
	var target_vector = Vector2(0,0)
	
	if player == "one":
		if Input.is_action_just_pressed("player_1_up"): # UP
			target_vector = tile_node.grid_cord + Vector2(0, -1)
		if Input.is_action_just_pressed("player_1_down"):
			target_vector = tile_node.grid_cord + Vector2(0, 1)
		if Input.is_action_just_pressed("player_1_left"):
			target_vector = tile_node.grid_cord + Vector2(-1, 0)
		if Input.is_action_just_pressed("player_1_right"):
			target_vector = tile_node.grid_cord + Vector2(1, 0)
	
	if player == "two":
		if Input.is_action_just_pressed("player_2_up"): # UP
			target_vector = tile_node.grid_cord + Vector2(0, -1)
		if Input.is_action_just_pressed("player_2_down"):
			target_vector = tile_node.grid_cord + Vector2(0, 1)
		if Input.is_action_just_pressed("player_2_left"):
			target_vector = tile_node.grid_cord + Vector2(-1, 0)
		if Input.is_action_just_pressed("player_2_right"):
			target_vector = tile_node.grid_cord + Vector2(1, 0)
	
	
	return(target_vector)

func mark_tile():
	
	
	var tile_node = self.get_parent()
	
	var grid_node = tile_node.get_parent()
	
	# if node is locked then do not run
	if tile_node.lock == true:
		return(null)
	
	if player == "one":
		var knot_instance = knot_mark.instantiate()
		tile_node.add_child(knot_instance)
	
	if player == "two":
		var cross_instance = cross_mark.instantiate()
		tile_node.add_child(cross_instance)
	
	# after the mark is placed pressed check to see if game is won
	grid_node.marks_placed += 1
	
	tile_node.lock = true
	
	grid_node.check_win(player, "knot")
	
	



# Called when the node enters the scene tree for the first time.
func _ready():
	print(self.get_parent())
	print(self.get_tree())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	
	# check for movement input
	var target_vector = check_movement_input()
	
	# check for target node 
	var target_node = self.get_parent().get_parent().get_node_from_cord(target_vector)
	
	# move to other node 
	
	if target_node != null:
		
		get_parent().remove_child(self)
		target_node.add_child(self)
	
	# check for mark input 
	
	if player == "one" and Input.is_action_just_pressed("player_1_action"):
		mark_tile()
	
	if player == "two" and Input.is_action_just_pressed("player_2_action"):
		mark_tile()
