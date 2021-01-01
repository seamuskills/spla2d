/// @description Insert description here
// You can write your code in this editor
if page = 2{
	switch menu_index{
		case 0:
			keychange = "jump"
		break
		case 1:
			keychange = "left"
		break
		case 2:
			keychange = "right"
		break
		case 3:
			keychange = "bomb"
		break
		case 4:
			keychange = "zoom"
		break
		case 5:
			if not obj_optionshandler.gp{
				if gamepad_is_connected(0){
					obj_optionshandler.gp = true
					show_debug_message("controller")
				}else{
					obj_optionshandler.gp = false
					show_message("controller not found")
				}
			}else{
				obj_optionshandler.gp = false
			}
		break
		case 6:
			page = 0
			buttons = array_length(button[page])
		break
	}
}else{
if page = 0{
	switch menu_index{
		case 0:
			room_goto(room0)
		break
		case 1:
			page = 4
			buttons = array_length(button[page])
		break
		case 2:
			room_goto(obj_optionshandler.lu)
		break
		case 3:
			page = 1
			buttons = array_length(button[page])
		break
		case 4:
			page = 2
			buttons = array_length(button[page])
		break
		case 5:
			page =  3
			buttons = array_length(button[page])
		break;
		case 6:
			game_end()
		break
	}
}else{
if page = 1{
	switch menu_index{
		case 0:
			col_selected = (col_selected+1) mod array_length(colors)
			obj_optionshandler.pcolor = col_selected
		break
		case 1:
			obj_optionshandler.mb = !obj_optionshandler.mb
		break
		case 2:
			weapon += 1
			if weapon > 1{
				weapon = 0
			}
			obj_optionshandler.wpn = weapon
		break
		case 3:
			bomb += 1
			bomb = bomb mod 3
			obj_optionshandler.bomb = bomb
		break
		case 4:
			obj_optionshandler.hc = !obj_optionshandler.hc
		break
		case 5:
			url_open("https://forms.gle/wdGoHPQePx8iwR137")
		break;
		case 6:
			page = 0
			buttons = array_length(button[page])
		break
	}
}else{
if page = 4{
	if menu_index = obj_optionshandler.lu{
		page = 0
		buttons = array_length(button[page])
	}else{
		room_goto(menu_index+1)
	}
}else{
if page = 3{
	switch menu_index{
		case 0:
			page = 0
			buttons = array_length(button[page])
		break
	}
}
}
}}}