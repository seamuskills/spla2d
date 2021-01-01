/// @description Insert description here
// You can write your code in this editor
draw_self()
draw_set_halign(fa_center)
draw_set_valign(fa_center)
if obj_optionshandler.gp{
	draw_text_transformed(x,y,"main menu (a)",0.50,0.50,0)
}else{
	draw_text_transformed(x,y,"main menu",0.50,0.50,0)	
}