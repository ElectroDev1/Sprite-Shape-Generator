/// @description Editor logic

if(Spritefile==-4){   //If no sprite has been set
	
	window_set_caption("Sprite shape generator - Click to select a sprite");
	
	var file="";
	
	//Select a file
	if(mouse_check_button_pressed(mb_left)){
		file = get_open_filename("*.png","")
	}
	
	//If a file has been selected, we load it as a sprite
	if(file!=""){
	   show_debug_message("File found : '"+file+"'");	
	   Filename   = file;
	   Spritefile = sprite_add(file,0,0,0,0,0);
	   W=sprite_get_width(Spritefile);
	   H=sprite_get_height(Spritefile);
	   alarm[0]=1;
	}
	
}
else{
	
	//Change size
	if(keyboard_check_pressed(vk_up)){Spritesize++;}
	if(keyboard_check_pressed(vk_down)){if(Spritesize>1){Spritesize--;}}
	
	window_set_caption("Sprite shape generator - Editing shape");

    var _originX = room_width/2-W/2*Spritesize;
    var _originY = room_height/2-H/2*Spritesize;

    //Go through each point in the sprite and check for mouse position
    for(var a=0; a<W; a++){
	    for(var b=0; b<H; b++){
		    if(mouse_in_rectangle(_originX+Spritesize*a,_originY+Spritesize*b,_originX+Spritesize*(a+1),_originY*Spritesize*(b+1))){
			   CellX=a; CellY=b;  
		    }
	    }
    }
   
    //Add point
    if(mouse_in_rectangle(_originX,_originY,_originX+Spritesize*W,_originY+Spritesize*H)){
	   if(mouse_check_button_pressed(mb_left)){
		  Pointlist[| PointPos]=array_create(2,0);
		  Pointlist[| PointPos][0]=CellX;
		  Pointlist[| PointPos][1]=CellY;
		  show_debug_message("Added points of index "+string(PointPos)+": ["+string(CellX)+","+string(CellY)+"]");
		  PointPos++;		 
	   }
	}
		
}