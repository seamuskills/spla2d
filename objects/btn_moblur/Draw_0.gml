/// @description Insert description here
// You can write your code in this editor
draw_self()
draw_set_halign(fa_center)
draw_set_valign(fa_center)
if obj_optionshandler.mb = true{
	draw_text_transformed(x,y,"bullet blur:on",0.50,0.50,0)
}
if obj_optionshandler.mb = false{
	draw_text_transformed(x,y,"bullet blur:off",0.50,0.50,0)
}
if display_snipet{
	draw_button(mouse_x,mouse_y,mouse_x+64,mouse_y+80,false)
	draw_set_color(c_black)
	draw_text_ext(mouse_x+32,mouse_y+30,"adds motion blur to bullets",13,44)
	draw_set_color(c_white)
}