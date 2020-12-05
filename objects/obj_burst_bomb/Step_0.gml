/// @description Insert description here
// You can write your code in this editor
if airborne{
direction = point_direction(xprevious,yprevious,x,y)	

vsp += obj_player.grav /2

if place_meeting(x+hsp,y+vsp,obj_enemy){
	airborne = false
	vsp = 0
	hsp = 0
}

if place_meeting(x+hsp,y,obj_wall){
	while not place_meeting(x+sign(hsp),y,obj_wall){
		if hsp = 0{
			break
		}
		x+= sign(hsp)
	}
	hsp = 0
	airborne = false
	xdif = instance_nearest(x,y,obj_wall).x-x
	ydif = instance_nearest(x,y,obj_wall).y-y
	if abs(xdif) > abs(ydif){
		direction = point_direction(x,y,instance_nearest(x,y,obj_wall).x,y)
	}else{
		direction = point_direction(x,y,x,instance_nearest(x,y,obj_wall).y)
	}
}
x += hsp

if place_meeting(x,y+vsp,obj_wall){
	while not place_meeting(x,y+sign(vsp),obj_wall){
		y+= sign(vsp)
	}
	vsp = 0
	airborne = false
	xdif = instance_nearest(x,y,obj_wall).x-x
	ydif = instance_nearest(x,y,obj_wall).y-y
	if abs(xdif) > abs(ydif){
		direction = point_direction(x,y,instance_nearest(x,y,obj_wall).x,y)
	}else{
		direction = point_direction(x,y,x,instance_nearest(x,y,obj_wall).y)
	}
	airborne = false
}
if place_meeting(x,y+vsp,obj_grate){
	while not place_meeting(x,y+sign(vsp),obj_grate){
		y+= sign(vsp)
	}
	vsp = 0
	airborne=false
	xdif = instance_nearest(x,y,obj_grate).x-x
	ydif = instance_nearest(x,y,obj_grate).y-y
	if abs(xdif) > abs(ydif){
		direction = point_direction(x,y,instance_nearest(x,y,obj_grate).x,y)
	}else{
		direction = point_direction(x,y,x,instance_nearest(x,y,obj_grate).y)
	}
}
y += vsp
}else{
if fuse = 0{
	for (i=0; i < (64*6); i+=6){
		bullet = instance_create_layer(x,y,layer,obj_ink_spray)
		bullet.image_blend=image_blend
		bullet.hsp = lengthdir_x(3,i)
		bullet.vsp = lengthdir_y(3,i)
		bullet.damage = bullet.damage/8
	}
	audio_play_sound(sfx_explode,1,false)
	instance_destroy()
}
}
image_angle = direction