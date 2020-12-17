/// @description Insert description here
// You can write your code in this editor
//draw_triangle_color(x-hsp*4,y-vsp*4,x-(sprite_width / 2)-1,y,x+(sprite_width / 2)-1,y,image_blend,image_blend,image_blend,false)
if obj_optionshandler.mb{
	sc_motionblur(distance_to_point(xprevious,yprevious)*2,point_direction(xprevious,yprevious,x,y))
}else{
	draw_self()
}