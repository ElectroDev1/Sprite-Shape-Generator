/// @description Save file
var _ext="";

//Check if the file already exists
while(file_exists(working_directory+filesave+string(_ext)+".txt")){
      if(_ext==""){_ext=0;}else{_ext++;}	
}


//Open file and write everything
var file = file_text_open_write(working_directory+filesave+string(_ext)+".txt");

var list = Pointlist;
var _points = ds_list_size(Pointlist);

file_text_write_string(file,"Shape coordinates, simply copy paste them into the custom shape script");
file_text_writeln(file);

//Insert the various points
for(var i=0; i<_points; i++){
	
	var _end=",";
	if(i==_points-1){_end="";}
	
	file_text_write_string(file,string(list[| i][0])+","+string(list[| i][1])+_end);
	
}

file_text_close(file);

//Open the folder and file
var _path = game_save_id;
execute_shell_simple(_path);

var _path = game_save_id + filesave+string(_ext)+".txt";
execute_shell_simple(_path);