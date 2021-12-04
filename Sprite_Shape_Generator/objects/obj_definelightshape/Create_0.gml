/// @description Initialize variables

/*
This tool is used to place points in a sprite and save each coordinate,
this can be useful to define shapes for things like lighting systems that support collisions
*/

Spritesurf = -4;               //Sprite canvas
Spritefile = -4;               //The sprite in use
Spritesize = 8;               //Size of the sprite

Filename   = "";               //Name of the image file
W=0; H=0;                      //Width and height variables

Pointlist = ds_list_create();  //Create the point list
PointPos   = 0;                //Position in the list

CellX=0;                       //Cell X position
CellY=0;                       //Cell Y position

viewShape = false;             //If this should render a vertex shape while editing

msg=0;                         //Used to get the filename result when saving
filesave = "";                 //File name when saving