function sc_loadgame() {
	with Par_saveobject{
		instance_destroy()
	}
	if file_exists("savegame.dat"){
		var wrapper = sc_loadjson("savegame.dat")
		var list = wrapper[? "ROOT"];
		for (var i=0;i<ds_list_size(list);i++){
			var map = list[| i]
			var obj = map[? "obj"]
			with instance_create_layer(0,0,layer,asset_get_index(obj)){
				x = map[? "x"]
				y = map[? "y"]
				if object_index = obj_wall{
					up = map[? "up"]
					down = map[? "down"]
					left = map[? "left"]
					right = map[? "right"]
					up_color = map[? "up_color"]
					down_color = map[? "down_color"]
					left_color = map[? "left_color"]
					right_color = map[? "right_color"]
				}
				if object_index = obj_enemy{
					hp = map[? "hp"]
				}
				if object_index = obj_player{
					hp = map[? "hp"]
					ink = map[? "ink"]
				}
			}
		}
		ds_map_destroy(wrapper)
		show_debug_message("game_loaded")
	}else{
		show_debug_message("no save data")
	}



}
