/// @description Insert description here
// You can write your code in this editor
vsp += obj_player.grav /2
direction -= hsp
if place_meeting(x+hsp,y,obj_wall){
	while not place_meeting(x+sign(hsp),y,obj_wall){
		if hsp = 0{
			break
		}
		x+= sign(hsp)
	}
	hsp = (hsp / 2) * -1
}
x += hsp

if place_meeting(x,y+vsp,obj_wall){
	while not place_meeting(x,y+sign(vsp),obj_wall){
		y+= sign(vsp)
	}
	vsp = (vsp / 2) * -1
}
if place_meeting(x,y+vsp,obj_grate){
	while not place_meeting(x,y+sign(vsp),obj_grate){
		y+= sign(vsp)
	}
	vsp = (vsp / 2) * -1
}
y += vsp
if fuse = 0{
	for (i=0; i < (64*6); i+=6){
		bullet = instance_create_layer(x,y,layer,obj_ink_spray)
		bullet.image_blend=image_blend
		bullet.hsp = lengthdir_x(3,i)
		bullet.vsp = lengthdir_y(3,i)
	}
	audio_play_sound(sfx_explode,1,false)
	instance_destroy()
}
if fuse < 1 * room_speed and fuse > 0{
//	image_xscale+= 0.005
//	image_yscale+= 0.005
}
if place_meeting(x,y+1,obj_wall){
	fuse -= 1
}