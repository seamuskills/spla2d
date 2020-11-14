/// @description Insert description here
// You can write your code in this editor
if col_selected < 5 or keyboard_check(vk_shift){
	if col_selected + 1 < 10{
		col_selected++
	}
}else{
	col_selected = 0
}

obj_optionshandler.pcolor = col_selected
