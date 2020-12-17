function sc_savegame() {
	var root_list = ds_list_create()

	with Par_saveobject{
		var map = ds_map_create()
		ds_list_add(root_list,map)
		ds_list_mark_as_map(root_list,ds_list_size(root_list)-1)
		var obj = object_get_name(object_index)
		ds_map_add(map,"obj",obj)
		ds_map_add(map,"y",y)
		ds_map_add(map,"x",x)
		if object_index = obj_wall{
			ds_map_add(map,"up",up)
			ds_map_add(map,"down",down)
			ds_map_add(map,"left",left)
			ds_map_add(map,"right",right)
			ds_map_add(map,"up_color",up_color)
			ds_map_add(map,"down_color",down_color)
			ds_map_add(map,"left_color",left_color)
			ds_map_add(map,"right_color",right_color)
		}
		if object_index = obj_enemy{
			ds_map_add(map,"hp",hp)
		}
		if object_index = obj_player{
			ds_map_add(map, "hp",hp)
			ds_map_add(map, "ink",ink)
		}
	}

	var wrapper = ds_map_create()
	ds_map_add_list(wrapper,"ROOT",root_list)

	var str = json_encode(wrapper)
	sc_savestrtofile("savegame.dat",str)

	ds_map_destroy(wrapper)
	show_debug_message("gamesaved")


}
