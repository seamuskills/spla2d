/// @description Insert description here
// You can write your code in this editor
var i = 0
draw_set_font(splat_font_2)
draw_set_halign(fa_center)
repeat (buttons){
	draw_set_color(c_white)
	if menu_index = i{
		draw_set_color(colors[obj_optionshandler.pcolor])
	}
	draw_text(menu_x,menu_y+button_h*i,button[page][i])
	i++
	if i = 3 and page = 1{
		if bomb = 0{
			draw_sprite_ext(spr_splatbomb,1,menu_x-128,menu_y+button_h*i,0.5,0.5,direction,colors[obj_optionshandler.pcolor],1)

			draw_sprite_ext(spr_splatbomb,0,menu_x-128,menu_y+button_h*i,0.5,0.5,direction,c_white,1)
		}
		if bomb = 1{
			draw_sprite_ext(spr_suction_bomb,1,menu_x-128,menu_y+button_h*i,0.5,0.5,direction,colors[obj_optionshandler.pcolor],1)

			draw_sprite_ext(spr_suction_bomb,0,menu_x-128,menu_y+button_h*i,0.5,0.5,direction,c_white,1)
		}
		if bomb = 2{
			draw_sprite_ext(spr_burst_bomb,1,menu_x-128,menu_y+button_h*i,0.5,0.5,direction,colors[obj_optionshandler.pcolor],1)

			draw_sprite_ext(spr_burst_bomb,0,menu_x-128,menu_y+button_h*i,0.5,0.5,direction,c_white,1)
		}
	}
}
