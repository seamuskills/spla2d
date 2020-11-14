/// @description Insert description here
// You can write your code in this editor
draw_set_font(splat_font_2)
draw_self()
draw_set_halign(fa_center)
draw_set_valign(fa_center)
if weapon = 1{
	draw_text_transformed(x,y,"weapon:charger",0.5,0.5,0)
}
if weapon = 0{
	draw_text_transformed(x,y,"weapon:shooter",0.5,0.5,0)
}