/// @description Insert description here
// You can write your code in this editor

var dir = point_direction(x,y,mouse_x,mouse_y)
var pwr = 6

fuse = 0

hsp = lengthdir_x(pwr,dir)
vsp = lengthdir_y(pwr,dir)

image_blend = obj_player.color

airborne = true

image_speed = 0