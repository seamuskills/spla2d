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
}
