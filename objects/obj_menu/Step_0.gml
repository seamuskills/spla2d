/// @description Insert description here
// You can write your code in this editor
menu_move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up)

menu_index += menu_move
if menu_index < 0{
	menu_index = buttons - 1
}
if menu_index > buttons - 1{
	menu_index = 0
}

if menu_index != last_selected{
	audio_play_sound(sfx_jump,1,false)
}

last_selected = menu_index
if obj_optionshandler.hc = false{button[1][3] = "Hard Core Mode: off"}
if obj_optionshandler.hc = true{button[1][3] = "Hard Core Mode: on"}
if obj_optionshandler.mb = false{button[1][1] = "Motion Blur for bullets: off"}
if obj_optionshandler.mb = true{button[1][1] = "Motion Blur for bullets: on"}

if keychange = "jump"{
	button[2][0] = "jump: press a key"
	if (keyboard_key != 0 and keyboard_key != vk_enter){
		obj_optionshandler.mctrl[0] = chr(keyboard_key)
		keychange = undefined
	}
}else{
	button[2][0] = "jump: "+ obj_optionshandler.mctrl[0]
}
if keychange = "left"{
	button[2][1] = "left: press a key"
	if (keyboard_key != 0 and keyboard_key != vk_enter){
		obj_optionshandler.mctrl[1] = chr(keyboard_key)
		keychange = undefined
	}
}else{
	button[2][1] = "left: "+ obj_optionshandler.mctrl[1]
}
if keychange = "right"{
	button[2][2] = "right: press a key"
	if (keyboard_key != 0 and keyboard_key != vk_enter){
		obj_optionshandler.mctrl[2] = chr(keyboard_key)
		keychange = undefined
	}
}else{
	button[2][2] = "right: "+ obj_optionshandler.mctrl[2]
}
if keychange = "bomb"{
	button[2][3] = "bomb: press a key"
	if (keyboard_key != 0 and keyboard_key != vk_enter){
		obj_optionshandler.auxctrl[1] = chr(keyboard_key)
		keychange = undefined
	}
}else{
	button[2][3] = "bomb: "+ obj_optionshandler.auxctrl[1]
}
if keychange = "zoom"{
	button[2][4] = "zoom out: press a key"
	if (keyboard_key != 0 and keyboard_key != vk_enter){
		obj_optionshandler.auxctrl[0] = chr(keyboard_key)
		keychange = undefined
	}
}else{
	button[2][4] = "zoom out: "+ obj_optionshandler.auxctrl[0]
}
button[1][0] = "color: "+color_names[obj_optionshandler.pcolor]
button[1][2] = "weapon: " + weapon_names[obj_optionshandler.wpn]