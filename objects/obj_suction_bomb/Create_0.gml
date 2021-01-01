/// @description Insert description here
// You can write your code in this editor

var dir = point_direction(x,y,mouse_x,mouse_y)
if obj_optionshandler.gp{
	dir = point_direction(x,y,obj_player.x+gamepad_axis_value(0,gp_axisrh),obj_player.y+gamepad_axis_value(0,gp_axisrv))
}
var pwr = 6

fuse = 5 * room_speed

hsp = lengthdir_x(pwr,dir)
vsp = lengthdir_y(pwr,dir)

image_blend = obj_player.color

airborne = true