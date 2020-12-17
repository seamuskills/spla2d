/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(vk_anykey)){
    if (keyboard_lastkey == code[code_pos]){
        code_pos++
        if (code_pos >= array_length_1d(code)){
			code_pos = 0
			room_goto(room_next(room))
        }
    }else{
		code_pos = 0
	}
}