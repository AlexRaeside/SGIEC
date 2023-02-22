# S.G.I.E.C

The simplest game I'll ever complete

## What is the game?

A multiplayer knots and crosses game. In more detail SGIEC is a game
where each player gets a turn to place a knot or cross on tile in a 3x3 grid.
If either player completes a line with all knots or crosses they win and the
game says they win and then resets. The game has online multiplayer so one
player hosts the game on certain IP address and then other player uses that
IP address to join the game.

The game will also need some basic menus in order to start, host and join
games and I would quite like there to be a chatbox feature so players can send
each other messages.

## Why is the game?

Why make this game? Why make a very simple knots and crosses game that freewheels straight
into all the complexity of online multiplies? The short answer is that I need
to make and need to finish something. The long answer is that many of the concepts
that I'm going to try, mess up and work out at in this tiny project are things
that I'm going to use in larger projects.

I have ideas for bigger projects and all of them involve units on a grid, online
multiplayer and players taking turns with time to chat in-between. That said
I have to keep reminding my myself that right now I'm not making those games
I'm making a online knots and crosses game. If I keep trying to write code
for this game and stopping to think how I can make it modular and work for other
games, I will not be able to finish this project. It doesn't have to be
elegant or optimal, it needs to be done.

## How the game will work.

Assuming you know knots and crosses and you know Godot's system of
scene and nodes.

Knots and crosses takes place on a 3x3 grid. There are many smart
tutorials out there for grid systems but I'm going to try to make this from
scratch to get an idea of what I want and how it works.

The 3x3 grid is one scene called tileGrid and each of the nine tiles is
a separate child scene. Each of the two players will control an actor
(crossman and knotman) which will be there own scenes and they will move
from tile to tile and during their turn place a knot or cross or the tile.
The actor scene will be children of whatever tile scene they are on at the
time and so will move from being the child of one scene to another when the
the player sends input to move the actor. The knot and cross will also
be scene that are instances under the corresponding tile scene when placed.

The actors can move onto any tile but a knot or cross cannot be placed on a tile
that already has a knot or cross on it. The game ends when a line in all
knots or crosses or all 9 tiles are filled.

Controlling whose turn it is and whether the game has been won will be another
scene called turnKey. TurnKey will send a signal to an actor when it is
their turn and receive a signal when their turn has been completed.

## How does the multiplayer work?

Will get round to this.

## Scene structures and functions  


### tileGrid

A marker2D node which has 9 child scense many placed in a 3x3 grid. The 
dimensions of the grid and the nine tile is stored as variables in tileGrid 
and used by various funtions. This means if you were the resize the grid 
but not change this variable then the code falls apart. But fine for now.

The GDscript for tileGrid will have two funtions one that return the node for a tile 
given the tile coordinates in a 2d vector. So if the input is (1,2) then 
the node for tile2 is returned and if the input is outside the dimensions 
of the 3x3 grid like (1,4) then retur a NULL value. 

The second funtion will be to check if either player has one at the end of 
each turn. So when turnKey gets the signal that a turn in over, this 
function gets called.

### tile

Each tile is repesents a 64x64 square and has a sprite to show where the tile 
is. When the tile is instanced in the beginning of the game, the tile 
uses a function called get_grid_cord to work out which tile it is based 
on the postion of the tile reletaive to the the tileGrid scene. And stores 
the grid coordinates as a 2dVector. 


### actor

The actor is instacned under a random tile node and has a two functions 



### CK_mark


### turnKey
