/// @description Insert description here
// You can write your code in this editor
pause = false
wpn = 0
instances_active = true
sc = 0
pcolor = 0
if not file_exists("options.dat"){
	var root_list = ds_list_create()
	var map = ds_map_create()
	ds_list_add(root_list,map)
	ds_list_mark_as_map(root_list,ds_list_size(root_list)-1)
	ds_map_add(map,"motion_blur", true)
	ds_map_add(map,"hardcore",false)
	ds_map_add(map,"starting_lives",5)
	ds_map_add(map,"levels_unlocked",1)
	ds_map_add(map,"player_color",0)
	ds_map_add(map,"weapon",0)
	ds_map_add(map,"bomb",0)
	ds_map_add(map,"m1","W")
	ds_map_add(map,"m2","A")
	ds_map_add(map,"m3","D")
	ds_map_add(map,"a1","Q")
	ds_map_add(map,"a2","E")
	
	var wrapper = ds_map_create()
	ds_map_add_list(wrapper,"ROOT",root_list)

	var str = json_encode(wrapper)
	sc_savestrtofile("options.dat",str)

	ds_map_destroy(wrapper)
	show_debug_message("options created")
}
if file_exists("options.dat"){
	var wrapper = sc_loadjson("options.dat")
	var list = wrapper[? "ROOT"];
	for (var i=0;i<ds_list_size(list);i++){
		var map = list[| i]
		hc = map[? "hardcore"]
		mb = map[? "motion_blur"]
		lc = map[? "starting_lives"]
		lu = map[? "levels_unlocked"]
		pcolor = map[? "player_color"]
		wpn = map[? "weapon"]
		if wpn = undefined{
			wpn = 0
		}
		bomb = map[? "bomb"]
		if bomb = undefined{bomb = 0}
		for (var h=1;h<6;h++){
			if h > 3{
				if map[? "a"+(string(h-3))] = undefined{
					show_message("you are using an old options file, to fix you must go to run->%localappdata%->spla2d then delete options.dat to regenerate the file")
					game_end()
					break
				}
			}else{
				if map[? "m"+string(h)] = undefined{
					show_message("you are using an old options file, to fix you must go to run->%localappdata%->spla2d then delete options.dat to regenerate the file")
					game_end()
					break
				}
			}
		}
		mctrl=[map[?"m1"],map[?"m2"],map[?"m3"]]
		auxctrl = [map[?"a1"],map[?"a2"]]
	}
	ds_map_destroy(wrapper)
	show_debug_message("options_loaded")
}else{
	show_debug_message("no options data")
}
if gamepad_is_connected(0){
	gp = true
	show_debug_message("controller")
}else{
	gp = false
}