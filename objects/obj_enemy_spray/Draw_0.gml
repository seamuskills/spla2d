/// @description Insert description here
// You can write your code in this editor
if obj_optionshandler.mb{
	sc_motionblur(distance_to_point(xprevious,yprevious)*2,point_direction(xprevious,yprevious,x,y))
}else{
	draw_self()
}