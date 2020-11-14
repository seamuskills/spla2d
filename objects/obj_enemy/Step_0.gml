/// @description Insert description here
// You can write your code in this editor
if distance_to_object(obj_player) > (5 * 16){
	if collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,true){
		var col_list_2 = ds_list_create()
		collision_line_list(x,y,obj_player.x,obj_player.y,obj_wall,false,true,col_list_2,true)
		for (i = 0;i<ds_list_size(col_list_2);i++){
			object = col_list_2[| i]
			if object.object_index != obj_grate{
				col2 = true
				break
			}else{
				col2 = false
			}
		}
		ds_list_destroy(col_list_2)
	}else{
		col2 = false
	}
	if not distance_to_object(instance_nearest(x,y,obj_splat_bomb)) < 5 * 16{
		if obj_player.squid = false or obj_player.in_ink!=1{
			if not col2{
				if x > obj_player.x{
					move=-1
				}
				if x < obj_player.x{
					move=1
				}
			}else{
				move=0	
			}
		}else{
			move=0
		}
	}
	
	if place_meeting(x,y+1,obj_wall){
		if instance_place(x,y+1,obj_wall).up_color = color and instance_place(x,y+1,obj_wall).up = true{
			in_ink = 1
		}else{
			if instance_place(x,y+1,obj_wall).up = false{
				in_ink = 0
			}
		}
		if instance_place(x,y+1,obj_wall).up = true and instance_place(x,y+1,obj_wall).up_color = c_orange{
			in_ink=-1
		}
	}


	if in_ink = 0{
		hsp = move * (walksp)
	}else{
		if in_ink=1{
			hsp = move*(walksp)
		}
		if in_ink = -1{
			hsp = move * (walksp/2)
		}
	}
}else{
	hsp = 0
	if canfire and bullets_fired < 10{
		if collision_line(x,y,obj_player.x,obj_player.y,obj_wall,false,true){
		var col_list = ds_list_create()
		collision_line_list(x,y,obj_player.x,obj_player.y,obj_wall,false,true,col_list,true)
		for (i = 0;i<ds_list_size(col_list);i++){
			object = col_list[| i]
			if object.object_index != obj_grate{
				col = true
				break
			}else{
				col = false
			}
		}
		ds_list_destroy(col_list)
		}else{
			col = false
		}
		if obj_player.squid = false or obj_player.in_ink!=1{
			if not col{
			audio_play_sound(sfx_shoot,0,false)
			bullet = instance_create_layer(x,y,layer,obj_enemy_spray)
//			aim_dir = point_direction(x,y,obj_player.x,obj_player.y-12)
			aim_dir = point_direction(x,y,obj_player.x,obj_player.y-distance_to_object(obj_player)/4)
			bullet.hsp = lengthdir_x(6,aim_dir)
			bullet.vsp = lengthdir_y(6,aim_dir)
			canfire=false
			alarm[0] = 0.2 * room_speed
			bullets_fired += 1
			alarm[1] = 1 * room_speed
			}
		}
	}
}
if instance_exists(obj_splat_bomb){
	if distance_to_object(instance_nearest(x,y,obj_splat_bomb)) < 5 * 16 and not collision_line(x,y,instance_nearest(x,y,obj_splat_bomb).x,instance_nearest(x,y,obj_splat_bomb).y,obj_wall,false,true){
		time_reacted += 1
		reaction=2
		if time_reacted >= reaction_time{
			if x > instance_nearest(x,y,obj_splat_bomb).x{
				move=1
			}
			if x < instance_nearest(x,y,obj_splat_bomb).x{
				move=-1
			}
		}
	}
	if in_ink = 0{
	hsp = move * (walksp)
	}else{
		if in_ink=1{
			hsp = move*(walksp)
		}
		if in_ink = -1{
			hsp = move * (walksp/2)
		}
	}
}else{
	if reaction = 2{
		time_reacted = 0
	}
}
if place_meeting(x+hsp,y,obj_wall){
	while not place_meeting(x+sign(hsp),y,obj_wall){
		x+=sign(hsp)
	}
	if not place_meeting(x+sign(hsp),y-16,obj_wall) and place_meeting(x,y+1,obj_wall){
		vsp = obj_player.jump_force
		audio_play_sound(sfx_jump,1,false)
	}
	hsp = 0
}
x+=hsp

if not place_meeting(x,y+1,obj_wall){
	vsp += grav
}
if place_meeting(x,y+vsp,obj_wall){
	while not place_meeting(x,y+sign(vsp),obj_wall){
		y+=sign(vsp)
	}
	vsp=0
}
if hp < 100{
	hp += 0.05
}
if hp <= 0{
	audio_play_sound(sfx_explode,1,false)
	var i
	for (i=0; i < (32*6); i+=6){
		bullet = instance_create_layer(x,y,layer,obj_ink_spray)
		bullet.image_blend=obj_player.color
		bullet.hsp = lengthdir_x(3,i)
		bullet.vsp = lengthdir_y(3,i)
		bullet.damage = 5
	}
	sc_addscore(50)
	soul = instance_create_layer(x,y,layer,obj_soul)
	soul.image_blend = color
	instance_destroy()
}

if time_reacted > 0 and time_reacted < reaction_time{
	exc = 1
}
if time_reacted >= reaction_time{
	exc = 2
}
if time_reacted = 0{
	exc = 0
}

y+=vsp
image_blend=merge_color(obj_player.color,color,hp/100)

if y > room_height or place_meeting(x,y,obj_water){
	hp = 0
}