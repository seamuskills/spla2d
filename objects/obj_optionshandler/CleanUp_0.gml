/// @description Insert description here
// You can write your code in this editor
var root_list = ds_list_create()
	var map = ds_map_create()
	ds_list_add(root_list,map)
	ds_list_mark_as_map(root_list,ds_list_size(root_list)-1)
	ds_map_add(map,"motion_blur", mb)
	ds_map_add(map,"hardcore",hc)
	ds_map_add(map,"starting_lives",lc)
	ds_map_add(map,"levels_unlocked",lu)
	ds_map_add(map,"player_color",pcolor)
	ds_map_add(map,"weapon",wpn)
	ds_map_add(map,"bomb",bomb)
	for (var i=1;i<4;i++){
		ds_map_add(map,"m"+string(i),mctrl[i-1])
	}
	for (var i=1;i<3;i++){
		ds_map_add(map,"a"+string(i),auxctrl[i-1])
	}
	
	var wrapper = ds_map_create()
	ds_map_add_list(wrapper,"ROOT",root_list)

	var str = json_encode(wrapper)
	sc_savestrtofile("options.dat",str)

	ds_map_destroy(wrapper)
	show_debug_message("options saved")
	
