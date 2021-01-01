/// @description Insert description here
// You can write your code in this editor
if not room_exists(room_next(room)){
	show_message("end of the demo!, I hope you enjoyed and please give feedback, it really helps the project")
	game_end()
}else{
	ground = 0
	inked = 0
	with obj_wall{
		if not place_meeting(x,y-sprite_height,obj_wall) and not place_meeting(x,y-sprite_height,obj_water){
			obj_end.ground += 1
			if up = true and up_color = obj_player.color{
				obj_end.inked += 1
			}
		}
	}
	perc_inked=("percentage inked: "+ string((inked/ground)*100) + "%")
	sc_addscore(inked/ground*1000)
	room_goto(room_next(room))
}