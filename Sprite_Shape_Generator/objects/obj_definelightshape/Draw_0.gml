/// @description Draw sprite surface
if(sprite_exists(Spritefile)){ //If the sprite has been loaded
	
   var _originX = room_width/2-W/2*Spritesize;
   var _originY = room_height/2-H/2*Spritesize;

   //Check if the mouse is in the surface
   var _T = (mouse_in_rectangle(_originX,_originY,_originX+Spritesize*W,_originY+Spritesize*H))
	
   if(!surface_exists(Spritesurf)){ Spritesurf=surface_create(W,H); }//Initilize surface
   else{	
	
     var _originX = 0;
     var _originY = 0;	
	
  	 surface_set_target(Spritesurf);
	
	    draw_clear_alpha(c_white,0);
	
	    //Draw background
	    if(_T){var A=0.5;}else{var A=0.3;}
        draw_set_alpha(A);draw_set_colour(c_white);
        draw_rectangle(_originX,_originY,_originX+W*1,_originY+H*1,0);
        draw_set_alpha(1);
	
        //Draw the sprite
		draw_sprite_ext(Spritefile,0,_originX,_originY,1,1,0,c_white,1);
   
        //Points and lines
		
		//Get the number of points
        var _points = ds_list_size(Pointlist);
   
        //Draw vertex shape
        if(viewShape){
	
	       draw_primitive_begin(pr_trianglestrip);
	       if(_points>0){
	          draw_vertex_color(Pointlist[| 0][0],Pointlist[| 0][1],c_black,0.5); 
	          for(var i=0; i<_points; i++){
		          draw_vertex_color(Pointlist[| i][0],Pointlist[| i][1],c_black,0.5);  
	          }
	       }
	       draw_primitive_end();
	
        }
		
		//Draw the points and the lines between them
        for(var i=0; i<_points; i++){
	   
	       draw_set_color(c_purple);
	       if(PointPos>1)&&(i>0){
		     draw_line_width(_originX+Pointlist[| i-1][0]*1,_originY+Pointlist[| i-1][1]*1,_originX+Pointlist[| i][0]*1,_originY+Pointlist[| i][1]*1,1);
	       }
	   
	       //Draw the points
	       draw_set_color(c_red);
	   
	       var _pointX = Pointlist[| i][0];
	       var _pointY = Pointlist[| i][1];
	   	   
	       draw_point(_originX+1*_pointX,_originY+1*_pointY);
	   
	   
        }
   
        //Mouse cursor
        draw_set_colour(c_yellow);
        draw_point(_originX+1*CellX,_originY+1*CellY);
   
	    surface_reset_target();
	 
	    var _originX = room_width/2-W/2*Spritesize;
        var _originY = room_height/2-H/2*Spritesize;	
   
        //Draw the final surface
        draw_surface_ext(Spritesurf,_originX,_originY,Spritesize,Spritesize,0,c_white,1);
	
    }
	
}