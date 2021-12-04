/// @description Editor hud

draw_set_font(Font1);
draw_set_halign(fa_center);draw_set_colour(c_white);draw_set_valign(fa_top);

//Title
draw_text_transformed(room_width/2,15,"Light shape generator",2,2,0);

//Notes
draw_set_halign(fa_right);draw_set_valign(fa_bottom);
draw_text_transformed(room_width-10,room_height-10,"Use arrows to\nscale the sprite\n\nOriginal idea by\nShaun Spalding",1,1,0);

draw_set_halign(fa_center);draw_set_valign(fa_top);

if(Spritefile==-4){
	
	draw_text(room_width/2,room_height/2,"Click to open a .png file");
	
}else{
	
	draw_text(room_width/2,20+string_height("M")*2,Filename);
	draw_text(room_width/2,22+string_height("M")*3,"Click on the image to set the various points");
	
	//Buttons
	
	var _delete = draw_button_ext(
	2,room_height-40,mouse_check_button(mb_left),"click",
	"Delete",1,2,1.5)
	
	if(_delete){
		sprite_delete(Spritefile);
		ds_list_clear(Pointlist);
		PointPos=0;
		Spritefile=-4;
	}
	
	_reset = draw_button_ext(
	2+string_width("Delete")*1.5+15,room_height-40,0,"click",
	"Reset",1,2,1.5)
	
	if(_reset){ds_list_clear(Pointlist);
		PointPos=0;}
		
	_save = draw_button_ext(
	2+string_width("Delete")*3+5,room_height-40,0,"click",
	"Save",1,2,1.5)
	
	if(_save){
	   
	   msg=get_string_async("Save file as","LightMap");
	   
	}
	
}