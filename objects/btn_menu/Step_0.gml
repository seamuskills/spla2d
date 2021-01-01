if obj_optionshandler.gp and gamepad_button_check_released(0,gp_face1){
	obj_optionshandler.pause = false
	obj_optionshandler.alarm[0] = 2
	room_goto(menu)
}