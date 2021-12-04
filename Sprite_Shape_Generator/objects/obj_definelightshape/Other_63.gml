/// @description Get new file name
var i_d = ds_map_find_value(async_load, "id");
if i_d == msg
    {
    if ds_map_find_value(async_load, "status")
        {
        if ds_map_find_value(async_load, "result") != ""
            {
			  filesave = ds_map_find_value(async_load, "result")
              show_debug_message("Trying to save file as '"+filesave+".txt'")
			  event_user(0);
            }
        }
    }