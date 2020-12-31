/// @description Insert description here
// You can write your code in this editor
var dir = point_direction(x,y,mouse_x+random_range(-10,10),mouse_y+random_range(-10,10))
var pwr = 6
damage = 31
ogdamage = damage
alarm[0]=1

hsp = lengthdir_x(pwr,dir)
vsp = lengthdir_y(pwr,dir)